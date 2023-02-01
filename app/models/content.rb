class Content < ApplicationRecord
  belongs_to :user
  include UidModule
  def soft_destroy
    update(deleted_at: Time.current)
  end

  def self.active
    where(deleted_at: nil)
  end

  def save_generated_output
    update(output_body: generate_output)
  end

  def generate_output
    Content.generate_a_sentence(input_words)
  end

  def self.generate_a_sentence(keyword)
    require 'net/http'
    uri = URI.parse("https://api.openai.com/v1/completions")
    req = Net::HTTP::Post.new(uri)
    body = {"model": "text-davinci-003", "temperature": 0.2, "max_tokens": 20}
    keywords_txt = keyword
    body["prompt"] = "create a sentence in English with: #{keywords_txt}"
    req.body = body.to_json
    headers = { "Authorization" => "Bearer #{ENV['OPENAI_KEY']}", "Content-Type" => "application/json" };
    headers.each{|name, value| req[name] = value}
    http = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true)
    response_raw = http.request(req)
    response = JSON.parse(response_raw.body)
    response["choices"][0]["text"].strip!
  end
end

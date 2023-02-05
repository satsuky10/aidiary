AI　英文ジェネレーター
====

GPT-3を使った英文生成アプリケーションです。


## App

[English Sentence Generator](https://esg.herokuapp.com/)

![esg](https://user-images.githubusercontent.com/12973113/216809159-fe357e21-9075-4ee2-9739-685a4c2ad443.png)

英単語を入力するとAIが入力された英単語を含んだオリジナルの英文を生成することができ、英語学習に役立つアプリケーションです。
- AIが生成した英文一覧を見ることができます
- サインインすると、生成画面から指定した英単語を含んだ英文を生成することができます

## Environment

- Rails[7.0.4]
- ruby[3.1.2]
- GPT-3[text-davinci-003]
- device
- tailwindcss
- PostgreSQL

## Usage

リポジトリをクローン
```
$ git clone https://github.com/satsuky10/aidiary.git
```

ライブラリのインストール
```
$ bundle install
```

データベースのセットアップ
```
$ rails db:create
$ rails db:migrate
```

APIキーの登録
1. [OPEN AI](https://openai.com/api/) のアカウントを作成
2. APIキーを[マイページ](https://platform.openai.com/account/api-keys)から発行
3. '.env' ファイルをプロジェクト直下に作成し以下のように記述（このときファイルがコミット対象にならないよう、.gitignoreに追加する）

.env
```
OPENAI_KEY='***************'
```

ローカルホストで起動
railsサーバ起動（アプリケーション）
```
$ bin/rails server -p 3000
```

tailwindcssサーバ起動（CSS）
```
$ bin/rails tailwindcss:watch
```

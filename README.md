# user
|カラム|データ|
|:--:|:--:|
|name|string|
|e-mail|string|
|password|string|

# task
|カラム|データ|
|:--:|:--:|
|user_id|integer|
|title|string|
|content|text|

# label
|カラム|データ|
|:--:|:--:|

# task_label
|カラム|データ|
|:--:|:--:|
|task_id|integer|
|label_id|integer|

# Herokuのデプロイ手順
### Herokuに新しいアプリケーションを作成する
> heroku create

### git push先のリモートURLを変更する
> git remote add heroku https://git.heroku.com/アプリ名.git

### 登録できたかを確認
> git remote -v

> heroku  https://git.heroku.com/アプリ名.git (fetch)
> heroku  https://git.heroku.com/アプリ名.git (push)
> origin  https://github.com/チームアカウント/アプリ名.git (fetch)
> origin  https://github.com/チームアカウント/アプリ名.git (push)
> こうなればOK

### step2ブランチの変更内容をHerokuのmasterブランチに反映する
> git push heroku step2:master
　

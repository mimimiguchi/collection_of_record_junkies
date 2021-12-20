# README

# アプリケーション名
Collection of Record Junkies

# アプリケーション概要
- 自分が所有しているレコードを管理することができる。
- 他のユーザーがどのようなレコードをコレクションとしているか見ることができる。
- 共通のレコードを所有しているユーザーのコレクションを確認することで、自分の好みにあった新しい曲と出会える事ができる。
- レコードの売買ができる。

# URL
https://collection-of-record-junkies.herokuapp.com/

# Basic認証
- ID: admin
- パスワード： 0831 

# テスト用アカウント
## 出品者用のユーザー情報
- メールアドレス： sell@test.com
- パスワード： sell222
## 購入者用のユーザー情報
- メールアドレス： buy@test.com
- パスワード： buy111
## 購入者用カード情報
- 番号：4242424242424242
- 期限：登録時より未来
- セキュリティコード：123


# 利用方法
## 投稿/出品・お気に入り登録方法
1. トップページの一覧ページのヘッダーからユーザー新規登録を行う。
2. collection投稿/出品ボタンから、レコードの情報（ジャケット画像・ジャンル・曲名・アーティスト名・レコードサイズ・回転数・管理状態）を入力し投稿または出品する。  
**なお出品する場合は、管理状態で出品を選択し、出品情報と販売価格も入力する。**
3. 一覧ページからcollectionをクリックし、collectionの詳細を確認する。
4. 気に入ったcollectionは「want record」ボタンを押して、wantリストに登録することができる。

## 購入方法
1. トップページの一覧ページのヘッダーからユーザー新規登録を行う。
2. 一覧ページから管理状態が「出品」となっているcollectionをクリックし、collectionの出品情報を確認する。
3. 「購入画面に進む」ボタンから、クレジット情報・配送先を入力し、購入する。

# アプリケーションを作成した背景
レコードを集めることが趣味である私は、以下3点をレコードショップに行く度に考えていた。
- 他人がどのようなレコードをコレクションしているのか、レコードショップで同じようにレコードを探す人を見る度に興味を持っていた。
- 自分と同じレコードを持っている人であれば、自分のまだ知らない自分好みのレコードを所有しているのではないだろか。
- レコードショップで探しているとき、このレコード過去に持っていた気がするが、現在持っているか把握できない。

上記３点を解消するため、collectionを共有でき新たな音楽に出会えるアプリケーションを開発することにした。

# 洗い出した要件
https://docs.google.com/spreadsheets/d/1ugj0pzGWUFpg3BWbMA9S7VesGSLtOb5SgP8KNCFBMso/edit#gid=982722306

# 実装した機能についての画像やGIFおよびその説明

## 投稿/出品機能
管理状態欄で投稿する場合は「コレクション」を、出品する場合は「出品」を選択する。
[![Image from Gyazo](https://i.gyazo.com/55da2b6ccbd14388091e5c57e7422ee0.gif)](https://gyazo.com/55da2b6ccbd14388091e5c57e7422ee0)

## want record機能
自身が投稿または出品していないcollectionで気になったり、今後購入したいレコードはcollectionの詳細ページで「want record」ボタンを押し、リストに登録する。
[![Image from Gyazo](https://i.gyazo.com/a1d978f43603397532de9d4be121b1ca.gif)](https://gyazo.com/a1d978f43603397532de9d4be121b1ca)

# 実装予定の機能
- ユーザーフォロー機能
- 出品時のレコードの状態登録機能
- カード情報・ユーザー情報（送り先）登録機能

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/fc2483058f85a203820dfdba33cd4fdd.png)](https://gyazo.com/fc2483058f85a203820dfdba33cd4fdd)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/31e40e253af1c8973383cdc1c37ae83d.png)](https://gyazo.com/31e40e253af1c8973383cdc1c37ae83d)

# 開発環境
- フロントエンド：HTML,CSS / JavaScript / jQuery
- バックエンド：Ruby (ver 2.6.5) /Ruby on Rails (ver 6.0.0)
- テスト：Rspec
- テキストエディタ：Visual Studio Code
- タスク管理：GitHubプロジェクトボード

# ローカルでの動作方法
以下、コマンドを順に実行。  
% git clone https://github.com/mimimiguchi/collection_of_record_junkies.git  
% cd collection_of_record_junkies  
% bundle install  
% yarn install
![badge](https://img.shields.io/badge/thank%20you-for%20visiting-brightgreen)
<br>
[![Rails](https://img.shields.io/badge/Rails-v6.0.4.1-%23a72332)](https://rubygems.org/gems/rails/versions/6.0.4.1)
[![codecov](https://img.shields.io/badge/-Vue.js-4FC08D.svg?logo=vue.js&style=plastic")](https://www.npmjs.com/package/vue/v/2.6.14)

<h1>ご縁箱（ごえんばこ）</h1>

<div align="center">
  <img src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/1191858/b4c030f2-3552-fe47-4e37-6d6400806216.jpeg" height=300px; />
</div>

<br>

## 概要
#### Twitter認証したユーザー同士でファンレターを交換し、それらを公開することが出来るサービスです。
#### Twitter上で楽しめるコミュニケーションツールとしても機能します。

<br>

<details>
<summary>どんな問題を解決する？</summary>『 Twitterで今ある ご縁を大切にしたい 』

『 フォロワーさんと感謝の気持ちを伝えたり、交流を深めたい！ 』

『 あの人に話しかけてみたい！ 』

けどきっかけがない..ちょっと億劫かも...

こういった問題も楽しみながら解決することが出来ます。

</details>

<br>

<details>
<summary>ご縁箱を使うとどうなる？</summary>実際に使ってみて...

・まだ話したことがなかったフォロワーさんと話すきっかけになった

・自分の率直な気持ちをレターを送って伝えることで喜んでもらえた

・ご飯の約束ができた

など
</details>

<br>

## サービスURL
### **https://goenbako.com**

<br>

**▼ 開発者のご縁箱ページ**
#### https://goenbako.com/outputky

<br>

## 使い方
1. Twitterでご縁箱ページをシェアする（シェアしなくても書くことで繋がっていくことも可）
2. ご縁箱ページを開設した知人にファンレターを書く・受け取る （投稿型）
3. レターの話題を選んでツイートシェア機能で共有する（※任意）

<br>

## 機能紹介
![image](https://user-images.githubusercontent.com/78721963/155685673-158df3bc-4f66-4e53-a89a-8c92f5a9579d.png)

**▼ 以下のリンクから実際のTwitterでの使われ方を閲覧することが出来ます**  

°˖✧[#goenbako_letters](https://twitter.com/search?q=%23goenbako_letters&src=typed_query&f=live) 、 [#みんなのご縁箱](https://twitter.com/search?q=%23%E3%81%BF%E3%82%93%E3%81%AA%E3%81%AE%E3%81%94%E7%B8%81%E7%AE%B1&src=typed_query&f=live)✧˖°

### メインページ

| トップページ | ご縁箱ページ | レター詳細ページ |
| :---: | :---: | :---: |
| <img width="100%" src="https://user-images.githubusercontent.com/78721963/155514886-d3bc1c7b-e400-40b1-bf39-e34d05144b72.png"> | <img width="750" src="https://user-images.githubusercontent.com/78721963/155518897-7e1d7003-8659-4106-8e3b-2db9668fec76.gif"> | <img width="730" src="https://user-images.githubusercontent.com/78721963/155947303-7459bb9e-2b94-43b7-ab60-940440a84ba1.gif"> |
| Twitter認証、使い方 | プロフィールとレターの公開（誰でも閲覧可） | Twitterからの遷移限定の詳細ページ（誰でも閲覧可） |

<br>

### メイン機能

| レターを書く | ご縁箱の共有 | レターの共有 |
| :---: | :---: | :---: |
| <img width="750" src="https://user-images.githubusercontent.com/78721963/155521812-eee2f94f-34ae-4220-8d25-4b33b64a930f.gif"> | <img width="750" src="https://user-images.githubusercontent.com/78721963/155523586-221ba855-b1e0-4d4c-8907-26dd0379aba1.png"> | <img width="730" src="https://user-images.githubusercontent.com/78721963/155607165-b03eb08d-29eb-4334-9c3a-6d743537d5c4.gif"> |
| ５つの話題を自由に選んで書くことが出来る | 自分のご縁箱ページをシェア | 受け取ったレターを選んでシェア |

<br>

<details>
<summary>レターの話題について補足</summary>テーマが『ファンレター』だけとすると抽象的で書きづらくなる問題があったため、関係性問わず誰でも負担少なく書けるようテーマを厳選しています。

![image](https://user-images.githubusercontent.com/78721963/153138815-fa2152c2-7eba-4fcf-8b53-ca9b2918bb0e.png)

</details>

<br>

### その他の機能

| ランダム訪問 | ユーザー検索 | 設定画面 |
| :---: | :---: | :---: |
| <img width="760" src="https://user-images.githubusercontent.com/78721963/153412733-60cf4bce-845d-4e88-862f-a17af925ecd6.gif"> | <img width="750" src="https://user-images.githubusercontent.com/78721963/155651314-5292d82a-3618-42af-a2ca-18b1903c5713.png"> | <img width="750" src="https://user-images.githubusercontent.com/78721963/155473003-da991f0a-6156-4a6c-8fd2-a129f3ebf36c.png"> |
| ご縁箱ページをランダムに訪問出来る（誰でも閲覧可） | TwitterIDで検索。失敗時に開設リクエスト案内(任意) | メール通知設定、Twitterアカウント情報の再取得 |

<br>

## 使用技術

#### バックエンド
- Ruby (2.7.4)
- Rails (6.0.4.1)
<br>

<details>
<summary>Gem</summary>sorcery ・・・ Twitterの認証周り

carrierwave ・・・ 受け取ったレターのアップロードのために使用

meta-tags ・・・ 複数のmetaタグ設定を最適化に使用

twitter ・・・ Twitterプロフを再取得する機能実装に使用

rubocop ・・・ Railsのコード最適化

administrate ・・・ 管理画面

</details>

<br>

#### フロントエンド
- JavaScript
- Vue.js (2.6.14)
- HTML
- CSS
<br>

<details>
<summary>ライブラリ</summary>vuetify ・・・　CSSフレームワーク・Vue.jsを使う決め手となった

vue-router ・・・ SPA構築のルーティング

vuex　・・・・・・ 状態管理 ログイン、フラッシュ、初心者のためのヘルプボックス表示に使用

vuex-persistedstate ・・・ ログインユーザの状態をcookieに保持する

js-cookie ・・・ cookieに保存したstateを操作する際に使用

axios ・・・ リクエストを投げてサーバとデータの取得や送信のやり取りを行う

vee-validate ・・・ E-mailの入力フォームに使用

vue-gtag ・・・ Googleアナリティクスの設定

eslint ・・・ リントチェック
</details>

<br>

### インフラ
- heroku
- Amazon S3
- PostgreSQL

<br>

## ER図
![](https://user-images.githubusercontent.com/78721963/155874501-20816bb6-9f96-48db-8cbd-c2f3498fcf1d.png)

## その他
<br>

<img src="https://img.shields.io/badge/-Qiita-55C500.svg?logo=&style=flat-square">[【個人開発】Twitterで映える！ファンレターを交換・シェアして楽しめるサービス『ご縁箱』をリリースしました✧˖°。](https://qiita.com/o83184206/items/dcab2743fea236f0aa67)

#### 2022/3/22 現在
- #### 総PV数・・・25,000回を突破
- #### UU数・・・・900人を突破
- #### 会員数 ・・・130人を突破

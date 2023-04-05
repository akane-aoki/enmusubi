  <img src="/assets/images/ogp.png">

  ▼**サービスURL**

    <a href="https://enkyori-enmusubi.com">https://enkyori-enmusubi.com</a>

  ▼**紹介記事**

    [【個人開発】「遠距離恋愛」をしている人のためのカップルアプリを開発しました！](https://qiita.com/akane_zark/items/9e90615b40f4353c4e1a)

## ■サービス概要
  「遠結び」は、遠距離恋愛中で、恋人と会えない寂しさを抱えている方に、
  会えない時間を充実させ、楽しみに変えてくれるサービスです。

## ■メインのターゲットユーザー
  遠距離恋愛をしている男女

## ■ユーザーが抱える課題
- 恋人と会えない期間がつらい、さみしい
- 恋人と会えない間、どこに出かけても幸せそうなカップルばかりが目につき、イキイキと過ごせない
- 恋人と会えない期間が長くなると、相手の気持ちが離れているのではないかと不安になる

## ■解決方法
  恋人と会えない期間を、次会う日までお互いに頑張る時間に変えたり、頑張った分のご褒美を設定したりする機能を通して、楽しく有意義な時間にします。

## ■サービス画面
#### レスポンシブ対応しているため、スマホでもパソコンでも使うことができます。
---
#### サービストップ画面
  <a href="https://gyazo.com/5a0e2326ed05f175f5d81a43753c8fe3"><img src="https://i.gyazo.com/5a0e2326ed05f175f5d81a43753c8fe3.png" alt="Image from Gyazo" width="1000"/></a>

#### ログイン後のダッシュボード画面（イメージ）
  <a href="https://gyazo.com/a1bf863bffa7aac91d31cb304ce1dd9b"><img src="https://i.gyazo.com/a1bf863bffa7aac91d31cb304ce1dd9b.png" alt="Image from Gyazo" width="1000"/></a>
  ダッシュボードから、各画面へ遷移することができます。

## ■実装済みの機能
【MVPリリース】
- ユーザー登録、ログイン、ログアウト機能
- ゲストログイン機能（ダッシュボードや一部機能のみ利用可能）
- 次会える日までのカウントダウン機能
- 次会える日、今まで会った日の設定、編集、削除機能
- 会えていない日数に応じたごほうび設定、編集機能
- 会えない間にがんばることの登録機能
- がんばったことの投稿、詳細、編集、削除機能
- 投稿へのコメント投稿、削除機能
- お互いが行き来した回数から算出した総移動距離を表示する機能
- 総移動距離に合わせて、おおよそ東京からどこまでの距離に値するか表示する機能
- プロフィール表示、編集機能

**【本リリース】**
- 恋人の登録（招待）機能
- パスワードリセット機能
- お問い合わせ管理
- 利用規約、プライバシーポリシー作成
- 独自ドメイン取得、SSL化
- GoogleAnalyticsの導入
- ロゴの作成
- OGP、favicon等の作成
- アバター、投稿画像編集時のプレビュー表示
- その他細かいデザイン修正

**【ユーザーが使える機能】**
- 未ログインユーザー
  - ユーザー登録機能
  - 問い合わせ機能
  - 利用規約
  - プライバシーポリシー
- ログインユーザー
  - ログアウト機能
  - 恋人登録・招待機能
  - 退会機能
  - パスワードリセット機能
- 管理ユーザー
  - ユーザー管理(一覧・詳細・編集・削除)
  - 投稿管理(一覧・詳細・編集・削除)
  - 問い合わせ管理(一覧・詳細)
  - お知らせ管理(一覧・作成・詳細・編集・削除)

## ■今後追加したい機能
- 会えていない日数に応じて、かわいいわんこが励ましたりアドバイスをくれたりする機能
- カウントダウンのLINE通知機能
- LINEを使った招待機能
- 会ったときに行く場所を選定する機能
- 退会機能作成
- 管理画面作成

## ■なぜこのサービスを作りたいのか？
  私自身、社会人になってからほとんど遠距離恋愛だったので、会いたいときに会えない辛さや寂しさを強く感じてきました。<br>
  しかし、遠距離だからこそ、一人の時間を使って自分磨きをするなど、自分自身を成長させる良い機会になると気づきました。<br>
  また、久しぶりに会えたときの喜びや、会うまでのワクワク感、毎回会うときは旅行気分になれるなど、遠距離だからこその楽しみや喜びもあります。<br>
  遠距離恋愛を頑張っている人たちが、恋人と会えない期間を自分自身を成長させる時間に変え、少しでも楽しく過ごし、いつかは縁を結べることを願い、このサービスを作成しました。

## ■主な使用技術
**【バックエンド】**
- Ruby on Rails（7.0.4）
- Ruby（3.2.0）

**【フロントエンド】**
- JavaScript
- Tailwind CSS
- daisyUI

**【Gem】**
- geocoder

**【API】**
- Google Maps API（Geocoding API）

**【インフラ】**
- heroku
- AWS（S3）

## ■画面遷移図
https://www.figma.com/file/mchCAMYEzoKdhiBCZS7A1O/%E3%83%9D%E3%83%BC%E3%83%88%E3%83%95%E3%82%A9%E3%83%AA%E3%82%AA%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?node-id=0%3A1&t=wTeHBsLjQh2v487c-1

## ■ER図
<a href="https://gyazo.com/36981b6d85d21fb512d2e48df49cb360"><img src="https://i.gyazo.com/36981b6d85d21fb512d2e48df49cb360.png" alt="Image from Gyazo" width="1050"/></a>
## ■スケジュール
```
　1. 企画（アイデア企画・技術調査）：1/8〆切
　2. 設計（README作成・画面遷移図作成・ER図作成）：1/15
　3. メイン機能実装：1/16 - 2/15
　4. β版をRUNTEQ内リリース（MVP）：2/18
　5. 本リリース：3/17
```

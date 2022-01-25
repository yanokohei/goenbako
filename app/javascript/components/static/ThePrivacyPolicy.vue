<template>
  <v-dialog
    v-model="isVisiblePrivacyPolicyModal"
    max-width="800"
    scrollable
    @click:outside="hundleClosePrivacyPolicyModal"
  >
    <v-card class="privacy-policy">
      <v-card-text style="height: 90%;">
        <h1>プライバシーポリシー</h1>
        <h2>取得する情報</h2>
        <p>
          本サービスはユーザーから以下の情報を取得します。
        </p>
        <ul>
          <li>
            外部サービスのプライバシー設定によりお客様が連携先に開示を認めた情報
          </li>
          <li>Cookie(クッキー)を用いて生成された識別情報</li>
          <li>
            OSが生成するID、端末の種類、端末識別子等のお客様が利用するOSや端末に関する情報
          </li>
          <li>
            当社ウェブサイトの滞在時間、入力履歴、購買履歴等の当社ウェブサイトにおけるお客様の行動履歴
          </li>
          <li>当社アプリの起動時間、入力履歴、購買履歴等の当社アプリの利用履歴</li>
        </ul>

        <h2>情報を利用する目的</h2>
        <p>
          本サービスは、ユーザーから取得した情報を以下の目的のために利用します。
        </p>
        <ul>
          <li>当社サービスに関する登録の受付、お客様の本人確認、認証のため</li>
          <li>お客様の当社サービスの利用履歴を管理するため</li>
          <li>
            ユーザーの行動履歴を分析し、本サービスの維持改善に役立てるため
          </li>
          <li>市場分析、マーケティングのため</li>
          <li>ユーザーのお問い合わせに対応するため</li>
          <li>本サービスの規約や法令に違反する行為に対応するため</li>
          <li>本サービスの変更、提供中止、終了、契約解除をご連絡するため</li>
          <li>本サービスの規約の変更等を通知するため</li>
          <li>以上の他、サービスの提供、維持、保護及び改善のため</li>
        </ul>

        <h2>第三者提供</h2>
        <p>
          本サービスは、ユーザーから取得する情報のうち、個人データ（個人情報保護法第２条第６項）に該当するものついては、あらかじめユーザーの同意を得ずに、第三者（日本国外にある者を含みます。）に提供しません。
        </p>
        <p>
          但し、次の場合は除きます。
        </p>
        <ul>
          <li>個人データの取扱いを外部に委託する場合</li>
          <li>本サービスが買収された場合</li>
          <li>
            事業パートナーと共同利用する場合（具体的な共同利用がある場合は、その内容を別途公表します。）
          </li>
          <li>その他、法律によって合法的に第三者提供が許されている場合</li>
        </ul>

        <h2>アクセス解析ツール</h2>
        <p>
          本サービスは、ユーザーのアクセス解析のために、「Googleアナリティクス」を利用しています。Googleアナリティクスは、トラフィックデータの収集のためにCookieを使用しています。トラフィックデータは匿名で収集されており、個人を特定するものではありません。Cookieを無効にすれば、これらの情報の収集を拒否することができます。詳しくはお使いのブラウザの設定をご確認ください。Googleアナリティクスについて、詳しくは以下からご確認ください。
        </p>
        <p>https://marketingplatform.google.com/about/analytics/terms/jp/</p>

        <h2>プライバシーポリシーの変更</h2>
        <p>
          本サービスは、必要に応じて、このプライバシーポリシーの内容を変更します。
        </p>
        <h2>お問い合わせ</h2>
        <p>
          お問い合わせの際は、公式アカウントのメッセージにて承ります。
        </p>
        <div class="text-center">
          <v-btn
            icon
            color="blue"
            href="https://twitter.com/goenbako"
            style="text-transform: none"
          >
            <v-icon>mdi-twitter</v-icon>(@goenbako)
          </v-btn>
        </div>
      </v-card-text>
      <v-card-actions justify="center">
        <v-btn @click="hundleClosePrivacyPolicyModal">
          閉じる
        </v-btn>
      </v-card-actions>
    </v-card>
  </v-dialog>
</template>

<script>
export default {
  props: {
    isVisiblePrivacyPolicyModal: {
      type: Boolean,
      required: true,
      default: false,
    },
  },
  methods: {
    hundleClosePrivacyPolicyModal() {
      this.$emit("close-privacy-policy-modal");
    },
  },
};
</script>
<style scoped>
h1 {
  margin-top: 20px;
  margin-bottom: 10px;
  font-size: 1.5em;
}
h2,
h3 {
  margin-top: 15px;
  font-size: 1em;

}
.v-application p {
  line-height: 1.7rem;
  margin-top: 0.3rem;
  margin-left: 10px;
  margin-bottom: 0.3rem;
  font-size: 1em;
}
ul {
  margin-left: 15px;
  font-size: 1em;
}
ul li {
  line-height: 1.7rem;
  font-size: 1em;
}
.privacy-policy {
  margin-bottom: 20px;
  font-family: sans-serif;
}
</style>

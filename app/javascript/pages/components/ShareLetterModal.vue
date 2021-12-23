<template>
  <v-dialog
    v-model="isVisibleShareLetterModal"
    @click:outside="handleCloseModal"
    max-width="625"
  >
    <v-card color="amber lighten-5">
      <v-card-title>
        <span class="m-font">レターをシェアする</span>
        <v-icon>mdi-email-edit-outline</v-icon>
      </v-card-title>
      <v-divider />
      <!-- シェア項目1 -->
    <div v-for="(letterTitle, index) in letterTitles()" :key="index">
      <v-col class="text-center mt-4">
        <div
          class="s-font"
        >{{ letterTitle.message }}</div>
<!-- ボタンを押したら項目に応じたデータを指定しSVGタグ側のデータに反映させる -->
        <v-card-actions class="justify-center">
          <v-btn
            color="blue"
            class="white--text"
            x-small
            :href="twitterShare()"
          >
            <v-icon>mdi-twitter</v-icon>
            シェアする
          </v-btn>
        </v-card-actions>
        <v-card-actions class="justify-center">
          <v-btn
            color="#FCFCFC"
            x-small
            @click="svgToPng(letterTitle)"
          >
            <v-icon>mdi-sync</v-icon>
            変換する
          </v-btn>
        </v-card-actions>
      </v-col>
    </div>
      <!-- 閉じる -->
      <v-row
        justify="center"
        class="ma-4"
      >
        <v-card-actions>
          <v-btn
            large
            @click="handleCloseModal"
          >
            閉じる
          </v-btn>
        </v-card-actions>
      </v-row>
<!-- SVG要素を非表示のまま変換(本番ではhiddenにする) -->
      <div>
        <img src="" id="converted-image">
      </div>
      <div>
        <svg ref="svgArea" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" width="600" height="314" viewBox="0 0 600 314"><g data-name="レイヤー 2"><g data-name="letter flame"><path fill="#fbf1ff" d="M0 0h600v314H0z"/><path d="M29.8 294.27c-2.948 2.494-12.225 3.474-10.366-4.077 2.595.615 7.791.891 10.3-.267Z" fill="#918dd7"/><path d="M30.039 294.178c.2.92-4.051 1.563-4.38 1.845-.364-6.231-.077-5.129 4.317-6.189Z" fill="#918dd7"/><path d="M29.739 289.925c-3.192 2.062-15.908.572-7.226-3.81 2.654-.493 7.22-1.459 7.226 3.81Z" fill="#f2d83a"/><path d="M40.509 272.1c-.824.678-.587.417-.255-.159 2.188-5.866-4.093-1.2-1.042.491.31 7.037 5.781-1.922 1.297-.332Zm-.759-.71c-.531.494-.9-.5-.386-.886.58-.536.914.56.386.886Zm1.649 2.1c-.546.987-1.883.881-.754-.436.4-.546 1.188-.418.754.436Z" fill="#231815"/><path d="M42.562 267.229c-1.786.907-.674 4.816 1.152 3.733 1.8-.898.65-4.797-1.152-3.733Zm.318 2.848c-.722-.4-.611-2.065.246-2.045 1.086.035.915 2.591-.246 2.045Z" fill="#231815"/><path d="M47.506 267.8c-.373.559-1.208 1.53-1.56.209 1.632-.344 2.326-.968 1.233-2.215-2.448-1.536-2.8 4.512-.29 3.788.832-.152 1.631-1.676.617-1.782Zm-.609-1.012c-.218.08-.819.276-1.032.337-.038-.5.991-.917 1.032-.338ZM51.242 266.117c-1.173-3.535-3.864.625-2.012 2.834 1.047-.43-.471-2.905.884-3.125.675.084.354 1.9.491 2.474.934 1.719.773-1.609.637-2.183ZM54.04 264.908a.981.981 0 0 0-.727.216c.346-7.475-2.152 4.975-.246 3.383 2.039 1.978 3.368-3.283.973-3.599Zm.553 2.078a.838.838 0 0 1-.665.935.79.79 0 0 1-.735-.846 1.161 1.161 0 0 1 .018-.25.837.837 0 0 1 .665-.935.791.791 0 0 1 .735.846 1.161 1.161 0 0 1-.018.25Z" fill="#231815"/><path d="M58.03 268.186c1.5-3.923-3.5-2.324-1.268-1.552.144-.262.954-.117.7.416-4.68-.123 1.484 5.389.568 1.136Zm-.7-.254c.065.745-.885.97-.924.226.038-.306.63-.274.924-.226ZM61.965 268.392c.391-1.453-2.029-.071-1.772-.266-.071-.324 1.59-3.4.221-3.157-.209 1.049-2.412 5.235-1.044 5.513 1-2.844.485-.013 1.335.9 1.738-.582-1.338-2.241 1.26-2.99Z" fill="#231815"/><path d="M64.113 269.33c-1.706-1.418-3.215 2.263-1.54 3.465 1.698 1.433 3.195-2.262 1.54-3.465Zm-.365.819c.825.607.016 2.521-.805 1.813-.831-.608-.041-2.512.805-1.813Z" fill="#231815"/><path d="M77.361 298.4c-1.32-3.148 1.032-13.238 3.506-5.823-.304 4.837 1.504 6.399-3.506 5.823Z" fill="#918dd7"/><path d="M77.179 292.6a2.211 2.211 0 0 1 1.74-2.473 2.073 2.073 0 0 1 1.943 2.214v.241Z" fill="#f2d83a"/><path d="M77.179 292.45c1.007.353 4.434-1.125 3.684 1.6-1.004-.357-4.432 1.121-3.684-1.6Z" fill="#fff"/><path fill="none" d="M76.643 292.341h4.76M76.643 294.083h4.76"/><path d="M45.54 277.927c1.147-.023 1.147 2.415 0 2.4-1.146.015-1.146-2.421 0-2.4Z" fill="#918dd7"/><path d="M45.54 280.759c-1.567.03-1.567-3.3 0-3.272 1.568-.03 1.568 3.303 0 3.272Zm0-2.39c-.723-.015-.723 1.523 0 1.508.723.015.723-1.523 0-1.508Z"/><path d="M48.786 277.927c1.146-.023 1.146 2.415 0 2.4-1.147.015-1.147-2.421 0-2.4Z" fill="#f2d83a"/><path d="M48.786 280.759c-1.568.03-1.568-3.3 0-3.272 1.567-.03 1.567 3.303 0 3.272Zm0-2.39c-.724-.015-.724 1.523 0 1.508.723.015.723-1.523 0-1.508ZM45.792 281.575c-.946 1.325-9.128-.5-9.718 1.182-.274 1.354 7.5.371 7.89.655-.075 1.363-3.167 5.528.106 3.394.642-1.433 4.553-4.316 1.722-5.231ZM45.76 296.3c-4.077.541-7.764 1.382-9.484-3.044-4.176 4.596 11.124 7.401 9.484 3.044ZM68.961 293.982c-.282.561-1.525 1.01-1.364 1.709 1.056 1.969 3.574-2.491 1.364-1.709ZM74.583 294.939c-.713-.3-1.135-1.459-1.818-.912-.955 1.361 2.226 2.901 1.818.912Z"/><path d="M74.684 289.359c-.655-2.9-1.584.6-2.66.137.214-4.037-1.736-4.6-1.415-.114-2.746-.085-3.362 1.354-.082 1.116.521.7-.7 9.081.737 8.949 1.474.164.233-8.252.758-8.948.749-.12 2.713.533 2.662-1.14Z"/><path d="M74.461 281.24c-.54.772-2.961 1.1-3.734.7.958-5.409-1.825.556-2.726 2.6.176 1.347 1.723-.457 2.17-1.389.075-.13 1.176-.187 1.212.023-.246 2.737 1.569 2.251 1.413-.114 1.015.414 3.657-.609 1.665-1.82ZM81.919 281.24c-.534.775-2.881 1.1-3.667.7 1-5.4-1.834.542-2.708 2.6.518 1.954 2.219-2.6 3.366-1.366-.415 2.4 1.744 2.408 1.33 0 .852.067 3.825-.543 1.679-1.934ZM61.611 290.841c-1.014 1.876 1.463 6.737-1.551 6.453.164-.026 2.088 2.779 2.17 2.027.07-1.435 1.223-7.745-.619-8.48Z"/><path d="M60.712 295.575c.477-2-1.905-.15-2.187.573.464 1.616 1.666.367 2.187-.573ZM65.541 296.079a4.915 4.915 0 0 1-1.392-1.041c-2.513-.464 1.728 4.346 1.392 1.041ZM65.219 286.013c-3.516 4.821 1.064-8.5-2.576-5.417-.27.189-5.676-.646-3.783 1.025 1.571.326 4.476-1.276 3.732 2.322-.37.129-5.415-.578-3.415 1.153 1.493.332 4.012-1.23 3.416 2.075-.259.537-5.524-.551-5.4.615-.189 1.036 4.353.283 4.65.5-6.639 1.649 1.373 3.342 1.25 0 1.295.454 4.662-.607 2.126-2.273ZM55.944 290.657c-.932 1.658-1.733.877-3.309 1.036 1.031-1.042 5.115-7.264 1.672-5.639-1.176 1.791-1.858 5.748-3.909 5.651-1.936 1.713 1.644 1.245 2.149 1.5-.552 7.683 1.883 7.691 1.33 0-.071-.235 1.439-.064 1.494-.113.717 3.108 2.052-2.213.573-2.435Z"/><path d="M50.376 286.136c1.6 2.133 4.114 2.641 1.2-.56.635-.655 6.241-6.12 2.387-5.278-.196.724-4.712 4.911-3.587 5.838ZM50.95 294.642c-1.032-.021-1.032 2.173 0 2.152 1.029.021 1.029-2.173 0-2.152ZM55.441 294.642c-1.032-.021-1.032 2.173 0 2.152 1.031.021 1.031-2.173 0-2.152Z"/><path d="M60.378 291.844c-1.345-1.612-2.848 1.6-.983 1.959.844.063 2.099-1.123.983-1.959Z" fill="#f2d83a"/><path d="M59.438 294.244c-2.087-.055-1.257-4.29.674-3.07a1.6 1.6 0 0 1-.674 3.07Zm-.007-2.378c-2.263 1.537 2.04 2.038.773.354a1.4 1.4 0 0 0-.773-.354Z"/><path d="M63.557 291.761c.894-.848 2.239.122 1.689 1.542-.646 1.463-3.226-.544-1.689-1.542Z" fill="#918dd7"/><path d="M64.451 294.262c-1.092 0-2.619-1.786-1.041-2.892 1.949-1.778 3.417 2.663 1.041 2.892Zm-.736-2.111c-1.052.594.953 1.831 1.285.849.268-1.042-.661-1.4-1.288-.849ZM30.14 289.791c.017-2.294-1.224-4.3-2.983-4.806.831-2.145-1.719-2.353-2.07-.431a.361.361 0 0 0-.579-.117l-.033.034c-.555-2.275-3.32-.788-1.735.943-3.843-.693-4.88 7.82-2.887 10.241 4.11.656 12.082 2.656 10.287-5.864Zm-.814-.228c-4.32 1.355-2.941.112-5.022-3.247 1.9-.814 2.18 1.082 2.88 2.813.779-.613-.155-2.419-.637-3.084 1.378-.204 2.644 1.533 2.779 3.518Zm-3.9-4.8c.491-1.72 2.271-.326.6.263-.181.008-.857.145-.597-.266Zm-2.569-.47c.374-.879 1.221.088 1.412.714-.442.231-1.486.078-1.412-.714Zm-.514 2.243c1.41-.038 2.408 1.436 2.589 3.718-2.309-.321-8.577-.273-2.586-3.721Zm-2.41 8.041c-.1-.009-.057-3.849-.09-3.908 3.472 1.06 5.7-1.532 5.184 4.716Zm9.421-.361-3.527 1.1c-.385-4.956.17-3.99 3.521-4.661-.043.058.136 3.572.006 3.563Z"/><path d="M24.51 278.546c-10.977-.208-10.978 23.117 0 22.9 10.977.212 10.978-23.114 0-22.9Zm0 21.414c-9.549.183-9.549-20.106 0-19.922 9.548-.184 9.549 20.107 0 19.922ZM82.252 288.609c-.78-1.042-.172-4.9-2.873-2.126a.415.415 0 0 0-.683-.036l-.028.036c-.982-1.886-3.574-.4-2.231 1.611-.6.266-1.659 1.6-.484 1.81.966-.715 1.937-2.2 3.071-2.144.731-.497 4.625 4.234 3.228.849Zm-4.127-1.556c-1.328.875-1.156-1.112.021-.017Zm1.942.09a1.053 1.053 0 0 1-.164-.1c.939-1.035 1.55.678.164.1Z"/><path d="M79.023 288.644c-3.377-.653-3.925 9.444-2.064 10.782.851-.334 4.959.928 4.966-1.136-.087-3.041.832-9.717-2.902-9.646Zm0 1.435a2.014 2.014 0 0 1 1.761 1.753h-3.521a2.01 2.01 0 0 1 1.76-1.753Zm1.843 8.072c-2.84.616-4.176 1.161-3.685-3.558 2.919.231 4.119-1.373 3.685 3.558Zm0-4.575c-.285-.293-4.373.738-3.685-.729.278.3 4.375-.737 3.685.729Z"/><path d="M76.161 38h445.678c16.519 0 29.911 12.317 29.911 27.511v160.478c0 15.194-13.392 27.511-29.911 27.511H76.161c-16.519 0-29.911-12.317-29.911-27.511V65.511C46.25 50.317 59.642 38 76.161 38Z" fill="#fff"/></g></g>
          <text
            x="15%"
            y="14%"
            font-size="12px"
            >{{ title }}
          </text>
        <foreignObject
          x="13%" y="20%" width="450" height="170" font-size="21px" >
          <text
            class="inner"
            x="50%"
            y="50%"
            font-size="21px"
            text-anchor="middle">{{ content }}
          </text>
        </foreignObject>
          <text
            x="70%"
            y="90%"
            font-size="14px"
            >{{ receivedLetter.sender.name }} さんより
          </text>
          <text
            x="84%"
            y="96%"
            font-size="10px"
            >(@{{ receivedLetter.sender.twitter_id }})
          </text>
        </svg>
<!-- クリックしたボタンの項目に応じてSVGに動的なデータを差し込みたい。空配列に設定しておいていてボタンで配列に追加? -->
      </div>
    </v-card>
  </v-dialog>
</template>
<script>
import axios from "axios";
import { mapGetters } from "vuex"
const svg2imageData = (svgElement, successCallback, errorCallback) => {
  const canvas = document.createElement("canvas");
  canvas.width = 614;
  canvas.height = 300;
  const ctx = canvas.getContext("2d");
  const image = new Image();
  image.onload = () => {
    ctx.drawImage(image, 0, 0, 614, 300);
    successCallback(canvas.toDataURL());
  };
  image.onerror = e => {
    errorCallback(e);
  };
  const svgData = new XMLSerializer().serializeToString(svgElement);
  image.src = "data:image/svg+xml;charset=utf-8;base64," + btoa(unescape(encodeURIComponent(svgData)));
};

export default {
  name: "ShareLetterModal",
  props: {
    isVisibleShareLetterModal: {
      type: Boolean,
      required: true,
    },
    receivedLetter: {
      type: Object,
      required: true
    },
  },
  data() {
    return {
      imageUrl: '',
      title: '',
      content: ''
    }
  },
  computed: {
    ...mapGetters({ currentUser: "users/currentUser" }),
  },
  methods: {
    handleCloseModal() {
      this.$emit("close-modal");
    },
    twitterShare() {
      const url = `https://goenbako.com/${this.currentUser.twitter_id}`
      return `https://twitter.com/share?text=${this.receivedLetter.sender.name}さん からファンレターが届いたよ！%0a&url=${url}&hashtags=ご縁箱`;
    },
    async svgToPng(letterTitle) {
      await this.addLetterContent(letterTitle);
      svg2imageData(this.$refs.svgArea, data => {
        console.log(data);
        document.getElementById('converted-image').src = data;
        this.imageUrl = data;
      }, function (error) {
        console.log(error);
        alert('failed to image');
      });
    },
    letterTitles() {
      return [
        { message: '出会いのきっかけ・当時の印象', content: `${this.receivedLetter.letter.past}` },
        { message: '現在の印象・どんな人？', content: `${this.receivedLetter.letter.current}` },
        { message: '聞いてみたいこと／これから話してみたいこと',  content: `${this.receivedLetter.letter.future}` },
        { message: `${this.receivedLetter.receiver.name}さんに期待していること`, content: `${this.receivedLetter.letter.expect}` },
        { message: 'メッセージ', content: `${this.receivedLetter.letter.message}` }
      ]
      .filter(existsLetterItem => existsLetterItem.content)
      .map(existsLetterItem => existsLetterItem)
    },
    addLetterContent(letterTitle) {
      this.title = letterTitle.message
      this.content = letterTitle.content
    }
  },
};
</script>

<style scoped>
.modal {
  display: block;
}
.m-font{
  font-size: 1.1em;
  font-weight: bold;
  line-height: 1;
  color: #2c281e;
}
.s-font{
  font-size: 0.8em;
  font-weight: bold;
  line-height: 1;
  color: #2c281e;
}
.svg{
  @import url('https://fonts.googleapis.com/css2?family=Comforter+Brush&family=Yomogi&display=swap');
  color: #f1cf77;

}
.cen {
    margin-left: auto;
    margin-right: auto;
    position: absolute;
    color: red
}
.inner{
    width: 400px;
    height: 50px;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    position: absolute;
    margin: auto;
    display: flex;
    justify-content: center;
}
</style>

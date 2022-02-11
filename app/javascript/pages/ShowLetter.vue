<template>
  <v-container v-if="loadData">
    <div
      align="center"
      class="mb-8"
    >
      <v-img
        max-width="315"
        src="/img/pimp_straight.jpg"
      />
    </div>
    <v-row justify="center">
      <v-card
        flat
        color="#FCF6FF"
        rounded="xl"
        width="330"
      >
        <v-card-title class="pt-6">
          <h4 class="scale receiver-box r-box-position">
            <span class="box-design">RECEIVER</span>
          </h4>
          <router-link :to="{ name: 'User', params: { twitter_id: letterData.receiver.twitter_id }}">
            <v-list-item-avatar
              class="pa-0"
              size="65"
            >
              <img :src="letterData.receiver.image">
            </v-list-item-avatar>
          </router-link>
          <v-list-item-content class="pa-0">
            <v-list-item-title class="s-font">
              {{ letterData.receiver.name }}
            </v-list-item-title>
            <v-list-item-subtitle>
              @{{ letterData.receiver.twitter_id }}
              <v-btn
                icon
                color="blue"
                :href="`https://twitter.com/${letterData.receiver.twitter_id}`"
              >
                <v-icon>mdi-twitter</v-icon>
              </v-btn>
            </v-list-item-subtitle>
          </v-list-item-content>
        </v-card-title>
      </v-card>
    </v-row>
    <v-row justify="center">
      <v-img
        src="/img/thank_you.svg"
        max-width="130px"
      />
    </v-row>
    <div
      class="mt-12 pb-4 s-font nowrap"
      align="center"
    >
      <v-card
        color="transparent"
        outlined
        max-width="300"
        class="mx-4 px-4"
      >
        {{ letterData.sender.name }} さんより<br>
        ..... 届いたファンレターです .....
      </v-card>
    </div>
    <v-row justify="center">
      <v-card
        flat
        color="#f1f1f1"
        rounded="xl"
        width="330"
        class="mt-4 mb-4"
      >
        <v-card-title class="pt-6 pb-0">
          <h4 class="scale sender-box s-box-position">
            <span class="box-design">SENDER</span>
          </h4>
          <router-link :to="{ name: 'User', params: { twitter_id: letterData.sender.twitter_id }}">
            <v-list-item-avatar
              class="pa-0"
              size="65"
            >
              <img :src="letterData.sender.image">
            </v-list-item-avatar>
          </router-link>
          <v-list-item-content class="pa-0">
            <v-list-item-title class="s-font">
              {{ letterData.sender.name }}
            </v-list-item-title>
            <v-list-item-subtitle>
              @{{ letterData.sender.twitter_id }}
              <v-btn
                icon
                color="blue"
                :href="`https://twitter.com/${letterData.sender.twitter_id}`"
              >
                <v-icon>mdi-twitter</v-icon>
              </v-btn>
            </v-list-item-subtitle>
          </v-list-item-content>
        </v-card-title>
        <LetterItem
          class="pt-0"
          :letter-items="letterData"
        />
      </v-card>
    </v-row>
    <v-row class="justify-center mb-16 pa-4">
      <v-card
        rounded="xl"
        color="transparent"
        outlined
        class="mx-4 px-4"
      >
        <v-img
          max-width="315"
          src="/img/en_line_top.svg"
        />
        <v-img
          max-width="45"
          class="tranceparent position"
          src="/img/triple_letter.svg"
        />
        <div
          align="center"
          class="nowrap mb-2"
        >
          ＼ ご縁箱ページを見る ／
        </div>
        <!-- <div class="flex"> -->
        <v-row class="mb-4">
          <v-col align="center">
            <router-link :to="{ name: 'User', params: { twitter_id: letterData.receiver.twitter_id }}">
              <v-list-item-avatar
                class="pa-0"
                size="65"
              >
                <img :src="letterData.receiver.image">
              </v-list-item-avatar>
              <h4 class="receiver-box">
                <span class="box-design">RECEIVER</span>
              </h4>
            </router-link>
          </v-col>
          <v-col align="center">
            <router-link :to="{ name: 'User', params: { twitter_id: letterData.sender.twitter_id }}">
              <v-list-item-avatar
                class="pa-0"
                size="65"
              >
                <img :src="letterData.sender.image">
              </v-list-item-avatar>
              <h4 class="sender-box">
                <span class="box-design">SENDER</span>
              </h4>
            </router-link>
          </v-col>
        </v-row>
        <v-img
          max-width="315"
          src="/img/en_line_under.svg"
        />
      </v-card>
    </v-row>
  </v-container>
</template>

<script>
import axios from "axios";
import { mapGetters } from "vuex"
import LetterItem from '../components/LetterItem';

export default {
  name: "ShowLetter",
  components: {
    LetterItem
  },
  data() {
    return {
      user: {},
      letterData: [],
      loadData: false
    };
  },
  computed: {
    ...mapGetters("users", ["currentUser"]),
  },
  mounted() {
    this.fetchLetter()
  },
  methods: {
    async fetchLetter() {
      await axios.get(`/api/letters/${this.$route.params.letter_id}`)
      .then((res) => {
        if (res.data === null) {
          this.$router.push({ name: "NotFound" })
        } else {
          this.letterData = res.data
          this.loadData = true
          document.title = `${this.letterData.receiver.name}さんに届いたファンレターです♪ - ご縁箱`
        }
      })
    }
  }
};
</script>

<style scoped>
.s-font{
  font-size: 0.8em;
  font-weight: bold;
  line-height: 1.5;
  color: #2c281e;
}
.receiver-box{
  background:#fcfee9;
  padding: 3px 0;
  -webkit-box-shadow: 0 0 40px rgba(0, 0, 0, 0.2) inset,0 0 4px rgba(0, 0, 0, 0.2) ;
  -moz-box-shadow: 0 0 40px rgba(0, 0, 0, 0.2) inset,0 0 4px rgba(0, 0, 0, 0.2) ;
  box-shadow: 0 0 40px rgba(0, 0, 0, 0.2) inset,0 0 4px rgba(0, 0, 0, 0.2) ;
}
.box-design{
  letter-spacing: 0.15em;
  display:block;
  border-top:1px dashed #fff;
  border-bottom:1px dashed #fff;
  padding: 0px 10px;
}
.sender-box{
  background:#feeafb;
  padding: 3px 0;
  -webkit-box-shadow: 0 0 40px rgba(0, 0, 0, 0.2) inset,0 0 4px rgba(0, 0, 0, 0.2) ;
  -moz-box-shadow: 0 0 40px rgba(0, 0, 0, 0.2) inset,0 0 4px rgba(0, 0, 0, 0.2) ;
  box-shadow: 0 0 40px rgba(0, 0, 0, 0.2) inset,0 0 4px rgba(0, 0, 0, 0.2) ;
}
.s-box-position{
  position: absolute;
  top: -8px;
  left: -4px;
}
.r-box-position{
  position: absolute;
  top: -8px;
  left: -12px;
}
.scale{
  transform: scale(0.65);
}
.flex {
  display: flex;
  justify-content: center;
  align-items: center;
}
.nowrap{
  white-space: nowrap
}
.align{
  align-items: center
}
.tranceparent{
  mix-blend-mode: multiply;
}
</style>

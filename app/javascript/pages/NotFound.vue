<template>
  <div align="center" class="mt-10">
    <h1>404 NotFound</h1>
    <div class="mt-10 m-font">
      <p>お探しのページが見つかりませんでした。</p>
      <p>
        一時的にアクセスができない状況にあるか
        <br>移動もしくは削除された可能性があります。
      </p>
    </div>
    <v-card max-width="230" color="transparent" outlined>
    <v-row justify="center" align="center">
      <v-col class="ma-0 pa-0">
        <v-img
          class="tranceparent"
          max-width="200"
          src="/img/ken_shun.jpg"
        />
      </v-col>
      <v-col>
        <p class="position xs-font">しゅん...</p>
      </v-col>
    </v-row>
    </v-card>
    <v-col class="text-center">
      <v-btn
        color="deep-purple lighten-5"
        class="s-font"
        large
        :to="{ name: 'Top' }"
      >
        <v-img
          src="/img/favicon.ico"
          max-width="27px"
        />
        トップページに戻る
      </v-btn>
    </v-col>
  </div>
</template>

<script>
export default {
}
</script>

<style scoped>
.s-font{
  font-size: 0.55em;
  font-weight: bold;
  line-height: 1;
  color: #2c281e;
}
.m-font{
  font-size: 0.85em;
  font-weight: bold;
  line-height: 1;
  color: #2c281e;
}
.position {
  position: absolute;
  top: 120px;
  left: 140px;
}
.tranceparent{
  mix-blend-mode: multiply;
}
</style>

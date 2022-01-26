<template>
  <div align="center" class="mt-10">
    <h1>404 NotFound</h1>
    <div class="mt-4 mb-8 m-font">
      <p>お探しのページが見つかりませんでした。</p>
      <p>
        一時的にアクセスができない状況にあるか
        <br>移動もしくは削除された可能性があります。
      </p>
    </div>
    <v-card color="transparent" max-width="320" outlined>
      <div justify="center" align="center">
        <v-col class="ma-0 pa-0">
          <v-img
            class="tranceparent"
            max-width="300"
            min-height="330"
            src="/img/NotFound.jpg"
          />
          <div class="text-center" align="center">
            <p class="position xs-font">しゅん...</p>
          </div>
        </v-col>
        <!-- <v-col class="ma-0 pa-0">
        </v-col> -->
      </div>
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
  top: 190px;
  left: 210px;
}
.tranceparent{
  mix-blend-mode: multiply;
}
</style>

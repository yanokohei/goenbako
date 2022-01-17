<template>
  <v-container>
    <v-row justify="center">
      <div class="font-bold xs-font my-8 opacity-50 nowrap">
        まだレターがありません。
      </div>
    </v-row>
  </v-container>
</template>

<script>
export default {
  name: "IsNotYetLetter",
};
</script>

<style scoped>
.xs-font{
  font-size: 0.9em;
  font-weight: bold;
  line-height: 1;
  color: #2c281e;
}
.nowrap{
  white-space: nowrap
}
</style>

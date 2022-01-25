<template>
  <div class="text-center">
    <v-dialog
      v-model="dialog"
      persistent
      width="280"
    >
      <v-card
        height="120"
        color="#FFFFF8"
      >
        <v-card-text>
          <div class="position">
            <p
              class="s-font nowrap"
              align="center"
            >
              ツイート画面へ移動します...
            </p>
            <div
              class="flex mb-4 mr-5"
              align="center"
            >
              <v-img
                max-width="70"
                class="tranceparent"
                src="/img/goenbako_reversible.jpg"
              />
              <p
                class="s-font mt-6 pl-3 pr-4"
                align="center"
              >
                <v-img
                  width="30"
                  height="5"
                  src="/img/to_right.svg"
                />
              </p>
              <v-icon
                size="30"
                color="blue"
              >
                mdi-twitter
              </v-icon>
            </div>
            <v-progress-linear
              indeterminate
              class="mb-0"
              color="#F9ECFF"
            />
          </div>
        </v-card-text>
      </v-card>
    </v-dialog>
  </div>
</template>
<script>
  export default {
  props: {
    dialog: {
      type: Boolean,
      required: true,
    }
  },
}
</script>
<style scoped>
.s-font{
  font-size: 0.8em;
  font-weight: bold;
  line-height: 1;
  color: #2c281e;
}
.flex{
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  text-align: center;
}
.tranceparent{
  mix-blend-mode: multiply;
}
.position{
  position: absolute;
  top: 15px;
  left: 0;
  right: 0;
}
.nowrap{
  white-space: nowrap
}
</style>

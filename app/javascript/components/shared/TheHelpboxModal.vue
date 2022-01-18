<template>
  <v-dialog
    v-model="isVisibleHelpboxModal"
    max-width="315"
    @click:outside="handleCloseModal"
  >
    <v-card color="amber lighten-5" height="490" max-width="300" >
      <v-card-title class="pl-4 pa-1 nowrap">
        <v-icon color="blue">mdi-help-box</v-icon>
        <span class="m-font"> ご縁箱の使い方
          ({{stepCount}}/6)
        </span>
      </v-card-title>
      <v-divider />
      <v-col align="center" class="pa-0 pt-3">
        <v-card height="325" color="transparent" outlined>
          <transition name="fade" mode="out-in">
            <v-img
              eager
              key="1"
              v-if="stepCount === 1"
              src="/img/rules/rule_1.jpg"
            />
            <v-img
              eager
              key="2"
              v-else-if="stepCount === 2"
              src="/img/rules/rule_2.jpg"
            />
            <v-img
              eager
              key="3"
              v-else-if="stepCount === 3"
              src="/img/rules/rule_3.jpg"
            />
            <v-img
              eager
              key="4"
              v-else-if="stepCount === 4"
              src="/img/rules/rule_4.jpg"
            />
            <v-img
              eager
              key="5"
              v-else-if="stepCount === 5"
              src="/img/rules/rule_5.jpg"
            />
            <v-img
              key="0"
              v-else-if="stepCount === 6"
              src="/img/rules/rule_6.jpg"
            />
          </transition>
        </v-card>
      </v-col>
      <div>
        <v-col align="right" class="pa-0">
        <v-img
          src="/img/goenbako_main_illust.png"
          max-width="130px"
          height="45"
        />
        </v-col>
        <v-col v-if="stepCount===6" align="center" justify="center" class="pa-0">
          <v-btn
            @click="handleCloseModal"
          >
            閉じる
          </v-btn>
        </v-col>
        <v-col v-else align="center" justify="center" class="pa-0">
          <v-btn
            color="red lighten-4"
            @click="nextStepCount"
          >
            NEXT
          </v-btn>
        </v-col>
      </div>
    </v-card>
  </v-dialog>
</template>

<script>

export default {
  name: "TheHelpboxModal",
  props: {
    isVisibleHelpboxModal: {
      type: Boolean,
      required: true,
    },
  },
  data() {
    return {
      stepCount: 1
    };
  },
  methods: {
    nextStepCount() {
      this.stepCount++;
    },
    handleCloseModal() {
      this.$emit("close-modal");
      this.stepCount = 1;
    },
  }
};
</script>

<style scoped>
.xs-font{
  font-size: 0.8em;
  font-weight: bold;
  line-height: 1.5;
  color: #2c281e;
}
.m-font{
  font-size: 0.85em;
  font-weight: bold;
  color: #2c281e;

}
.modal {
  display: block;
}
.fade-enter-active {
  transition: all .5s ease;
}
.fade-leave-active {
  transition: all .3s cubic-bezier(1.0, 0.5, 0.8, 1.0);
}
.fade-enter
/* .slide-fade-leave-active below version 2.1.8 */ {
  transform: translateX(15px);
  opacity: 0;
}
.fade-leave-to
/* .slide-fade-leave-active below version 2.1.8 */ {
  transform: translateX(-10px);
  opacity: 0;
}
.nowrap{
  white-space: nowrap
}
</style>

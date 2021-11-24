<template>
  <v-card-actions class="justify-center">
    <v-btn
      color="deep-purple lighten-5"
      @click="handleShowTextarea"
    >
      <v-icon>mdi-pencil</v-icon>
      書いてみる
    </v-btn>
  </v-card-actions>
</template>

<script>

export default {
  name: "ShowTextareaButton",
  props: {
    isShowThisButton: {
      type: Boolean,
      required: true,
    },
    isShowTextarea: {
      type: Boolean,
      required: true,
    },
  },
  methods: {
    handleShowTextarea() {
      this.$emit("show-textarea");
    }
  }
}

</script>

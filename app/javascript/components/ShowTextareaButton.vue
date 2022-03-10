<template>
  <v-card-actions class="justify-center">
    <v-btn
      color="deep-purple lighten-5"
      @click="handleShowTextarea"
    >
      <v-icon>{{ svgPath.mdiPencil }}</v-icon>
      書いてみる
    </v-btn>
  </v-card-actions>
</template>

<script>
import { mdiPencil } from '@mdi/js'

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
  data() {
    return {
      svgPath: {
        mdiPencil
      }
    }
  },
  methods: {
    handleShowTextarea() {
      this.$emit("show-textarea");
    }
  }
}

</script>

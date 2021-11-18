<template>
  <v-container>
    <v-card>
      <v-tabs
        background-color="amber lighten-5"
        centered
        icons-and-text
      >
        <v-tabs-slider />

        <v-tab
          href="#tab-1"
          class="mr-8"
        >
          <v-icon>mdi-email-fast-outline</v-icon>
          受け取ったファンレター
        </v-tab>
        <v-tab href="#tab-3">
          <v-icon>mdi-email-edit-outline</v-icon>
          送ったファンレター
        </v-tab>
      </v-tabs>
    </v-card>
    <LetterListReceived />
  </v-container>
</template>

<script>
import LetterListReceived from './LetterListReceived';

export default {
  components: {
    LetterListReceived,
  }
}
</script>

<style>

</style>

<template>
  <v-bottom-navigation
    v-model="value"
    absolute
  >
    <v-btn
      value="home"
      to="/"
    >
      <span>Home</span>

      <v-icon>mdi-home</v-icon>
    </v-btn>

    <v-btn value="write">
      <span>Write</span>

      <v-icon>mdi-pencil</v-icon>
    </v-btn>

    <v-btn value="share">
      <span>Share</span>

      <v-icon>mdi-twitter</v-icon>
    </v-btn>
  </v-bottom-navigation>
</template>

<script>
  export default {
    data: () => ({ value: 'recent' }),
  }
</script>

<template>
  <div id="app">
    <Header/>
    <b-container variant="pp-secondary">
    <router-link to="/">Home</router-link>
    </b-container>
  </div>
</template>

<script>
import Header from './components/Header.vue'

export default {
  name: 'App',
  components: {
    Header,
  }
}
</script>

<style>
#app{
  background-color:#659DBD;
  min-height:100vh;
}
</style>

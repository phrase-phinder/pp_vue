<template>
  <div id="app">
    <Header/>
    <router-view to="/">Home</router-view>
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

</style>

<template>
<div>
  <b-navbar toggleable="lg" type="dark" variant="pp-primary" class="brown">
    <b-navbar-brand href="/">Phrase Phinder</b-navbar-brand>

    <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

    <b-collapse id="nav-collapse" is-nav>

      <!-- Right aligned nav items -->
      <b-navbar-nav class="ml-auto">

        <b-nav-item-dropdown text="Movies" right>
            <b-dropdown-item v-for="movie in movies" :key="movie" href="#">{{ movie | replaceUnderscores}}</b-dropdown-item>
            <b-dropdown-item href="/movies">See More</b-dropdown-item>
        </b-nav-item-dropdown>

        <b-nav-item-dropdown text="Series" right>
          <b-dropdown-item v-for="serie in series" :key="serie" href="#">{{ serie | replaceUnderscores}}</b-dropdown-item>
          <b-dropdown-item href="/series">See More</b-dropdown-item>
        </b-nav-item-dropdown>

        <b-nav-item-dropdown text="Comedians" right>
          <b-dropdown-item v-for="comedian in comedians" :key="comedian" href="#">{{ comedian | replaceUnderscores}}</b-dropdown-item>
          <b-dropdown-item href="/comedians">See More</b-dropdown-item>
        </b-nav-item-dropdown>

      </b-navbar-nav>
    </b-collapse>
  </b-navbar>
</div>
</template>

<script>
import axios from 'axios'
export default {
    name: 'Header',
    data(){
        return{
            movies: [],
            series: [],
            comedians:[]
        }
    },
    mounted(){
        axios
            .get("http://localhost:7070/api/movie")
            .then(response => (this.movies = response.data.slice(0,5)));
        
        axios
            .get("http://localhost:7070/api/series")
            .then(response => (this.series = response.data.slice(0,5)));

        axios
            .get("http://localhost:7070/api/comedian")
            .then(response => (this.comedians = response.data.slice(0,5)));
    },

  filters:{
    replaceUnderscores: function (value){
      return value.replace(/_/g, " ");
    }
  }
}
</script>

<style>
    @import url('https://fonts.googleapis.com/css2?family=Roboto+Condensed:ital@1&display=swap');
    @import '../assets/styles/_custom.css';

    *{
        font-family: 'Roboto Condensed', sans-serif;
    }
</style>

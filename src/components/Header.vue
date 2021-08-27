<template>
<div>
  <b-navbar sticky toggleable="lg" type="dark" variant="pp-primary">
    <b-navbar-brand id="logo" href="/">Phrase Phinder</b-navbar-brand>

    <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>

    <b-collapse id="nav-collapse" is-nav>

      <!-- Right aligned nav items -->
      <b-navbar-nav class="ml-auto">

        <b-nav-item-dropdown text="Movies" right>
            <b-dropdown-item v-for="movie in movies" :key="movie" href="#"><router-link class="router-link" :to=getUrl(movie)>{{ movie | replaceUnderscores}}</router-link></b-dropdown-item>
            <b-dropdown-item><router-link class="router-link" to="/shows">See More</router-link></b-dropdown-item>
        </b-nav-item-dropdown>

        <b-nav-item-dropdown text="Series" right>
          <b-dropdown-item v-for="serie in series" :key="serie" href="#"><router-link class="router-link" :to=getUrl(serie)>{{ serie | replaceUnderscores}}</router-link></b-dropdown-item>
          <b-dropdown-item><router-link class="router-link" to="/shows">See More</router-link></b-dropdown-item>
        </b-nav-item-dropdown>

        <b-nav-item-dropdown text="Comedians" right>
          <b-dropdown-item v-for="comedian in comedians" :key="comedian" href="#"><router-link class="router-link" :to=getUrl(comedian)>{{ comedian | replaceUnderscores}}</router-link></b-dropdown-item>
          <b-dropdown-item><router-link class="router-link" to="/shows">See More</router-link></b-dropdown-item>
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
    created(){
        axios
            .get("http://phrasephinder.com:7070/api/movie")
            .then(response => (this.movies = response.data.slice(0,5)));
        
        axios
            .get("http://phrasephinder.com:7070/api/series")
            .then(response => (this.series = response.data.slice(0,5)));

        axios
            .get("http://phrasephinder.com:7070/api/comedian")
            .then(response => (this.comedians = response.data.slice(0,5)));
    },
  methods: {
        getUrl: function(show){
            return `/search/${show}`;
        }
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
    @import url('https://fonts.googleapis.com/css2?family=Inconsolata:wght@700&display=swap');
    @import '../assets/styles/_custom.css';
    @media only screen and (min-width: 600px){
      #logo{
      font-size: 3em;
    }  
    }
    *{
        font-family: 'Roboto Condensed', sans-serif;
    }
    .router-link{
      color: black;
    }
    #logo{
      font-family: 'Inconsolata', monospace;
    }
</style>

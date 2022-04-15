<template>
<div>
    <b-container class="d-flex flex-column justify-content-center">
    <div class="list-shows">
        <u class="blue"><h2>Movies</h2></u>
        <ul>
            <li class="blue" v-for="movie in movies" :key="movie"><router-link class="blue" :to=getUrl(movie)>{{movie | replaceUnderscores}}</router-link></li>
        </ul>
    </div>

    <div class="list-shows">
        <u class="blue"><h2>Series</h2></u>
        <ul>
            <li class="blue" v-for="serie in series" :key="serie"><router-link class="blue" :to=getUrl(serie)>{{serie | replaceUnderscores}}</router-link></li>
        </ul>
    </div>

    <div class="list-shows">    
        <u class="blue"><h2>Comedians</h2></u>
        <ul>
            <li class="blue" v-for="comedian in comedians" :key="comedian"><router-link class="blue" :to=getUrl(comedian)>{{comedian | replaceUnderscores}}</router-link></li>
        </ul>
    </div>
    </b-container>
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
    methods: {
        getUrl: function(show){
            return `/search/${show}`;
        }
    },
    created(){
        axios
            .get(process.env.VUE_APP_API + "/api/movie")
            .then(response => (this.movies = response.data));
        
        axios
            .get(process.env.VUE_APP_API + "/api/series")
            .then(response => (this.series = response.data));

        axios
            .get(process.env.VUE_APP_API + "/api/comedian")
            .then(response => (this.comedians = response.data));
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
    .list-shows{
        padding: 30px 30px 10px 30px;
    }
    .blue{
        color: #659DBD;
    }
</style>
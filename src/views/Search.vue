<template>
    <div id="root">
    <b-container class="flex-column">

        <p id="start-text">Searching phrases from <span style="text-decoration:bold;">{{show | replaceUnderscores}}</span></p>
        <p class="sub-text">Find other shows to search by clicking <router-link class="link" to="/shows">here</router-link></p> 
        <b-form-input placeholder="Enter your phrase here..." v-model="phrase"></b-form-input>
        <b-button id="search-btn" pill variant="primary" @click="search()">Search</b-button>
        <div v-if="occurences != null">
            <p class="sub-text">We found that phrase {{occurences_num}} times.</p>
            <div v-for="(occurence, index) in occurences" :key="index">
                <b-card class="card" :title="occurence.episodeName" :sub-title="getEpisodeString(occurence.seasonNum,occurence.episodeNum)">
                <b-card-text class="black">
                Found between {{occurence.startTime}} and {{occurence.endTime}}
                </b-card-text>
                </b-card>
            </div>
        </div>
    </b-container>
    </div>
</template>

<script>
import axios from 'axios'
export default {
    name: 'Home',
    data(){
        return{
            show: this.$route.params.show,
            phrase: "",
            occurences: null,
            occurences_num: null
        }
    },
    filters:{
    replaceUnderscores: function (value){
      return value.replace(/_/g, " ");
    }
  },
  watch: {
    $route() {
      this.show = this.$route.params.show;
      this.occurences = null;
      this.phrase = "";
    }
  },
  methods:{
      search: function(){
          var bodyFormData = new FormData();
          bodyFormData.append('show',this.show);
          bodyFormData.append('phrase',this.phrase);
          axios({
            method: "post",
            url: "http://phrasephinder:7070/api/search",
            data: bodyFormData
            }).then(response => {
                this.occurences = response.data;
                this.occurences_num = response.data.length;
            }
            );
        
      },
      getEpisodeString: function(season, episode){
          if(season == 0 && episode == 0){
              return "";
          }
          return `Season ${season} Episode ${episode}`;
      }
  }

}
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Roboto+Condensed:ital@1&display=swap');

p{
    text-align:center;
    font-family: 'Roboto Condensed', sans-serif;
    color:white;
}
#start-text{
        font-size: 4em;
}
.sub-text{
    font-size: 2em;
}
#search-btn{
    margin: 10px auto;
    background-color:white;
    color: #659DBD;
    width: 100%;
}
.link{
    color: white;
    text-decoration: underline;
}
.card{
    max-width: 600px;
    margin: 0 auto;
}
@media only screen and (max-width: 600px){
    #start-text{
        font-size: 2em;
    }
    .sub-text{
        font-size: 1.5em;
    }
    #show-img{
    max-width:100vw;
    }
}
#root{
  background-color:#659DBD;
  min-height:100vh;
}
.card-text{
    color: #212529;
    text-align: start;
}
</style>
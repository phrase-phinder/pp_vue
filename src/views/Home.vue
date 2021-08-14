<template>
    <div class="d-flex flex-column justify-content-center">

        <p id="start-text">Searching phrases from The Office</p>
        <p id="sub-text">Find other shows to search by clicking <span href="/shows" style="text-decoration:underline;">here</span></p> 
        <b-form-input placeholder="Enter your phrase here..."></b-form-input>
        <b-button id="search-btn" pill variant="primary">Search</b-button>
    </div>
</template>

<script>

export default {
    name: 'Home',
    data(){
        return{
            
        }
    }
}
</script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Roboto+Condensed:ital@1&display=swap');

#show-img{
    padding: 30px;
    max-width:66vw;
}
p{
    text-align:center;
    font-family: 'Roboto Condensed', sans-serif;
    color:white;
}
#start-text{
        font-size: 4em;
}
#sub-text{
    font-size: 2em;
}
#search-btn{
    margin: 10px;
    background-color:white;
    color: #659DBD;
}
@media only screen and (max-width: 600px){
    #start-text{
        font-size: 2em;
    }
    #sub-text{
        font-size: 1.5em;
    }
    #show-img{
    max-width:100vw;
    }
}
</style>
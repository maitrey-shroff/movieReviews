document.addEventListener("DOMContentLoaded", function(event) {
  var app = new Vue({
    el: "#app",

    data: {
      movies: []
    },

    mounted: function() {
      
      //Get data from TMDb API
      Rails.ajax({
        url: "http://localhost:3000/api/v1/movies.json",
        type: "GET",
        success: function(result){
          this.movies = result;
        }.bind(this)
      });
    },

    methods: {

    },

    computed: {

    }
  });
});
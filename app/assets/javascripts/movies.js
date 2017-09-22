document.addEventListener("DOMContentLoaded", function(event) {
  var app = new Vue({
    el: "#app",

    data: {
      movies: [],
      sortAttribute: "title"
    },

    mounted: function() {

      //AJAX call to get data from movies-app API (work around becauseTMDb API does not allow ajax requests)
      Rails.ajax({
        url: "http://localhost:3000/api/v1/movies.json",
        type: "GET",
        success: function(result){
          this.movies = result;
        }.bind(this)
      });

    },

    methods: {
      setSortAttribute: function(inputSortAttribute) {
        this.sortAttribute = inputSortAttribute;
      }

    },

    computed: {
      modifiedMovies: function(){
        return this.movies.sort(function(a, b){
          return a[this.sortAttribute].localeCompare(b[this.sortAttribute]);
        }.bind(this));
      }

    }
  });
});
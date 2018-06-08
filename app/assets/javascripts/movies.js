document.addEventListener("DOMContentLoaded", function(event) {
  app = new Vue({
    el: "#app",

    data: {
      movies: [],
      sortAttribute: "title",
      sortAscending: false
    },

    mounted: function() {
      // read URL params

      // Create a script that contains the data from the API request and call 'myFunc' function with that data as the argument. I'm using JSONP with a callback function to get the list of movies because The Movie Database does not allow standard AJAX calls
      var s
      s = document.createElement("script");
      s.src = "https://api.themoviedb.org/3/discover/movie?api_key=08680559d6fc65313f828456eb8b4b29&language=en-US&sort_by=original_title.asc&include_adult=false&callback=app.myFunc";
      document.body.appendChild(s);


      //AJAX call to get data from movies-app API (work around because The Movie Database API does not allow ajax requests)
      // Rails.ajax({
      //   url: "http://localhost:3000/api/v1/movies.json",
      //   type: "GET",
      //   success: function(result){
      //     this.movies = result;
      //   }.bind(this)
      // });

    },

    methods: {

      myFunc: function(result) {
      this.movies = result.results;      
      // console.log(result)
    },

      // setSortAttribute: function(inputSortAttribute) {
      //   this.sortAttribute = inputSortAttribute;
      //   this.sortAscending = !this.sortAscending;
      // }

    },

    computed: {
      modifiedMovies: function(){
        return this.movies
        // return this.movies.sort(function(a, b){
        //   // if (this.sortAscending) {
        //   //   return b[this.sortAttribute].localeCompare(a[this.sortAttribute]);
        //   // } else {
        //   //   return a[this.sortAttribute].localeCompare(b[this.sortAttribute]);
        //   // }
        // }.bind(this));

        // console.log(result)
      }

    }
  });
});
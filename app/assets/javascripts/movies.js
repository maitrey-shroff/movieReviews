document.addEventListener("DOMContentLoaded", function(event) {
  app = new Vue({
    el: "#app",

    data: {
      movies: [],
      sortAttribute: "title",
      sortAscending: false
    },

    mounted: function() {

      this.searchMovies();

    },

    methods: {

      // Create a script that contains the data from the API request and call 'myFunc' function with that data as the argument. I'm using JSONP with a callback function to get the list of movies because The Movie Database does not allow standard AJAX calls
      searchMovies: function(){
        var s;
          if (this.sortAttribute == null || this.sortAttribute == ''){
            this.sortAttribute = 'original_title';
          }
          if (this.pageNumber < 1 || this.pageNumber == null){
            this.pageNumber = 1;
          }
          if (!this.genre){
            this.genre = "null";
          }
          s = document.createElement("script");
          s.src = "https://api.themoviedb.org/3/discover/movie?api_key=08680559d6fc65313f828456eb8b4b29&language=en-US&region=US&sort_by=" + this.sortAttribute + ".desc&include_adult=false&page=" + this.pageNumber + this.genre + "&callback=app.myFunc";
          document.body.appendChild(s);
      },

      myFunc: function(result) {
      this.movies = result.results;      
      // console.log(result)
      },

      setSortAttribute: function(inputSortAttribute) {
        this.sortAttribute = inputSortAttribute;
        this.searchMovies();
      },

      nextPage: function() {
        this.pageNumber++;
        this.searchMovies();
      },

      prevPage: function() {
        if (this.pageNumber >= 1){
          this.pageNumber--;
          this.searchMovies();
        }
      },

      filterGenre: function(inputGenre) {
        this.genre = "&with_genres=" + inputGenre;
        this.searchMovies();
      }

    },

    computed: {
      modifiedMovies: function(){
        return this.movies;
      }

    }
  });
});
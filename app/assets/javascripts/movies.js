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

      // Creates a script that contains the data from the API request and call 'myFunc' function with that data as the argument. Uses JSONP format with a callback function to get the list of movies
      searchMovies: function(){
        var s;
          if (this.sortAttribute == null || this.sortAttribute == ''){
            this.sortAttribute = 'original_title';
          }
          if (this.pageNumber < 1 || this.pageNumber == null){
            this.pageNumber = 1;
          }
          if (!this.genre){
            this.genre = "";
          }
          s = document.createElement("script");
          s.src = "https://api.themoviedb.org/3/discover/movie?api_key=08680559d6fc65313f828456eb8b4b29&language=en-US&region=US&sort_by=" + this.sortAttribute + ".desc&include_adult=false&page=" + this.pageNumber + this.genre + "&callback=app.getMovies";
      console.log(s.src)
          document.body.appendChild(s);
      },

      // Initiates this.movies and sets it equal to the results of the above API call result
      getMovies: function(result) {
      this.movies = result.results;      
      },


      // This method is called when the user selects a sorting method. The sort attribute is then passed to the searchMovies method which gets the result of the API call with the sorting parameter included
      setSortAttribute: function(inputSortAttribute) {
        this.sortAttribute = inputSortAttribute;
        this.searchMovies();
      },

      // Iterates the page number +1 to get the next page of results from the API
      nextPage: function() {
        this.pageNumber++;
        this.searchMovies();
      },

      // Iterates the page number -1 to get the previous page of results from the API (as long as you are not on the first page)
      prevPage: function() {
        if (this.pageNumber >= 1){
          this.pageNumber--;
          this.searchMovies();
        }
      },

      // This method is called when the user selects a genre filter. The genre parameter is then used to get the movies of that genre from the API
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
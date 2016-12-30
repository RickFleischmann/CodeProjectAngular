using CodeProjectAngular.WebAPI.Models;
using CodeProjectAngular.WebAPI.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace CodeProjectAngular.WebAPI.Controllers
{
    public class RestaurantsController : ApiController
    {
        //// GET api/values
        //public IEnumerable<Restaurant> Get()
        //{
    
        //    OdeToFoodDb _db = new OdeToFoodDb();
            
        //    var model = _db.Restaurants.ToList();

        //    return model;

        // }

        // GET api/values
        public IEnumerable<MoviesDTO> Get()
        {
            List<MoviesDTO> movies = new List<MoviesDTO>
                {
                    new MoviesDTO { Id = 1, Name = "Pacifist Club", Director = "David Fincher" },
                    new MoviesDTO { Id = 2, Name = "Into The Wild", Director = "Sean Penn" },
                    new MoviesDTO { Id = 3, Name = "Dancer in the Dark", Director = "Lars von Trier" },
                };

            return movies;
        }

    }
}

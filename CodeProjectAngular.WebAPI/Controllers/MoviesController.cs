using CodeProjectAngular.WebAPI.DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace CodeProjectAngular.WebAPI.Controllers
{
    public class MoviesController : ApiController
    {
        // GET api/values
        public IEnumerable<MoviesDTO> Get()
        {
            List<MoviesDTO> movies = new List<MoviesDTO>
                {
                    new MoviesDTO { Id = 1, Name = "Fight Club", Director = "David Fincher" },
                    new MoviesDTO { Id = 2, Name = "Into The Wild", Director = "Sean Penn" },
                    new MoviesDTO { Id = 3, Name = "Dancer in the Dark", Director = "Lars von Trier" },
                    new MoviesDTO { Id = 4, Name = "WebAPI", Director = "Cool!" }
                };

            return movies;
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CodeProjectAngular.WebAPI.DTO
{
    public class MoviesDTO
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Director { get; set; }
    }
}
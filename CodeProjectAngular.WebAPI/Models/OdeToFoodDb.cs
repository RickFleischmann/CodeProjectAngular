using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;


namespace CodeProjectAngular.WebAPI.Models
{

    public class OdeToFoodDb : DbContext

    {
        // DbSet type properties represent the entities you want to query and persist

        public DbSet<Restaurant> Restaurants { get; set; }
        public DbSet<RestaurantReview> Reviews { get; set; }          
    }
}
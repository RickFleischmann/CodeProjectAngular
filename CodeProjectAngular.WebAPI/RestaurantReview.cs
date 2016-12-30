namespace CodeProjectAngular.WebAPI
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class RestaurantReview
    {
        public int Id { get; set; }

        public int? Rating { get; set; }

        [StringLength(1000)]
        public string Body { get; set; }

        public int? RestaurantId { get; set; }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.Linq;
using System.Data.Linq.Mapping;
using System.Web;

namespace projScaffoldingLinq.Models
{
    [Table(Name="StudMst")]
    public class StudMst
    {
        public int ID { get; set; }
        public string FName { get; set; }
        public string LName { get; set; }
        public string Course { get; set; }
        public int? Fees { get; set; }
        public DateTime? Doj { get; set; }
    }
}
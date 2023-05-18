using INFRASTRUCTURE.Entities.Base;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace INFRASTRUCTURE.Entities
{
    [Table("tblBizUser")]
    public class BizUser:BaseEntity
    {
        public string UserName { get; set; }
        public string Email { get; set; }
        public string? Phone { get; set; }
        public string? Address { get; set; }
        public string? FileName { get; set; }
    }
}

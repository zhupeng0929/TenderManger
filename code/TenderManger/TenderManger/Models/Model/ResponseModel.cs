using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TenderManger.Models
{
    public class ResponseModel
    {
        public bool Status = true;
        public string Message = "操作成功";
        public dynamic Result;
    }
}
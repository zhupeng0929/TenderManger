using Tender.Domain;
using System.Collections.Generic;

namespace Tender.App.ViewModel
{
    public class TenderInfoView : TenderInfo
    {
        private List<Enclosure> _enclosurePic = new List<Enclosure>();
        private Enclosure _enclosureVido = new Enclosure();
        /// <summary>
        /// 图片附件
        /// </summary>
        public List<Enclosure> EnclosurePic
        {
            get { return _enclosurePic; }
            set { _enclosurePic = value; }
        }
        /// <summary>
        /// 视频资源
        /// </summary>
        public Enclosure EnclosureVido
        {
            get { return _enclosureVido; }
            set { _enclosureVido = value; }
        }
        public string StateDes
        {
            get
            {
                switch (State)
                {
                    case 0: return "未开标";
                    case 1: return "已开标";
                    case 2: return "已结束";
                    case 3: return "已作废";
                    default: return "无效";
                };
            }
        }
    }
}

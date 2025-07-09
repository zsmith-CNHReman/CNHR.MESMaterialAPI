using System.ComponentModel.DataAnnotations.Schema;

namespace CNHReman.SyteLine.MESMaterialsAPI.Models
{
    /// <summary>
    /// This class models our CNH_UjigamiMaterialsVw
    /// </summary>
    public class MESMaterial
    {
        [Column("matl")]
        public string? Matl {  get; set; }


        [Column("desc")]
        public string? Desc { get; set; }

        [Column("origQty")]
        public decimal? OrigQty { get; set; }

        [Column("option")]
        public string? Option { get; set; }

        [Column("optionID")]
        public string? OptionID { get; set; }

        [Column("eqCode")]
        public string? EqCode { get; set; }

        [Column("psid")]
        public string? PSID { get; set; }

        [Column("item")]
        public string? JobItem { get; set; }

        [Column("ser_num")]
        public string? JobSerial { get; set; }

        [Column("MESDisplayGroup")]
        public string? MESDisplayGroup { get; set; }

        [Column("MESCompleteDate")]
        public DateTime? MESCompleteDate { get; set; }
        
    }
}

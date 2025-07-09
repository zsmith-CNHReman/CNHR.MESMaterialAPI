IF OBJECT_ID('[dbo].[CNH_UjigamiMaterialsVw]','V') IS NOT NULL
	DROP VIEW [dbo].[CNH_UjigamiMaterialsVw]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[CNH_UjigamiMaterialsVw]
AS
	-- This view uses MSTs instead of regular Views because it is accessed by a custom API without a SyteLine Session
	-- It assumes REMAN site since Ujigami is used in the REMAN process
    SELECT
        mat.item AS matl,
        mat.description AS 'desc',
        mat.Uf_OriginalQty AS origQty ,
		mat.Uf_CNH_Option AS 'option', 
		mat.Uf_CNH_OptionID AS 'optionID',
		mat.Uf_CNH_EquivalentCode AS eqCode,
		mat.Uf_BWA_PullSheetID AS psid,
		jmj.item,
		ser.ser_num,
		mat.Uf_CNH_MESDisplayGroup AS MESDisplayGroup,
		jmj.Uf_CNH_MESCompleteDate AS MESCompleteDate
     FROM job_mst jmj -- JobMaterialJob - The job for this specific item
	 INNER JOIN serial_mst ser ON -- Serials related to the JMJ
		--jmj.job = ser.ref_num AND 
		--jmj.suffix = ser.ref_line AND 
		jmj.item = ser.item AND 
		jmj.site_ref = ser.site_ref
	 INNER JOIN ser_track_mst st ON st.ser_num = ser.ser_num AND st.site_ref = ser.site_ref
	 INNER JOIN matltrack_mst mt ON mt.track_num = st.track_num AND mt.track_type = 'R' AND mt.site_ref = st.site_ref
	 INNER JOIN job_mst cmj ON -- CurrentMaterialJob - The whole unadultered template job for the item, sans suffix 1 (FItem)
		jmj.item = cmj.item AND 
		jmj.site_ref = cmj.site_ref AND
		cmj.type = 'S' AND
		cmj.suffix <> 1
	 INNER JOIN jobmatl_mst mat ON --  CurrentMaterials - The materials associated to the CMJ
		cmj.job = mat.job AND
		cmj.suffix = mat.suffix AND
		cmj.site_ref = mat.site_ref
	 WHERE jmj.site_ref = 'CNHREMAN' -- Reman site, since Ujigami is for remanned items
		AND mt.ref_num = jmj.job
		AND mt.ref_line_suf = jmj.suffix
		AND ser.item NOT LIKE '%CORE'
----------------------------------------------------------------------+
--WARNING:  This script requires you to set the SyteLine site context.|
----------------------------------------------------------------------+
DECLARE @SiteRef SiteType
SELECT @SiteRef = site FROM parms
EXEC SetSiteSp @SiteRef, NULL

-- Class --
IF NOT EXISTS (SELECT 1 FROM dbo.user_class WHERE class_name = N'CNH_jobmatl_mst')
    INSERT INTO dbo.user_class (class_name, class_label, class_desc, sys_has_fields, sys_has_tables, sys_apply, sys_delete)
    VALUES (N'CNH_jobmatl_mst', N'CNH', N'jobmatl_mst', 0, 0, NULL, 0)

-- Fields and Class/Fields --
IF NOT EXISTS (SELECT 1 FROM dbo.user_fld WHERE fld_name = N'Uf_CNH_MESDisplayGroup')
    INSERT INTO dbo.user_fld (fld_name, fld_data_type, fld_initial, fld_decimals, fld_desc, sys_apply, sys_delete, fld_UDT, fld_prec)
    VALUES (N'Uf_CNH_MESDisplayGroup', N'nvarchar', NULL, NULL, N'Used by Ujigami to group materials for their Work Instructions', NULL, 0, NULL, 30)
IF NOT EXISTS (SELECT 1 FROM dbo.user_class_fld WHERE class_name = N'CNH_jobmatl_mst' AND fld_name = N'Uf_CNH_MESDisplayGroup')
    INSERT INTO dbo.user_class_fld (class_name, fld_name, sys_apply, sys_delete)
    VALUES (N'CNH_jobmatl_mst', N'Uf_CNH_MESDisplayGroup', NULL, 0)

-- Indexes and Index/Fields --

-- Table/Class --
IF NOT EXISTS (SELECT 1 FROM dbo.table_class WHERE table_name = N'jobmatl_mst' AND class_name = N'CNH_jobmatl_mst')
    INSERT INTO dbo.table_class (table_name, class_name, table_rule, extend_all_recs, sys_apply, sys_delete, allow_record_assoc, active)
    VALUES (N'jobmatl_mst', N'CNH_jobmatl_mst', NULL, 1, NULL, 0, 0, 1)
IF NOT EXISTS (SELECT 1 FROM dbo.table_class WHERE table_name = N'jobmatl_mst_all' AND class_name = N'CNH_jobmatl_mst')
    INSERT INTO dbo.table_class (table_name, class_name, table_rule, extend_all_recs, sys_apply, sys_delete, allow_record_assoc, active)
    VALUES (N'jobmatl_mst_all', N'CNH_jobmatl_mst', NULL, 0, NULL, 0, 0, 1)

-- Impact Schema --
SET NOCOUNT ON
DECLARE @Infobar InfobarType
DECLARE @RedoViews ListYesNoType = 0
EXEC dbo.UETImpactWrapperSp 1, 0, 1, @RedoViews OUTPUT, @Infobar OUTPUT
IF @RedoViews > 0
BEGIN
    DECLARE @IntranetName IntranetNameType
    SELECT TOP 1 @IntranetName = intranet_name FROM intranet
    EXEC dbo.ReCreateUsingSiteViewSp @IntranetName, @Infobar OUTPUT
    EXEC dbo.CreateViewsOverMultiSiteTablesSp NULL, NULL, @Infobar OUTPUT
END


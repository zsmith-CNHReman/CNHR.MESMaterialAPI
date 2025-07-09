----------------------------------------------------------------------+
--WARNING:  This script requires you to set the SyteLine site context.|
----------------------------------------------------------------------+
DECLARE @SiteRef SiteType
SELECT @SiteRef = site FROM parms
EXEC SetSiteSp @SiteRef, NULL

-- Class --
IF NOT EXISTS (SELECT 1 FROM dbo.user_class WHERE class_name = N'CNH_job_mst')
    INSERT INTO dbo.user_class (class_name, class_label, class_desc, sys_has_fields, sys_has_tables, sys_apply, sys_delete)
    VALUES (N'CNH_job_mst', N'CNH', N'job_mst', 0, 0, NULL, 0)

-- Fields and Class/Fields --

IF NOT EXISTS (SELECT 1 FROM dbo.user_fld WHERE fld_name = N'Uf_CNH_MESCompleteDate')
    INSERT INTO dbo.user_fld (fld_name, fld_data_type, fld_initial, fld_decimals, fld_desc, sys_apply, sys_delete, fld_UDT, fld_prec)
    VALUES (N'Uf_CNH_MESCompleteDate', N'datetime', NULL, NULL, N'This field represents the data Ujigami has marked their part complete', NULL, 0, N'DateType', NULL)
IF NOT EXISTS (SELECT 1 FROM dbo.user_class_fld WHERE class_name = N'CNH_job_mst' AND fld_name = N'Uf_CNH_MESCompleteDate')
    INSERT INTO dbo.user_class_fld (class_name, fld_name, sys_apply, sys_delete)
    VALUES (N'CNH_job_mst', N'Uf_CNH_MESCompleteDate', NULL, 0)
-- Indexes and Index/Fields --

-- Table/Class --
IF NOT EXISTS (SELECT 1 FROM dbo.table_class WHERE table_name = N'job_mst' AND class_name = N'CNH_job_mst')
    INSERT INTO dbo.table_class (table_name, class_name, table_rule, extend_all_recs, sys_apply, sys_delete, allow_record_assoc, active)
    VALUES (N'job_mst', N'CNH_job_mst', NULL, 1, NULL, 0, 0, 1)
IF NOT EXISTS (SELECT 1 FROM dbo.table_class WHERE table_name = N'job_mst_all' AND class_name = N'CNH_job_mst')
    INSERT INTO dbo.table_class (table_name, class_name, table_rule, extend_all_recs, sys_apply, sys_delete, allow_record_assoc, active)
    VALUES (N'job_mst_all', N'CNH_job_mst', NULL, 0, NULL, 0, 0, 1)

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


SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CNH_APIAuthMap]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CNH_APIAuthMap](
	[CreatedBy] [dbo].[UsernameType] NOT NULL,
	[UpdatedBy] [dbo].[UsernameType] NOT NULL,
	[CreateDate] [dbo].[CurrentDateType] NOT NULL,
	[RecordDate] [dbo].[CurrentDateType] NOT NULL,
	[RowPointer] [dbo].[RowPointerType] NOT NULL,
	[NoteExistsFlag] [dbo].[FlagNyType] NOT NULL,
	[InWorkflow] [dbo].[FlagNyType] NOT NULL,
	[KeyPointer] [dbo].[RowPointerType] NULL,
	[ApplicationDesc] [dbo].[DescriptionType] NULL,
 CONSTRAINT [PK_CNH_APIAuthMap] PRIMARY KEY CLUSTERED 
(
	[RowPointer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_CNH_APIAuthMap_RowPointer] UNIQUE NONCLUSTERED 
(
	[RowPointer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CNH_APIAuthMap_CreatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CNH_APIAuthMap] ADD  CONSTRAINT [DF_CNH_APIAuthMap_CreatedBy]  DEFAULT (suser_sname()) FOR [CreatedBy]
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CNH_APIAuthMap_UpdatedBy]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CNH_APIAuthMap] ADD  CONSTRAINT [DF_CNH_APIAuthMap_UpdatedBy]  DEFAULT (suser_sname()) FOR [UpdatedBy]
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CNH_APIAuthMap_CreateDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CNH_APIAuthMap] ADD  CONSTRAINT [DF_CNH_APIAuthMap_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CNH_APIAuthMap_RecordDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CNH_APIAuthMap] ADD  CONSTRAINT [DF_CNH_APIAuthMap_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CNH_APIAuthMap_RowPointer]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CNH_APIAuthMap] ADD  CONSTRAINT [DF_CNH_APIAuthMap_RowPointer]  DEFAULT (newid()) FOR [RowPointer]
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CNH_APIAuthMap_NoteExistsFlag]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CNH_APIAuthMap] ADD  CONSTRAINT [DF_CNH_APIAuthMap_NoteExistsFlag]  DEFAULT ((0)) FOR [NoteExistsFlag]
END

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CNH_APIAuthMap_InWorkflow]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CNH_APIAuthMap] ADD  CONSTRAINT [DF_CNH_APIAuthMap_InWorkflow]  DEFAULT ((0)) FOR [InWorkflow]
END

-- Add any missing columns --
IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'CNH_APIAuthMap' AND COLUMN_NAME = 'CreatedBy')
	ALTER TABLE [CNH_APIAuthMap] ADD [CreatedBy] UsernameType NOT NULL

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'CNH_APIAuthMap' AND COLUMN_NAME = 'UpdatedBy')
	ALTER TABLE [CNH_APIAuthMap] ADD [UpdatedBy] UsernameType NOT NULL

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'CNH_APIAuthMap' AND COLUMN_NAME = 'CreateDate')
	ALTER TABLE [CNH_APIAuthMap] ADD [CreateDate] CurrentDateType NOT NULL

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'CNH_APIAuthMap' AND COLUMN_NAME = 'RecordDate')
	ALTER TABLE [CNH_APIAuthMap] ADD [RecordDate] CurrentDateType NOT NULL

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'CNH_APIAuthMap' AND COLUMN_NAME = 'RowPointer')
	ALTER TABLE [CNH_APIAuthMap] ADD [RowPointer] RowPointerType NOT NULL

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'CNH_APIAuthMap' AND COLUMN_NAME = 'NoteExistsFlag')
	ALTER TABLE [CNH_APIAuthMap] ADD [NoteExistsFlag] FlagNyType NOT NULL

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'CNH_APIAuthMap' AND COLUMN_NAME = 'InWorkflow')
	ALTER TABLE [CNH_APIAuthMap] ADD [InWorkflow] FlagNyType NOT NULL

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'CNH_APIAuthMap' AND COLUMN_NAME = 'KeyPointer')
	ALTER TABLE [CNH_APIAuthMap] ADD [KeyPointer] RowPointerType NULL

IF NOT EXISTS(SELECT TOP 1 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'CNH_APIAuthMap' AND COLUMN_NAME = 'ApplicationDesc')
	ALTER TABLE [CNH_APIAuthMap] ADD [ApplicationDesc] DescriptionType NULL

-- Add App Table Module --
IF NOT EXISTS(SELECT TOP 1 1 FROM AppModule WHERE ModuleName = 'Custom')
	INSERT INTO AppModule(ModuleName)VALUES('Custom')

-- Add App Table Definition --
IF NOT EXISTS(SELECT TOP 1 1 FROM AppTable WHERE TableName = 'CNH_APIAuthMap')
	INSERT INTO AppTable(TableName, Update_AllWhen, UpdateRecordDateWhen, IgnoreInsert, IgnoreUpdate, 
						 DisallowUpdate, KeepClusteringKeys, UseRPOnInsert, UseRPOnUpdate, IupTriggerModifiesNewRows,
						 RememberIdentity, RegisterNewKey, TestOutsideLockForNewKey, NextKeyReverseKeyOrder, InheritorTableList,
						 ModuleName, Update_AllRegardlessOfBaseTableChanges, AppViewName, SiteColumnName)
				  VALUES('CNH_APIAuthMap', NULL, NULL, 0, 0,
						 0, 0, 0, 0, 0,
						 0, 0, 0, 0, NULL,
						 'Custom', 0, NULL, NULL)

-- Add App Table Column Definition --

---------------------------------------------------------------------------+
--Trigger and View Section                                                 |
--WARNING:  Triggers and Views will only run when you set the site context.|
---------------------------------------------------------------------------+
DECLARE @RC int
DECLARE @Infobar [dbo].[InfobarType]

IF(EXISTS(SELECT TOP 1 1 FROM parms))
BEGIN
	--Regenerate Table Triggers
	EXECUTE @RC = [dbo].[TriggerIupCodeWrapperSp] 'CNH_APIAuthMap', 'CNH_APIAuthMap', @Infobar OUTPUT
	PRINT @Infobar
END
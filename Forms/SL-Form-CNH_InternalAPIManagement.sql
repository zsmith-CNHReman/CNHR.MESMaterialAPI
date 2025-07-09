-- Form: CNH_InternalAPIManagement
--Scope: Site Original
--Owner: [NULL]
--------------------------------------
--|                          |   S   |
--------------------------------------
--| Component                |    10 |
--------------------------------------
--| ActiveXComponentProperty |     0 |
--------------------------------------
--| Variable                 |     0 |
--------------------------------------
--| DragDropEvent            |     0 |
--------------------------------------
--| DerivedFormOverride      |     0 |
--------------------------------------
--| EventHandler             |     1 |
--------------------------------------
--| Form Script Lines        |    21 |
--------------------------------------
--| Form Script Methods      |     0 |
--------------------------------------

SET NOCOUNT ON;
DECLARE @FormName [nvarchar](50)  = N'CNH_InternalAPIManagement'
DECLARE @ScopeType INT = 1
DECLARE @ScopeName [nvarchar](50)  = N'[NULL]'
DECLARE @FormID INT = (SELECT [ID] FROM Forms WHERE [Name] = @FormName AND [ScopeType] = @ScopeType)
IF @FormID IS NOT NULL
BEGIN
  DELETE FROM Forms WHERE [ID] = @FormID
  DELETE FROM FormEventHandlers WHERE [FormID] = @FormID
  DELETE FROM FormComponents WHERE [FormID] = @FormID
  DELETE FROM ActiveXComponentProperties WHERE [FormID] = @FormID
  DELETE FROM Variables WHERE [FormID] = @FormID
  DELETE FROM FormComponentDragDropEvents WHERE [FormID] = @FormID
  DELETE FROM DerivedFormOverrides WHERE [FormID] = @FormID
  DELETE FROM ActiveXScripts WHERE [Name] = @FormName AND [ScopeType] = @ScopeType
  DELETE FROM ActiveXScriptLines WHERE [ScriptName] = @FormName AND [ScopeType] = @ScopeType
END

INSERT INTO [Forms] (
  [ScopeType], [ScopeName], [Component], [Name], [SubComponent], [Type], [Caption], 
  [PrimaryDataSource], 
  [StandardOperations], [TopPos], [LeftPos], [Height], [Width], [IconFileName], [HelpFileName], [HelpContextID], [Flags], [LockedBy], 
  [FilterFormSpec], [PaneZeroSize], [BaseFormName], [LayoutAttributes], [Description] )
VALUES (
  @ScopeType,   -- [ScopeType]
  @ScopeName,   -- [ScopeName]
  NULL,   -- [Component]
  @FormName,   -- [Name]
  NULL,   -- [SubComponent]
  1,   -- [Type]
  N'fCNH_InternalAPIManagement',   -- [Caption]
  N'CNH_InternalAPIAuths(OBJNAME(oCNH_InternalAPIAuths))',   -- [PrimaryDataSource]
  1019,   -- [StandardOperations]
  CAST('0' AS float),   -- [TopPos]
  CAST('0' AS float),   -- [LeftPos]
  CAST('25' AS float),   -- [Height]
  CAST('75' AS float),   -- [Width]
  NULL,   -- [IconFileName]
  NULL,   -- [HelpFileName]
  -1,   -- [HelpContextID]
  8,   -- [Flags]
  --SplitterHorizontal = 0
  --SplitterVertical = 0
  --UnknownBit3 = 0
  --UnknownBit4 = 1
  --UnknownBit5 = 0
  --UnknownBit6 = 0
  --Pane0ScrollBarsNever = 0
  --UnknownBit7 = 0
  --UnknownBit8 = 0
  --Pane1ScrollBarsNever = 0
  --UnknownBit9 = 0
  --UnknownBit10 = 0
  --UnknownBit11 = 0
  --CloseBoxFalse = 0
  --MinimizeMaximizeBox = 0
  --DisableOnPane0 = 0
  --DisableOnPane1 = 0
  --UnknownBit16 = 0
  --UnknownBit17 = 0
  --UnknownBit18 = 0
  --UnknownBit19 = 0
  --UnknownBit20 = 0
  --UnknownBit21 = 0
  --UnknownBit22 = 0
  --UnknownBit23 = 0
  --UnknownBit24 = 0
  --UnknownBit25 = 0
  --UnknownBit26 = 0
  --UnknownBit27 = 0
  --UnknownBit28 = 0
  --UnknownBit29 = 0
  --UnknownBit30 = 0
  --UnknownBit31 = 0
  NULL,   -- [LockedBy]
  NULL,   -- [FilterFormSpec]
  N'0',   -- [PaneZeroSize]
  NULL,   -- [BaseFormName]
  NULL,   -- [LayoutAttributes]
  NULL   -- [Description]
)

SELECT @FormID = [ID] FROM Forms WHERE [Name] = @FormName AND [ScopeType] = @ScopeType

INSERT INTO FormComponents (
  [FormID], [Name], 
  [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos], [Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption], [LayoutAttributes] )
VALUES (
  @FormID,   -- [FormID]
  N'ApplicationName',   -- [Name]
  -1,   -- [DeviceID]
  0,   -- [TabOrder]
  15,   -- [Type]
  CAST('0' AS float),   -- [TopPos]
  CAST('0' AS float),   -- [LeftPos]
  CAST('5.88' AS float),   -- [Height]
  CAST('0' AS float),   -- [ListHeight]
  CAST('12.5' AS float),   -- [Width]
  N'sApplication',   -- [Caption]
  NULL,   -- [Validators]
  N'KeyMapGrid',   -- [ContainerName]
  0,   -- [ContainerSequence]
  N'object.KeyMap.ApplicationDesc',   -- [DataSource]
  1,   -- [Binding]
  NULL,   -- [EventToGenerate]
  NULL,   -- [SelectionEventToGenerate]
  NULL,   -- [LoseFocusEventToGenerate]
  NULL,   -- [GainFocusEventToGenerate]
  NULL,   -- [RadioButtonSelectedValue]
  NULL,   -- [ComboListSource]
  0,   -- [Flags]
  --SecondSplitterPane = 0
  --ValueIsListIndex = 0
  --Sort = 0
  --Checkbox_Group = 0
  --NoColon_UseDefaultValueOnCopy = 0
  --ValidateImmediately = 0
  --LockedFromScrolling_SelfContainedCaption = 0
  --GlueRight = 0
  --GlueBottom = 0
  --Required = 0
  --DoNotClearValueOnNew = 0
  --UnknownBit12 = 0
  --DisableInFilterInPlace = 0
  --ReadOnlyForExistingRecords = 0
  --ReadOnlyForNewRecords = 0
  --EnableOnNonModifiedRecords = 0
  --EnableOnRequiredDataSupplied = 0
  --ToBeDetermined = 0
  --UnknownBit19 = 0
  --NoTabStop = 0
  --AutoComplete = 0
  --MessageOnStatusBar = 0
  --DateComboBox = 0
  --ReadOnlyForDeletedRecords = 0
  --LockPosition = 0
  --LockSize = 0
  --NoInterpretContents = 0
  --InterpretBoundContents = 0
  --GlueLeft = 0
  --GlueTop = 0
  --UnknownBit31 = 0
  NULL,   -- [DefaultData]
  0,   -- [ReadOnly]
  0,   -- [Hidden]
  NULL,   -- [BitmapFileName]
  NULL,   -- [HelpString]
  NULL,   -- [HelpFileName]
  0,   -- [HelpContextID]
  NULL,   -- [MenuName]
  NULL,   -- [Format]
  NULL,   -- [FindFromSpec]
  NULL,   -- [MaintainFromSpec]
  N'0',   -- [MaxCharacters]
  NULL,   -- [DefaultFrom]
  NULL,   -- [DataType]
  NULL,   -- [ActiveXControlName]
  NULL,   -- [PropertyClassName]
  NULL,   -- [Post301DataType]
  N'AUTOIME(NoControl)',   -- [Post301Format]
  NULL,   -- [Description]
  N'sApplication',   -- [EffectiveCaption]
  NULL   -- [LayoutAttributes]
)


INSERT INTO FormComponents (
  [FormID], [Name], 
  [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos], [Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption], [LayoutAttributes] )
VALUES (
  @FormID,   -- [FormID]
  N'CNH_APIManagementInstructionsStatic',   -- [Name]
  -1,   -- [DeviceID]
  0,   -- [TabOrder]
  0,   -- [Type]
  CAST('0.18' AS float),   -- [TopPos]
  CAST('1.5' AS float),   -- [LeftPos]
  CAST('3.41' AS float),   -- [Height]
  CAST('0' AS float),   -- [ListHeight]
  CAST('66.88' AS float),   -- [Width]
  N'mCNH_APIManagementInstructions',   -- [Caption]
  NULL,   -- [Validators]
  NULL,   -- [ContainerName]
  0,   -- [ContainerSequence]
  NULL,   -- [DataSource]
  0,   -- [Binding]
  NULL,   -- [EventToGenerate]
  NULL,   -- [SelectionEventToGenerate]
  NULL,   -- [LoseFocusEventToGenerate]
  NULL,   -- [GainFocusEventToGenerate]
  NULL,   -- [RadioButtonSelectedValue]
  NULL,   -- [ComboListSource]
  16,   -- [Flags]
  --SecondSplitterPane = 0
  --ValueIsListIndex = 0
  --Sort = 0
  --Checkbox_Group = 0
  --NoColon_UseDefaultValueOnCopy = 1
  --ValidateImmediately = 0
  --LockedFromScrolling_SelfContainedCaption = 0
  --GlueRight = 0
  --GlueBottom = 0
  --Required = 0
  --DoNotClearValueOnNew = 0
  --UnknownBit12 = 0
  --DisableInFilterInPlace = 0
  --ReadOnlyForExistingRecords = 0
  --ReadOnlyForNewRecords = 0
  --EnableOnNonModifiedRecords = 0
  --EnableOnRequiredDataSupplied = 0
  --ToBeDetermined = 0
  --UnknownBit19 = 0
  --NoTabStop = 0
  --AutoComplete = 0
  --MessageOnStatusBar = 0
  --DateComboBox = 0
  --ReadOnlyForDeletedRecords = 0
  --LockPosition = 0
  --LockSize = 0
  --NoInterpretContents = 0
  --InterpretBoundContents = 0
  --GlueLeft = 0
  --GlueTop = 0
  --UnknownBit31 = 0
  NULL,   -- [DefaultData]
  0,   -- [ReadOnly]
  0,   -- [Hidden]
  NULL,   -- [BitmapFileName]
  NULL,   -- [HelpString]
  NULL,   -- [HelpFileName]
  0,   -- [HelpContextID]
  NULL,   -- [MenuName]
  NULL,   -- [Format]
  NULL,   -- [FindFromSpec]
  NULL,   -- [MaintainFromSpec]
  N'0',   -- [MaxCharacters]
  NULL,   -- [DefaultFrom]
  NULL,   -- [DataType]
  NULL,   -- [ActiveXControlName]
  NULL,   -- [PropertyClassName]
  NULL,   -- [Post301DataType]
  N'AUTOIME(NoControl) JUSTIFY(R)',   -- [Post301Format]
  NULL,   -- [Description]
  N'mCNH_APIManagementInstructions',   -- [EffectiveCaption]
  NULL   -- [LayoutAttributes]
)


INSERT INTO FormComponents (
  [FormID], [Name], 
  [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos], [Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption], [LayoutAttributes] )
VALUES (
  @FormID,   -- [FormID]
  N'CNH_APIRolesGrid',   -- [Name]
  -1,   -- [DeviceID]
  0,   -- [TabOrder]
  14,   -- [Type]
  CAST('3.87' AS float),   -- [TopPos]
  CAST('0.88' AS float),   -- [LeftPos]
  CAST('17.41' AS float),   -- [Height]
  CAST('0' AS float),   -- [ListHeight]
  CAST('20.62' AS float),   -- [Width]
  N'sCNH_APIRoles',   -- [Caption]
  NULL,   -- [Validators]
  NULL,   -- [ContainerName]
  0,   -- [ContainerSequence]
  N'objects',   -- [DataSource]
  3,   -- [Binding]
  NULL,   -- [EventToGenerate]
  NULL,   -- [SelectionEventToGenerate]
  NULL,   -- [LoseFocusEventToGenerate]
  NULL,   -- [GainFocusEventToGenerate]
  NULL,   -- [RadioButtonSelectedValue]
  NULL,   -- [ComboListSource]
  0,   -- [Flags]
  --SecondSplitterPane = 0
  --ValueIsListIndex = 0
  --Sort = 0
  --Checkbox_Group = 0
  --NoColon_UseDefaultValueOnCopy = 0
  --ValidateImmediately = 0
  --LockedFromScrolling_SelfContainedCaption = 0
  --GlueRight = 0
  --GlueBottom = 0
  --Required = 0
  --DoNotClearValueOnNew = 0
  --UnknownBit12 = 0
  --DisableInFilterInPlace = 0
  --ReadOnlyForExistingRecords = 0
  --ReadOnlyForNewRecords = 0
  --EnableOnNonModifiedRecords = 0
  --EnableOnRequiredDataSupplied = 0
  --ToBeDetermined = 0
  --UnknownBit19 = 0
  --NoTabStop = 0
  --AutoComplete = 0
  --MessageOnStatusBar = 0
  --DateComboBox = 0
  --ReadOnlyForDeletedRecords = 0
  --LockPosition = 0
  --LockSize = 0
  --NoInterpretContents = 0
  --InterpretBoundContents = 0
  --GlueLeft = 0
  --GlueTop = 0
  --UnknownBit31 = 0
  NULL,   -- [DefaultData]
  0,   -- [ReadOnly]
  0,   -- [Hidden]
  NULL,   -- [BitmapFileName]
  NULL,   -- [HelpString]
  NULL,   -- [HelpFileName]
  0,   -- [HelpContextID]
  NULL,   -- [MenuName]
  NULL,   -- [Format]
  NULL,   -- [FindFromSpec]
  NULL,   -- [MaintainFromSpec]
  N'0',   -- [MaxCharacters]
  NULL,   -- [DefaultFrom]
  NULL,   -- [DataType]
  NULL,   -- [ActiveXControlName]
  NULL,   -- [PropertyClassName]
  NULL,   -- [Post301DataType]
  N'AUTOIME(NoControl)',   -- [Post301Format]
  NULL,   -- [Description]
  N'sCNH_APIRoles',   -- [EffectiveCaption]
  NULL   -- [LayoutAttributes]
)


INSERT INTO FormComponents (
  [FormID], [Name], 
  [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos], [Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption], [LayoutAttributes] )
VALUES (
  @FormID,   -- [FormID]
  N'CNH_GeneratedKeyStatic',   -- [Name]
  -1,   -- [DeviceID]
  0,   -- [TabOrder]
  0,   -- [Type]
  CAST('6' AS float),   -- [TopPos]
  CAST('20.25' AS float),   -- [LeftPos]
  CAST('1' AS float),   -- [Height]
  CAST('0' AS float),   -- [ListHeight]
  CAST('12.75' AS float),   -- [Width]
  N'sCNH_GeneratedKey',   -- [Caption]
  NULL,   -- [Validators]
  NULL,   -- [ContainerName]
  0,   -- [ContainerSequence]
  NULL,   -- [DataSource]
  0,   -- [Binding]
  NULL,   -- [EventToGenerate]
  NULL,   -- [SelectionEventToGenerate]
  NULL,   -- [LoseFocusEventToGenerate]
  NULL,   -- [GainFocusEventToGenerate]
  NULL,   -- [RadioButtonSelectedValue]
  NULL,   -- [ComboListSource]
  0,   -- [Flags]
  --SecondSplitterPane = 0
  --ValueIsListIndex = 0
  --Sort = 0
  --Checkbox_Group = 0
  --NoColon_UseDefaultValueOnCopy = 0
  --ValidateImmediately = 0
  --LockedFromScrolling_SelfContainedCaption = 0
  --GlueRight = 0
  --GlueBottom = 0
  --Required = 0
  --DoNotClearValueOnNew = 0
  --UnknownBit12 = 0
  --DisableInFilterInPlace = 0
  --ReadOnlyForExistingRecords = 0
  --ReadOnlyForNewRecords = 0
  --EnableOnNonModifiedRecords = 0
  --EnableOnRequiredDataSupplied = 0
  --ToBeDetermined = 0
  --UnknownBit19 = 0
  --NoTabStop = 0
  --AutoComplete = 0
  --MessageOnStatusBar = 0
  --DateComboBox = 0
  --ReadOnlyForDeletedRecords = 0
  --LockPosition = 0
  --LockSize = 0
  --NoInterpretContents = 0
  --InterpretBoundContents = 0
  --GlueLeft = 0
  --GlueTop = 0
  --UnknownBit31 = 0
  NULL,   -- [DefaultData]
  0,   -- [ReadOnly]
  0,   -- [Hidden]
  NULL,   -- [BitmapFileName]
  NULL,   -- [HelpString]
  NULL,   -- [HelpFileName]
  0,   -- [HelpContextID]
  NULL,   -- [MenuName]
  NULL,   -- [Format]
  NULL,   -- [FindFromSpec]
  NULL,   -- [MaintainFromSpec]
  N'0',   -- [MaxCharacters]
  NULL,   -- [DefaultFrom]
  NULL,   -- [DataType]
  NULL,   -- [ActiveXControlName]
  NULL,   -- [PropertyClassName]
  NULL,   -- [Post301DataType]
  N'AUTOIME(NoControl) JUSTIFY(R)',   -- [Post301Format]
  NULL,   -- [Description]
  N'sCNH_GeneratedKey',   -- [EffectiveCaption]
  NULL   -- [LayoutAttributes]
)


INSERT INTO FormComponents (
  [FormID], [Name], 
  [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos], [Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption], [LayoutAttributes] )
VALUES (
  @FormID,   -- [FormID]
  N'CNH_GenerateNewKeyBtn',   -- [Name]
  -1,   -- [DeviceID]
  0,   -- [TabOrder]
  8,   -- [Type]
  CAST('8.47' AS float),   -- [TopPos]
  CAST('43.56' AS float),   -- [LeftPos]
  CAST('1.06' AS float),   -- [Height]
  CAST('0' AS float),   -- [ListHeight]
  CAST('18' AS float),   -- [Width]
  N'sCNH_GenerateNewKey',   -- [Caption]
  NULL,   -- [Validators]
  NULL,   -- [ContainerName]
  0,   -- [ContainerSequence]
  NULL,   -- [DataSource]
  0,   -- [Binding]
  N'CNH_GenerateBtnClicked',   -- [EventToGenerate]
  NULL,   -- [SelectionEventToGenerate]
  NULL,   -- [LoseFocusEventToGenerate]
  NULL,   -- [GainFocusEventToGenerate]
  NULL,   -- [RadioButtonSelectedValue]
  NULL,   -- [ComboListSource]
  0,   -- [Flags]
  --SecondSplitterPane = 0
  --ValueIsListIndex = 0
  --Sort = 0
  --Checkbox_Group = 0
  --NoColon_UseDefaultValueOnCopy = 0
  --ValidateImmediately = 0
  --LockedFromScrolling_SelfContainedCaption = 0
  --GlueRight = 0
  --GlueBottom = 0
  --Required = 0
  --DoNotClearValueOnNew = 0
  --UnknownBit12 = 0
  --DisableInFilterInPlace = 0
  --ReadOnlyForExistingRecords = 0
  --ReadOnlyForNewRecords = 0
  --EnableOnNonModifiedRecords = 0
  --EnableOnRequiredDataSupplied = 0
  --ToBeDetermined = 0
  --UnknownBit19 = 0
  --NoTabStop = 0
  --AutoComplete = 0
  --MessageOnStatusBar = 0
  --DateComboBox = 0
  --ReadOnlyForDeletedRecords = 0
  --LockPosition = 0
  --LockSize = 0
  --NoInterpretContents = 0
  --InterpretBoundContents = 0
  --GlueLeft = 0
  --GlueTop = 0
  --UnknownBit31 = 0
  NULL,   -- [DefaultData]
  0,   -- [ReadOnly]
  0,   -- [Hidden]
  NULL,   -- [BitmapFileName]
  NULL,   -- [HelpString]
  NULL,   -- [HelpFileName]
  0,   -- [HelpContextID]
  NULL,   -- [MenuName]
  NULL,   -- [Format]
  NULL,   -- [FindFromSpec]
  NULL,   -- [MaintainFromSpec]
  N'0',   -- [MaxCharacters]
  NULL,   -- [DefaultFrom]
  NULL,   -- [DataType]
  NULL,   -- [ActiveXControlName]
  NULL,   -- [PropertyClassName]
  NULL,   -- [Post301DataType]
  N'AUTOIME(NoControl)',   -- [Post301Format]
  NULL,   -- [Description]
  N'sCNH_GenerateNewKey',   -- [EffectiveCaption]
  NULL   -- [LayoutAttributes]
)


INSERT INTO FormComponents (
  [FormID], [Name], 
  [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos], [Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption], [LayoutAttributes] )
VALUES (
  @FormID,   -- [FormID]
  N'CNH_RoleDescGridCol',   -- [Name]
  -1,   -- [DeviceID]
  0,   -- [TabOrder]
  15,   -- [Type]
  CAST('0' AS float),   -- [TopPos]
  CAST('0' AS float),   -- [LeftPos]
  CAST('5.88' AS float),   -- [Height]
  CAST('0' AS float),   -- [ListHeight]
  CAST('12.5' AS float),   -- [Width]
  N'sCNH_APIRole',   -- [Caption]
  NULL,   -- [Validators]
  N'CNH_APIRolesGrid',   -- [ContainerName]
  0,   -- [ContainerSequence]
  N'object.RoleDesc',   -- [DataSource]
  1,   -- [Binding]
  NULL,   -- [EventToGenerate]
  NULL,   -- [SelectionEventToGenerate]
  NULL,   -- [LoseFocusEventToGenerate]
  NULL,   -- [GainFocusEventToGenerate]
  NULL,   -- [RadioButtonSelectedValue]
  NULL,   -- [ComboListSource]
  0,   -- [Flags]
  --SecondSplitterPane = 0
  --ValueIsListIndex = 0
  --Sort = 0
  --Checkbox_Group = 0
  --NoColon_UseDefaultValueOnCopy = 0
  --ValidateImmediately = 0
  --LockedFromScrolling_SelfContainedCaption = 0
  --GlueRight = 0
  --GlueBottom = 0
  --Required = 0
  --DoNotClearValueOnNew = 0
  --UnknownBit12 = 0
  --DisableInFilterInPlace = 0
  --ReadOnlyForExistingRecords = 0
  --ReadOnlyForNewRecords = 0
  --EnableOnNonModifiedRecords = 0
  --EnableOnRequiredDataSupplied = 0
  --ToBeDetermined = 0
  --UnknownBit19 = 0
  --NoTabStop = 0
  --AutoComplete = 0
  --MessageOnStatusBar = 0
  --DateComboBox = 0
  --ReadOnlyForDeletedRecords = 0
  --LockPosition = 0
  --LockSize = 0
  --NoInterpretContents = 0
  --InterpretBoundContents = 0
  --GlueLeft = 0
  --GlueTop = 0
  --UnknownBit31 = 0
  NULL,   -- [DefaultData]
  0,   -- [ReadOnly]
  0,   -- [Hidden]
  NULL,   -- [BitmapFileName]
  NULL,   -- [HelpString]
  NULL,   -- [HelpFileName]
  0,   -- [HelpContextID]
  NULL,   -- [MenuName]
  NULL,   -- [Format]
  NULL,   -- [FindFromSpec]
  NULL,   -- [MaintainFromSpec]
  N'0',   -- [MaxCharacters]
  NULL,   -- [DefaultFrom]
  NULL,   -- [DataType]
  NULL,   -- [ActiveXControlName]
  NULL,   -- [PropertyClassName]
  NULL,   -- [Post301DataType]
  N'AUTOIME(NoControl)',   -- [Post301Format]
  NULL,   -- [Description]
  N'sCNH_APIRole',   -- [EffectiveCaption]
  NULL   -- [LayoutAttributes]
)


INSERT INTO FormComponents (
  [FormID], [Name], 
  [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos], [Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption], [LayoutAttributes] )
VALUES (
  @FormID,   -- [FormID]
  N'GeneratedKeyEdit',   -- [Name]
  -1,   -- [DeviceID]
  0,   -- [TabOrder]
  1,   -- [Type]
  CAST('5.94' AS float),   -- [TopPos]
  CAST('33.75' AS float),   -- [LeftPos]
  CAST('1.29' AS float),   -- [Height]
  CAST('0' AS float),   -- [ListHeight]
  CAST('37.62' AS float),   -- [Width]
  N'sCNH_GeneratedKey',   -- [Caption]
  NULL,   -- [Validators]
  NULL,   -- [ContainerName]
  0,   -- [ContainerSequence]
  N'variables.CNH_NewAPIKey',   -- [DataSource]
  6,   -- [Binding]
  NULL,   -- [EventToGenerate]
  NULL,   -- [SelectionEventToGenerate]
  NULL,   -- [LoseFocusEventToGenerate]
  NULL,   -- [GainFocusEventToGenerate]
  NULL,   -- [RadioButtonSelectedValue]
  NULL,   -- [ComboListSource]
  0,   -- [Flags]
  --SecondSplitterPane = 0
  --ValueIsListIndex = 0
  --Sort = 0
  --Checkbox_Group = 0
  --NoColon_UseDefaultValueOnCopy = 0
  --ValidateImmediately = 0
  --LockedFromScrolling_SelfContainedCaption = 0
  --GlueRight = 0
  --GlueBottom = 0
  --Required = 0
  --DoNotClearValueOnNew = 0
  --UnknownBit12 = 0
  --DisableInFilterInPlace = 0
  --ReadOnlyForExistingRecords = 0
  --ReadOnlyForNewRecords = 0
  --EnableOnNonModifiedRecords = 0
  --EnableOnRequiredDataSupplied = 0
  --ToBeDetermined = 0
  --UnknownBit19 = 0
  --NoTabStop = 0
  --AutoComplete = 0
  --MessageOnStatusBar = 0
  --DateComboBox = 0
  --ReadOnlyForDeletedRecords = 0
  --LockPosition = 0
  --LockSize = 0
  --NoInterpretContents = 0
  --InterpretBoundContents = 0
  --GlueLeft = 0
  --GlueTop = 0
  --UnknownBit31 = 0
  NULL,   -- [DefaultData]
  1,   -- [ReadOnly]
  0,   -- [Hidden]
  NULL,   -- [BitmapFileName]
  NULL,   -- [HelpString]
  NULL,   -- [HelpFileName]
  0,   -- [HelpContextID]
  NULL,   -- [MenuName]
  NULL,   -- [Format]
  NULL,   -- [FindFromSpec]
  NULL,   -- [MaintainFromSpec]
  N'0',   -- [MaxCharacters]
  NULL,   -- [DefaultFrom]
  NULL,   -- [DataType]
  NULL,   -- [ActiveXControlName]
  NULL,   -- [PropertyClassName]
  NULL,   -- [Post301DataType]
  N'AUTOIME(NoControl)',   -- [Post301Format]
  NULL,   -- [Description]
  N'sCNH_GeneratedKey',   -- [EffectiveCaption]
  NULL   -- [LayoutAttributes]
)


INSERT INTO FormComponents (
  [FormID], [Name], 
  [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos], [Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption], [LayoutAttributes] )
VALUES (
  @FormID,   -- [FormID]
  N'KeyMapGrid',   -- [Name]
  -1,   -- [DeviceID]
  0,   -- [TabOrder]
  14,   -- [Type]
  CAST('12' AS float),   -- [TopPos]
  CAST('34.12' AS float),   -- [LeftPos]
  CAST('8.82' AS float),   -- [Height]
  CAST('0' AS float),   -- [ListHeight]
  CAST('37.12' AS float),   -- [Width]
  NULL,   -- [Caption]
  NULL,   -- [Validators]
  NULL,   -- [ContainerName]
  0,   -- [ContainerSequence]
  N'object.KeyMap( CA(DIVNRS) )',   -- [DataSource]
  4,   -- [Binding]
  NULL,   -- [EventToGenerate]
  NULL,   -- [SelectionEventToGenerate]
  NULL,   -- [LoseFocusEventToGenerate]
  NULL,   -- [GainFocusEventToGenerate]
  NULL,   -- [RadioButtonSelectedValue]
  NULL,   -- [ComboListSource]
  0,   -- [Flags]
  --SecondSplitterPane = 0
  --ValueIsListIndex = 0
  --Sort = 0
  --Checkbox_Group = 0
  --NoColon_UseDefaultValueOnCopy = 0
  --ValidateImmediately = 0
  --LockedFromScrolling_SelfContainedCaption = 0
  --GlueRight = 0
  --GlueBottom = 0
  --Required = 0
  --DoNotClearValueOnNew = 0
  --UnknownBit12 = 0
  --DisableInFilterInPlace = 0
  --ReadOnlyForExistingRecords = 0
  --ReadOnlyForNewRecords = 0
  --EnableOnNonModifiedRecords = 0
  --EnableOnRequiredDataSupplied = 0
  --ToBeDetermined = 0
  --UnknownBit19 = 0
  --NoTabStop = 0
  --AutoComplete = 0
  --MessageOnStatusBar = 0
  --DateComboBox = 0
  --ReadOnlyForDeletedRecords = 0
  --LockPosition = 0
  --LockSize = 0
  --NoInterpretContents = 0
  --InterpretBoundContents = 0
  --GlueLeft = 0
  --GlueTop = 0
  --UnknownBit31 = 0
  NULL,   -- [DefaultData]
  0,   -- [ReadOnly]
  0,   -- [Hidden]
  NULL,   -- [BitmapFileName]
  NULL,   -- [HelpString]
  NULL,   -- [HelpFileName]
  0,   -- [HelpContextID]
  NULL,   -- [MenuName]
  NULL,   -- [Format]
  NULL,   -- [FindFromSpec]
  NULL,   -- [MaintainFromSpec]
  N'0',   -- [MaxCharacters]
  NULL,   -- [DefaultFrom]
  NULL,   -- [DataType]
  NULL,   -- [ActiveXControlName]
  NULL,   -- [PropertyClassName]
  NULL,   -- [Post301DataType]
  N'AUTOIME(NoControl)',   -- [Post301Format]
  NULL,   -- [Description]
  NULL,   -- [EffectiveCaption]
  NULL   -- [LayoutAttributes]
)


INSERT INTO FormComponents (
  [FormID], [Name], 
  [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos], [Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption], [LayoutAttributes] )
VALUES (
  @FormID,   -- [FormID]
  N'RoleDescEdit',   -- [Name]
  -1,   -- [DeviceID]
  0,   -- [TabOrder]
  1,   -- [Type]
  CAST('4' AS float),   -- [TopPos]
  CAST('33.75' AS float),   -- [LeftPos]
  CAST('1.29' AS float),   -- [Height]
  CAST('0' AS float),   -- [ListHeight]
  CAST('37.62' AS float),   -- [Width]
  N'C(RoleDescStatic)',   -- [Caption]
  NULL,   -- [Validators]
  NULL,   -- [ContainerName]
  0,   -- [ContainerSequence]
  N'object.RoleDesc',   -- [DataSource]
  1,   -- [Binding]
  NULL,   -- [EventToGenerate]
  NULL,   -- [SelectionEventToGenerate]
  NULL,   -- [LoseFocusEventToGenerate]
  NULL,   -- [GainFocusEventToGenerate]
  NULL,   -- [RadioButtonSelectedValue]
  NULL,   -- [ComboListSource]
  0,   -- [Flags]
  --SecondSplitterPane = 0
  --ValueIsListIndex = 0
  --Sort = 0
  --Checkbox_Group = 0
  --NoColon_UseDefaultValueOnCopy = 0
  --ValidateImmediately = 0
  --LockedFromScrolling_SelfContainedCaption = 0
  --GlueRight = 0
  --GlueBottom = 0
  --Required = 0
  --DoNotClearValueOnNew = 0
  --UnknownBit12 = 0
  --DisableInFilterInPlace = 0
  --ReadOnlyForExistingRecords = 0
  --ReadOnlyForNewRecords = 0
  --EnableOnNonModifiedRecords = 0
  --EnableOnRequiredDataSupplied = 0
  --ToBeDetermined = 0
  --UnknownBit19 = 0
  --NoTabStop = 0
  --AutoComplete = 0
  --MessageOnStatusBar = 0
  --DateComboBox = 0
  --ReadOnlyForDeletedRecords = 0
  --LockPosition = 0
  --LockSize = 0
  --NoInterpretContents = 0
  --InterpretBoundContents = 0
  --GlueLeft = 0
  --GlueTop = 0
  --UnknownBit31 = 0
  NULL,   -- [DefaultData]
  0,   -- [ReadOnly]
  0,   -- [Hidden]
  NULL,   -- [BitmapFileName]
  NULL,   -- [HelpString]
  NULL,   -- [HelpFileName]
  0,   -- [HelpContextID]
  NULL,   -- [MenuName]
  NULL,   -- [Format]
  NULL,   -- [FindFromSpec]
  NULL,   -- [MaintainFromSpec]
  N'0',   -- [MaxCharacters]
  NULL,   -- [DefaultFrom]
  NULL,   -- [DataType]
  NULL,   -- [ActiveXControlName]
  NULL,   -- [PropertyClassName]
  NULL,   -- [Post301DataType]
  N'AUTOIME(NoControl)',   -- [Post301Format]
  NULL,   -- [Description]
  N'C(RoleDescStatic)',   -- [EffectiveCaption]
  NULL   -- [LayoutAttributes]
)


INSERT INTO FormComponents (
  [FormID], [Name], 
  [DeviceID], 
  [TabOrder], [Type], [TopPos], [LeftPos], [Height], [ListHeight], [Width], [Caption], 
  [Validators], 
  [ContainerName], [ContainerSequence], [DataSource], 
  [Binding], [EventToGenerate], [SelectionEventToGenerate], [LoseFocusEventToGenerate], [GainFocusEventToGenerate], [RadioButtonSelectedValue], 
  [ComboListSource], 
  [Flags], [DefaultData], [ReadOnly], [Hidden], [BitmapFileName], [HelpString], [HelpFileName], [HelpContextID], [MenuName], 
  [Format], [FindFromSpec], [MaintainFromSpec], 
  [MaxCharacters], [DefaultFrom], [DataType], [ActiveXControlName], [PropertyClassName], 
  [Post301DataType], [Post301Format], 
  [Description], [EffectiveCaption], [LayoutAttributes] )
VALUES (
  @FormID,   -- [FormID]
  N'RoleDescStatic',   -- [Name]
  -1,   -- [DeviceID]
  0,   -- [TabOrder]
  0,   -- [Type]
  CAST('4.12' AS float),   -- [TopPos]
  CAST('28' AS float),   -- [LeftPos]
  CAST('1' AS float),   -- [Height]
  CAST('0' AS float),   -- [ListHeight]
  CAST('4.75' AS float),   -- [Width]
  N'sCNH_APIRole',   -- [Caption]
  NULL,   -- [Validators]
  NULL,   -- [ContainerName]
  0,   -- [ContainerSequence]
  NULL,   -- [DataSource]
  0,   -- [Binding]
  NULL,   -- [EventToGenerate]
  NULL,   -- [SelectionEventToGenerate]
  NULL,   -- [LoseFocusEventToGenerate]
  NULL,   -- [GainFocusEventToGenerate]
  NULL,   -- [RadioButtonSelectedValue]
  NULL,   -- [ComboListSource]
  0,   -- [Flags]
  --SecondSplitterPane = 0
  --ValueIsListIndex = 0
  --Sort = 0
  --Checkbox_Group = 0
  --NoColon_UseDefaultValueOnCopy = 0
  --ValidateImmediately = 0
  --LockedFromScrolling_SelfContainedCaption = 0
  --GlueRight = 0
  --GlueBottom = 0
  --Required = 0
  --DoNotClearValueOnNew = 0
  --UnknownBit12 = 0
  --DisableInFilterInPlace = 0
  --ReadOnlyForExistingRecords = 0
  --ReadOnlyForNewRecords = 0
  --EnableOnNonModifiedRecords = 0
  --EnableOnRequiredDataSupplied = 0
  --ToBeDetermined = 0
  --UnknownBit19 = 0
  --NoTabStop = 0
  --AutoComplete = 0
  --MessageOnStatusBar = 0
  --DateComboBox = 0
  --ReadOnlyForDeletedRecords = 0
  --LockPosition = 0
  --LockSize = 0
  --NoInterpretContents = 0
  --InterpretBoundContents = 0
  --GlueLeft = 0
  --GlueTop = 0
  --UnknownBit31 = 0
  NULL,   -- [DefaultData]
  0,   -- [ReadOnly]
  0,   -- [Hidden]
  NULL,   -- [BitmapFileName]
  NULL,   -- [HelpString]
  NULL,   -- [HelpFileName]
  0,   -- [HelpContextID]
  NULL,   -- [MenuName]
  NULL,   -- [Format]
  NULL,   -- [FindFromSpec]
  NULL,   -- [MaintainFromSpec]
  N'0',   -- [MaxCharacters]
  NULL,   -- [DefaultFrom]
  NULL,   -- [DataType]
  NULL,   -- [ActiveXControlName]
  NULL,   -- [PropertyClassName]
  NULL,   -- [Post301DataType]
  N'AUTOIME(NoControl) JUSTIFY(R)',   -- [Post301Format]
  NULL,   -- [Description]
  N'sCNH_APIRole',   -- [EffectiveCaption]
  NULL   -- [LayoutAttributes]
)


DECLARE @EventHandlerSeq as int
--CNH_GenerateBtnClicked
SET @EventHandlerSeq = -1 --Set to -1 so first seq is 0
SET @EventHandlerSeq += 1
INSERT INTO FormEventHandlers ( [FormID], [EventName], [Sequence], [ResponseType], [Response], [Response2], [Response3], [Description] ) 
VALUES (
  @FormID,   -- [FormID]
  N'CNH_GenerateBtnClicked',   -- [EventName]
  @EventHandlerSeq,   -- [Sequence]
  35,   -- [ResponseType]
  N'CNH_GenerateKey()',   -- [Response]
  NULL,   -- [Response2]
  NULL,   -- [Response3]
  NULL   -- [Description]
)


DECLARE @ScriptSeq as int = -1 --Starts at -1 so first seq is 0
INSERT INTO ActiveXScripts ( [Name], [ScopeType], [ScopeName], [LockedBy], [Language] ) 
VALUES (
  @FormName,   -- [Name]
  @ScopeType,   -- [ScopeType]
  @ScopeName,   -- [ScopeName]
  NULL,   -- [LockedBy]
  N'Visual Basic'   -- [Language]
)

SET @ScriptSeq += 1
INSERT INTO ActiveXScriptLines ( [ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine] ) 
VALUES (
  @FormName,   -- [ScriptName]
  @ScopeType,   -- [ScopeType]
  @ScopeName,   -- [ScopeName]
  @ScriptSeq,   -- [Sequence]
  N'Option Explicit On'   -- [CodeLine]
)

SET @ScriptSeq += 1
INSERT INTO ActiveXScriptLines ( [ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine] ) 
VALUES (
  @FormName,   -- [ScriptName]
  @ScopeType,   -- [ScopeType]
  @ScopeName,   -- [ScopeName]
  @ScriptSeq,   -- [Sequence]
  N'Option Strict On'   -- [CodeLine]
)

SET @ScriptSeq += 1
INSERT INTO ActiveXScriptLines ( [ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine] ) 
VALUES (
  @FormName,   -- [ScriptName]
  @ScopeType,   -- [ScopeType]
  @ScopeName,   -- [ScopeName]
  @ScriptSeq,   -- [Sequence]
  N'Imports System'   -- [CodeLine]
)

SET @ScriptSeq += 1
INSERT INTO ActiveXScriptLines ( [ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine] ) 
VALUES (
  @FormName,   -- [ScriptName]
  @ScopeType,   -- [ScopeType]
  @ScopeName,   -- [ScopeName]
  @ScriptSeq,   -- [Sequence]
  N'Imports Microsoft.VisualBasic'   -- [CodeLine]
)

SET @ScriptSeq += 1
INSERT INTO ActiveXScriptLines ( [ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine] ) 
VALUES (
  @FormName,   -- [ScriptName]
  @ScopeType,   -- [ScopeType]
  @ScopeName,   -- [ScopeName]
  @ScriptSeq,   -- [Sequence]
  N'Imports Mongoose.IDO.Protocol'   -- [CodeLine]
)

SET @ScriptSeq += 1
INSERT INTO ActiveXScriptLines ( [ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine] ) 
VALUES (
  @FormName,   -- [ScriptName]
  @ScopeType,   -- [ScopeType]
  @ScopeName,   -- [ScopeName]
  @ScriptSeq,   -- [Sequence]
  N'Imports Mongoose.Scripting'   -- [CodeLine]
)

SET @ScriptSeq += 1
INSERT INTO ActiveXScriptLines ( [ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine] ) 
VALUES (
  @FormName,   -- [ScriptName]
  @ScopeType,   -- [ScopeType]
  @ScopeName,   -- [ScopeName]
  @ScriptSeq,   -- [Sequence]
  N'Namespace Mongoose.FormScripts'   -- [CodeLine]
)

SET @ScriptSeq += 1
INSERT INTO ActiveXScriptLines ( [ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine] ) 
VALUES (
  @FormName,   -- [ScriptName]
  @ScopeType,   -- [ScopeType]
  @ScopeName,   -- [ScopeName]
  @ScriptSeq,   -- [Sequence]
  N'Public Class CNH_InternalAPIManagement'   -- [CodeLine]
)

SET @ScriptSeq += 1
INSERT INTO ActiveXScriptLines ( [ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine] ) 
VALUES (
  @FormName,   -- [ScriptName]
  @ScopeType,   -- [ScopeType]
  @ScopeName,   -- [ScopeName]
  @ScriptSeq,   -- [Sequence]
  N'Inherits FormScript'   -- [CodeLine]
)

SET @ScriptSeq += 1
INSERT INTO ActiveXScriptLines ( [ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine] ) 
VALUES (
  @FormName,   -- [ScriptName]
  @ScopeType,   -- [ScopeType]
  @ScopeName,   -- [ScopeName]
  @ScriptSeq,   -- [Sequence]
  N'        Public Sub CNH_GenerateKey()'   -- [CodeLine]
)

SET @ScriptSeq += 1
INSERT INTO ActiveXScriptLines ( [ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine] ) 
VALUES (
  @FormName,   -- [ScriptName]
  @ScopeType,   -- [ScopeType]
  @ScopeName,   -- [ScopeName]
  @ScriptSeq,   -- [Sequence]
  N'            Dim newkey As String = ""'   -- [CodeLine]
)

SET @ScriptSeq += 1
INSERT INTO ActiveXScriptLines ( [ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine] ) 
VALUES (
  @FormName,   -- [ScriptName]
  @ScopeType,   -- [ScopeType]
  @ScopeName,   -- [ScopeName]
  @ScriptSeq,   -- [Sequence]
  N'            Dim Infobar As String = ""'   -- [CodeLine]
)

SET @ScriptSeq += 1
INSERT INTO ActiveXScriptLines ( [ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine] ) 
VALUES (
  @FormName,   -- [ScriptName]
  @ScopeType,   -- [ScopeType]
  @ScopeName,   -- [ScopeName]
  @ScriptSeq,   -- [Sequence]
  N'            Dim rowpointer As String = ThisForm.CurrentIDOCollection.CurrentItem.Properties("RowPointer").Value'   -- [CodeLine]
)

SET @ScriptSeq += 1
INSERT INTO ActiveXScriptLines ( [ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine] ) 
VALUES (
  @FormName,   -- [ScriptName]
  @ScopeType,   -- [ScopeType]
  @ScopeName,   -- [ScopeName]
  @ScriptSeq,   -- [Sequence]
  N'            Dim res As InvokeResponseData = Me.IDOClient.Invoke("CNH_InternalAPIAuths", "CNH_KeyGen", New Object() {rowpointer, newkey, Infobar})'   -- [CodeLine]
)

SET @ScriptSeq += 1
INSERT INTO ActiveXScriptLines ( [ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine] ) 
VALUES (
  @FormName,   -- [ScriptName]
  @ScopeType,   -- [ScopeType]
  @ScopeName,   -- [ScopeName]
  @ScriptSeq,   -- [Sequence]
  N'            Infobar = res.Parameters(2).Value'   -- [CodeLine]
)

SET @ScriptSeq += 1
INSERT INTO ActiveXScriptLines ( [ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine] ) 
VALUES (
  @FormName,   -- [ScriptName]
  @ScopeType,   -- [ScopeType]
  @ScopeName,   -- [ScopeName]
  @ScriptSeq,   -- [Sequence]
  N'            newkey = res.Parameters(1).Value'   -- [CodeLine]
)

SET @ScriptSeq += 1
INSERT INTO ActiveXScriptLines ( [ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine] ) 
VALUES (
  @FormName,   -- [ScriptName]
  @ScopeType,   -- [ScopeType]
  @ScopeName,   -- [ScopeName]
  @ScriptSeq,   -- [Sequence]
  N'            Application.ShowMessage(Infobar)'   -- [CodeLine]
)

SET @ScriptSeq += 1
INSERT INTO ActiveXScriptLines ( [ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine] ) 
VALUES (
  @FormName,   -- [ScriptName]
  @ScopeType,   -- [ScopeType]
  @ScopeName,   -- [ScopeName]
  @ScriptSeq,   -- [Sequence]
  N'            ThisForm.Variables("CNH_NewAPIKey").SetValue(newkey)'   -- [CodeLine]
)

SET @ScriptSeq += 1
INSERT INTO ActiveXScriptLines ( [ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine] ) 
VALUES (
  @FormName,   -- [ScriptName]
  @ScopeType,   -- [ScopeType]
  @ScopeName,   -- [ScopeName]
  @ScriptSeq,   -- [Sequence]
  N'        End Sub'   -- [CodeLine]
)

SET @ScriptSeq += 1
INSERT INTO ActiveXScriptLines ( [ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine] ) 
VALUES (
  @FormName,   -- [ScriptName]
  @ScopeType,   -- [ScopeType]
  @ScopeName,   -- [ScopeName]
  @ScriptSeq,   -- [Sequence]
  N'End Class'   -- [CodeLine]
)

SET @ScriptSeq += 1
INSERT INTO ActiveXScriptLines ( [ScriptName], [ScopeType], [ScopeName], [Sequence], [CodeLine] ) 
VALUES (
  @FormName,   -- [ScriptName]
  @ScopeType,   -- [ScopeType]
  @ScopeName,   -- [ScopeName]
  @ScriptSeq,   -- [Sequence]
  N'End Namespace'   -- [CodeLine]
)

/*
Option Explicit On
Option Strict On
Imports System
Imports Microsoft.VisualBasic
Imports Mongoose.IDO.Protocol
Imports Mongoose.Scripting
Namespace Mongoose.FormScripts
Public Class CNH_InternalAPIManagement
Inherits FormScript
        Public Sub CNH_GenerateKey()
            Dim newkey As String = ""
            Dim Infobar As String = ""
            Dim rowpointer As String = ThisForm.CurrentIDOCollection.CurrentItem.Properties("RowPointer").Value
            Dim res As InvokeResponseData = Me.IDOClient.Invoke("CNH_InternalAPIAuths", "CNH_KeyGen", New Object() {rowpointer, newkey, Infobar})
            Infobar = res.Parameters(2).Value
            newkey = res.Parameters(1).Value
            Application.ShowMessage(Infobar)
            ThisForm.Variables("CNH_NewAPIKey").SetValue(newkey)
        End Sub
End Class
End Namespace
*/

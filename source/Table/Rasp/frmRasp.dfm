object Rasp: TRasp
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1040#1048#1057' '#1088#1077#1075#1080#1089#1090#1088#1072#1090#1091#1088#1099' '#1087#1086#1083#1080#1082#1083#1080#1085#1080#1082#1080' RegPol:'#1056#1072#1089#1087#1080#1089#1072#1085#1080#1077
  ClientHeight = 352
  ClientWidth = 398
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 20
    Top = 13
    Width = 89
    Height = 13
    Caption = 'ID '#1056#1072#1089#1087#1080#1089#1072#1085#1080#1103'*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 20
    Top = 98
    Width = 131
    Height = 13
    Caption = #1063#1072#1089#1099' '#1085#1072#1095#1072#1083#1072' '#1088#1072#1073#1086#1090#1099'*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 20
    Top = 126
    Width = 151
    Height = 13
    Caption = #1063#1072#1089#1099' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1088#1072#1073#1086#1090#1099'*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 20
    Top = 40
    Width = 131
    Height = 13
    Caption = #1044#1077#1085#1100' '#1085#1072#1095#1072#1083#1072' '#1088#1072#1073#1086#1090#1099'*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 20
    Top = 68
    Width = 151
    Height = 13
    Caption = #1044#1077#1085#1100' '#1086#1082#1086#1085#1095#1072#1085#1080#1103' '#1088#1072#1073#1086#1090#1099'*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 12
    Top = 162
    Width = 356
    Height = 65
    Caption = #1053#1072#1074#1080#1075#1072#1094#1080#1103
    Color = clCream
    ParentBackground = False
    ParentColor = False
    TabOrder = 0
    object FirstBtn: TButton
      Left = 18
      Top = 25
      Width = 75
      Height = 25
      Caption = #1042' '#1085#1072#1095#1072#1083#1086
      TabOrder = 0
      OnClick = FirstBtnClick
    end
    object LastBtn: TButton
      Left = 262
      Top = 25
      Width = 75
      Height = 25
      Caption = #1042' '#1082#1086#1085#1077#1094
      TabOrder = 1
      OnClick = LastBtnClick
    end
    object BackBtn: TButton
      Left = 100
      Top = 25
      Width = 75
      Height = 25
      Caption = #1053#1072#1079#1072#1076
      TabOrder = 2
      OnClick = BackBtnClick
    end
    object NextBtn: TButton
      Left = 181
      Top = 25
      Width = 75
      Height = 25
      Caption = #1042#1087#1077#1088#1105#1076
      TabOrder = 3
      OnClick = NextBtnClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 12
    Top = 233
    Width = 356
    Height = 65
    Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1076#1072#1085#1085#1099#1084#1080
    Color = clCream
    ParentBackground = False
    ParentColor = False
    TabOrder = 1
    object ChangeBtn: TButton
      Left = 19
      Top = 21
      Width = 75
      Height = 25
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 0
      OnClick = ChangeBtnClick
    end
    object DeleteBtn: TButton
      Left = 100
      Top = 21
      Width = 75
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 1
      OnClick = DeleteBtnClick
    end
    object AddBtn: TButton
      Left = 181
      Top = 21
      Width = 75
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      TabOrder = 2
      OnClick = AddBtnClick
    end
    object SaveBtn: TButton
      Left = 262
      Top = 21
      Width = 75
      Height = 25
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Enabled = False
      TabOrder = 3
      OnClick = SaveBtnClick
    end
  end
  object ID_RASP: TEdit
    Left = 177
    Top = 10
    Width = 41
    Height = 21
    Enabled = False
    NumbersOnly = True
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = -7
    Top = 312
    Width = 409
    Height = 41
    Caption = 'Panel1'
    TabOrder = 3
    object Label4: TLabel
      Left = 11
      Top = 14
      Width = 34
      Height = 13
      Caption = #1055#1086#1080#1089#1082':'
    end
    object Search: TEdit
      Left = 51
      Top = 11
      Width = 202
      Height = 21
      TabOrder = 0
      TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1076#1077#1085#1100' '#1085#1072#1095#1072#1083#1072' '#1088#1072#1073#1086#1090#1099
      OnChange = SearchChange
    end
    object TableBtn: TButton
      Left = 289
      Top = 7
      Width = 75
      Height = 25
      Caption = #1058#1072#1073#1083#1080#1094#1072
      TabOrder = 1
      OnClick = TableBtnClick
    end
  end
  object HOURS_START: TMaskEdit
    Left = 177
    Top = 95
    Width = 41
    Height = 21
    Hint = #1055#1088#1080#1084#1077#1088': '#1063#1058'-'#1055#1053
    Enabled = False
    EditMask = '!90:00;1;_'
    MaxLength = 5
    TabOrder = 4
    Text = '  :  '
  end
  object HOURS_END: TMaskEdit
    Left = 177
    Top = 123
    Width = 41
    Height = 21
    Enabled = False
    EditMask = '!90:00;1;_'
    MaxLength = 5
    TabOrder = 5
    Text = '  :  '
  end
  object Days_start: TComboBox
    Left = 177
    Top = 37
    Width = 99
    Height = 21
    Style = csDropDownList
    Enabled = False
    TabOrder = 6
    OnChange = Days_startChange
    Items.Strings = (
      #1055#1086#1085#1077#1076#1077#1083#1100#1085#1080#1082
      #1042#1090#1086#1088#1085#1080#1082
      #1057#1088#1077#1076#1072
      #1063#1077#1090#1074#1077#1088#1075
      #1055#1103#1090#1085#1080#1094#1072)
  end
  object Days_end: TComboBox
    Left = 177
    Top = 65
    Width = 99
    Height = 21
    Style = csDropDownList
    Enabled = False
    TabOrder = 7
    Items.Strings = (
      #1055#1086#1085#1077#1076#1077#1083#1100#1085#1080#1082
      #1042#1090#1086#1088#1085#1080#1082
      #1057#1088#1077#1076#1072
      #1063#1077#1090#1074#1077#1088#1075
      #1055#1103#1090#1085#1080#1094#1072)
  end
  object DB: TIBDatabase
    DatabaseName = 'localhost/3051:D:\kp19is2\data\REGPOL.IB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'sql_role_name=dbo'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    DefaultTransaction = IBTransaction
    ServerType = 'IBServer'
    Left = 366
    Top = 168
  end
  object IBTransaction: TIBTransaction
    DefaultDatabase = DB
    Left = 342
    Top = 104
  end
  object DataSource1: TDataSource
    Left = 382
    Top = 88
  end
  object RASP: TIBQuery
    Database = DB
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 310
    Top = 56
  end
  object Query: TIBQuery
    Database = DB
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DataSource1
    ParamCheck = False
    Left = 342
    Top = 32
  end
end

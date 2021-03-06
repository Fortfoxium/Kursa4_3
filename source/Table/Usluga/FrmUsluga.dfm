object Usluga: TUsluga
  Left = 0
  Top = 0
  Cursor = crHandPoint
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1040#1048#1057' '#1088#1077#1075#1080#1089#1090#1088#1072#1090#1091#1088#1099' '#1087#1086#1083#1080#1082#1083#1080#1085#1080#1082#1080' RegPol:'#1059#1089#1083#1091#1075#1080' '
  ClientHeight = 270
  ClientWidth = 398
  Color = clInfoBk
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 20
    Top = 15
    Width = 63
    Height = 13
    Caption = 'ID '#1059#1089#1083#1091#1075#1080'*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 20
    Top = 47
    Width = 104
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1091#1089#1083#1091#1075#1080'*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 20
    Top = 79
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
      Left = 99
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
    Left = 20
    Top = 159
    Width = 356
    Height = 65
    Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1076#1072#1085#1085#1099#1084#1080
    Color = clCream
    ParentBackground = False
    ParentColor = False
    TabOrder = 1
    object ChangeBtn: TButton
      Left = 18
      Top = 21
      Width = 75
      Height = 25
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100
      TabOrder = 0
      OnClick = ChangeBtnClick
    end
    object DeleteBtn: TButton
      Left = 99
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
  object ID_MED_USL: TEdit
    Left = 128
    Top = 12
    Width = 41
    Height = 21
    Enabled = False
    TabOrder = 2
  end
  object MED_USL: TEdit
    Left = 128
    Top = 44
    Width = 248
    Height = 21
    Enabled = False
    MaxLength = 50
    TabOrder = 3
    OnKeyPress = MED_USLKeyPress
  end
  object Panel1: TPanel
    Left = -8
    Top = 230
    Width = 409
    Height = 41
    Caption = 'Panel1'
    Color = clBtnHighlight
    ParentBackground = False
    TabOrder = 4
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
      TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1085#1072#1079#1074#1072#1085#1080#1077' '#1091#1089#1083#1091#1075#1080
      OnChange = SearchChange
    end
    object TableBtn: TButton
      Left = 290
      Top = 7
      Width = 75
      Height = 25
      Caption = #1058#1072#1073#1083#1080#1094#1072
      TabOrder = 1
      OnClick = TableBtnClick
    end
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
    Left = 384
    Top = 112
  end
  object IBTransaction: TIBTransaction
    DefaultDatabase = DB
    Left = 384
    Top = 88
  end
  object DataSource: TDataSource
    Left = 384
  end
  object USLUGA: TIBQuery
    Database = DB
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 384
    Top = 32
  end
  object Query: TIBQuery
    Database = DB
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DataSource
    ParamCheck = False
    Left = 384
    Top = 64
  end
end

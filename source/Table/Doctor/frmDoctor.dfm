object Doctor: TDoctor
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1040#1048#1057' '#1088#1077#1075#1080#1089#1090#1088#1072#1090#1091#1088#1099' '#1087#1086#1083#1080#1082#1083#1080#1085#1080#1082#1080' RegPol:'#1042#1088#1072#1095#1080
  ClientHeight = 347
  ClientWidth = 400
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
    Top = 15
    Width = 58
    Height = 13
    Caption = 'ID '#1042#1088#1072#1095#1072'*'
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
    Width = 57
    Height = 13
    Caption = #1060#1072#1084#1080#1083#1080#1103'*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 20
    Top = 80
    Width = 30
    Height = 13
    Caption = #1048#1084#1103'*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 20
    Top = 111
    Width = 63
    Height = 13
    Caption = #1054#1090#1095#1077#1089#1090#1074#1086'*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 20
    Top = 144
    Width = 97
    Height = 13
    Caption = #1043#1088#1072#1092#1080#1082' '#1088#1072#1073#1086#1090#1099'*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 20
    Top = 168
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
    Top = 239
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
  object ID_DOCTOR: TEdit
    Left = 128
    Top = 12
    Width = 41
    Height = 21
    Enabled = False
    NumbersOnly = True
    TabOrder = 2
  end
  object FNAME_DOC: TEdit
    Left = 128
    Top = 44
    Width = 225
    Height = 21
    Enabled = False
    MaxLength = 30
    TabOrder = 3
    OnKeyPress = FNAME_DOCKeyPress
  end
  object NAME_DOC: TEdit
    Left = 128
    Top = 77
    Width = 225
    Height = 21
    Enabled = False
    MaxLength = 30
    TabOrder = 4
    OnKeyPress = FNAME_DOCKeyPress
  end
  object OTCHNAME_DOC: TEdit
    Left = 128
    Top = 108
    Width = 225
    Height = 21
    Enabled = False
    MaxLength = 30
    TabOrder = 5
    OnKeyPress = FNAME_DOCKeyPress
  end
  object ID_RASP: TComboBox
    Left = 128
    Top = 141
    Width = 225
    Height = 21
    Style = csDropDownList
    Enabled = False
    TabOrder = 6
  end
  object Panel1: TPanel
    Left = -7
    Top = 310
    Width = 409
    Height = 41
    Caption = 'Panel1'
    TabOrder = 7
    object Label6: TLabel
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
      TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1092#1072#1084#1080#1083#1080#1102' '#1074#1088#1072#1095#1072
      OnChange = SearchChange
    end
    object TableBtn: TButton
      Left = 289
      Top = 8
      Width = 75
      Height = 25
      Caption = #1058#1072#1073#1083#1080#1094#1072
      TabOrder = 1
      OnClick = TableBtnClick
    end
  end
  object Query: TIBQuery
    Database = DB
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DataSource
    ParamCheck = False
    Left = 349
    Top = 88
  end
  object DataSource: TDataSource
    Left = 365
    Top = 16
  end
  object DOCTOR: TIBQuery
    Database = DB
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 277
    Top = 64
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
    Left = 117
    Top = 64
  end
  object IBTransaction: TIBTransaction
    DefaultDatabase = DB
    Left = 77
    Top = 16
  end
  object IBQuery1: TIBQuery
    Database = DB
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 350
    Top = 232
  end
end

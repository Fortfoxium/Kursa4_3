object Doctors: TDoctors
  Left = 0
  Top = 0
  Caption = #1040#1048#1057' '#1056#1077#1075#1080#1089#1090#1088#1072#1090#1091#1088#1099' RegPol: '#1042#1099#1074#1086#1076' '#1089#1087#1080#1089#1082#1072' '#1087#1072#1094#1080#1077#1085#1090#1086#1074
  ClientHeight = 503
  ClientWidth = 1006
  Color = clMedGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object Label2: TLabel
    Left = 29
    Top = 45
    Width = 3
    Height = 15
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 990
    Height = 52
    Color = clBtnShadow
    ParentBackground = False
    ParentColor = False
    TabOrder = 4
    object Label1: TLabel
      Left = 21
      Top = 10
      Width = 281
      Height = 21
      Caption = #1059#1089#1083#1091#1075#1072' '#1085#1072' '#1082#1086#1090#1086#1088#1091#1102' '#1079#1072#1087#1080#1089#1072#1085#1099' '#1087#1072#1094#1080#1077#1085#1090#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
  end
  object ID_MED_USL: TComboBox
    Left = 335
    Top = 20
    Width = 233
    Height = 23
    Style = csDropDownList
    TabOrder = 0
    OnChange = ID_MED_USLChange
  end
  object DBGrid1: TDBGrid
    Left = 17
    Top = 66
    Width = 969
    Height = 404
    DataSource = DataSource
    Enabled = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object print: TButton
    Left = 8
    Top = 476
    Width = 137
    Height = 25
    Caption = #1042#1099#1074#1077#1089#1090#1080' '#1089#1087#1080#1089#1086#1082' '#1074' Excel'
    Enabled = False
    TabOrder = 2
    OnClick = printClick
  end
  object DateTimePicker1: TDateTimePicker
    Left = 590
    Top = 20
    Width = 186
    Height = 23
    Date = 44698.000000000000000000
    Time = 0.534053113427944500
    TabOrder = 3
    OnChange = DateTimePicker1Change
  end
  object DB: TIBDatabase
    DatabaseName = 'localhost/3051:D:\kp19is2\data\REGPOL.IB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'sql_role_name=dbo'
      'lc_ctype=WIN1251')
    LoginPrompt = False
    DefaultTransaction = Trans
    ServerType = 'IBServer'
    Left = 512
    Top = 50
  end
  object Trans: TIBTransaction
    DefaultDatabase = DB
    Left = 544
    Top = 50
  end
  object DataSource: TDataSource
    DataSet = Query
    Left = 592
    Top = 50
  end
  object Query: TIBQuery
    Database = DB
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = False
    Left = 480
    Top = 50
  end
  object MainMenu1: TMainMenu
    Left = 432
    Top = 216
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object N2: TMenuItem
        Caption = #1042#1099#1073#1088#1072#1090#1100' '#1087#1091#1090#1100' '#1089#1086#1093#1088#1072#1085#1077#1085#1080#1103
        OnClick = N2Click
      end
    end
  end
end

object Talon: TTalon
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1040#1048#1057' '#1056#1077#1075#1080#1089#1090#1088#1072#1090#1091#1088#1099' RegPol: '#1058#1072#1083#1086#1085#1099
  ClientHeight = 357
  ClientWidth = 428
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 11
    Width = 50
    Height = 13
    Caption = 'ID '#1090#1072#1083#1086#1085#1072
  end
  object Label2: TLabel
    Left = 12
    Top = 38
    Width = 63
    Height = 13
    Caption = #1044#1072#1090#1072' '#1079#1072#1087#1080#1089#1080
  end
  object Label3: TLabel
    Left = 12
    Top = 65
    Width = 67
    Height = 13
    Caption = #1042#1088#1077#1084#1103' '#1079#1072#1087#1080#1089#1080
  end
  object Label5: TLabel
    Left = 12
    Top = 92
    Width = 115
    Height = 13
    Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1090#1072#1083#1086#1085#1072
  end
  object Label6: TLabel
    Left = 12
    Top = 119
    Width = 99
    Height = 13
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1082#1072#1073#1080#1085#1077#1090#1072
  end
  object Label7: TLabel
    Left = 12
    Top = 146
    Width = 74
    Height = 13
    Caption = #1060#1048#1054' '#1087#1072#1094#1080#1077#1085#1090#1072
  end
  object ID_TALON: TEdit
    Left = 376
    Top = 8
    Width = 41
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object DateZap: TDateTimePicker
    Left = 320
    Top = 35
    Width = 97
    Height = 21
    Date = 44687.000000000000000000
    Time = 0.724518101851572300
    Enabled = False
    TabOrder = 2
  end
  object DatATALON: TDateTimePicker
    Left = 320
    Top = 89
    Width = 97
    Height = 21
    Date = 44687.000000000000000000
    Time = 0.724518101851572300
    Enabled = False
    TabOrder = 3
  end
  object TIMEZAP: TEdit
    Left = 320
    Top = 62
    Width = 97
    Height = 21
    Enabled = False
    TabOrder = 4
  end
  object CAB: TComboBox
    Left = 192
    Top = 116
    Width = 225
    Height = 21
    Enabled = False
    TabOrder = 5
  end
  object ID_PACIENT: TComboBox
    Left = 192
    Top = 143
    Width = 225
    Height = 21
    Enabled = False
    TabOrder = 6
  end
  object GroupBox1: TGroupBox
    Left = 34
    Top = 170
    Width = 356
    Height = 65
    Caption = #1053#1072#1074#1080#1075#1072#1094#1080#1103
    Color = clGradientActiveCaption
    ParentBackground = False
    ParentColor = False
    TabOrder = 7
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
    Left = 34
    Top = 241
    Width = 356
    Height = 65
    Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1076#1072#1085#1085#1099#1084#1080
    Color = clGradientActiveCaption
    ParentBackground = False
    ParentColor = False
    TabOrder = 8
    object DeleteBtn: TButton
      Left = 18
      Top = 21
      Width = 75
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 0
      OnClick = DeleteBtnClick
    end
  end
  object NewTalon: TButton
    Left = 133
    Top = 262
    Width = 238
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1085#1086#1074#1099#1081' '#1090#1072#1083#1086#1085
    TabOrder = 0
    OnClick = NewTalonClick
  end
  object GroupBox3: TGroupBox
    Left = -1
    Top = 312
    Width = 435
    Height = 49
    Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1092#1091#1085#1082#1094#1080#1080
    Color = clSkyBlue
    ParentBackground = False
    ParentColor = False
    TabOrder = 9
    object TableBtn: TButton
      Left = 13
      Top = 15
      Width = 54
      Height = 25
      Caption = #1058#1072#1073#1083#1080#1094#1072
      TabOrder = 0
      OnClick = TableBtnClick
    end
    object Button1: TButton
      Left = 71
      Top = 15
      Width = 130
      Height = 25
      Caption = #1042#1099#1074#1077#1089#1090#1080' '#1074' '#1092#1072#1081#1083' Word'
      TabOrder = 1
      OnClick = Button1Click
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
    Left = 264
    Top = 16
  end
  object IBTransaction: TIBTransaction
    DefaultDatabase = DB
    Left = 186
    Top = 64
  end
  object DataSource1: TDataSource
    Left = 136
    Top = 16
  end
  object TALON: TIBQuery
    Database = DB
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 194
    Top = 16
  end
  object Query: TIBQuery
    Database = DB
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DataSource1
    ParamCheck = False
    Left = 234
    Top = 16
  end
  object MainMenu1: TMainMenu
    Left = 398
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

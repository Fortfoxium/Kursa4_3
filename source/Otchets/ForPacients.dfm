object Pacients: TPacients
  Left = 0
  Top = 0
  Caption = #1040#1048#1057' '#1056#1077#1075#1080#1089#1090#1088#1072#1090#1091#1088#1099' RegPol: '#1042#1099#1074#1086#1076' '#1090#1072#1083#1086#1085#1072
  ClientHeight = 259
  ClientWidth = 413
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label1: TLabel
    Left = 4
    Top = 3
    Width = 52
    Height = 15
    Caption = 'ID '#1090#1072#1083#1086#1085#1072
  end
  object Label2: TLabel
    Left = 4
    Top = 30
    Width = 66
    Height = 15
    Caption = #1044#1072#1090#1072' '#1079#1072#1087#1080#1089#1080
  end
  object Label3: TLabel
    Left = 4
    Top = 57
    Width = 76
    Height = 15
    Caption = #1042#1088#1077#1084#1103' '#1079#1072#1087#1080#1089#1080
  end
  object Label5: TLabel
    Left = 4
    Top = 84
    Width = 119
    Height = 15
    Caption = #1044#1072#1090#1072' '#1089#1086#1079#1076#1072#1085#1080#1103' '#1090#1072#1083#1086#1085#1072
  end
  object Label6: TLabel
    Left = 4
    Top = 111
    Width = 105
    Height = 15
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1082#1072#1073#1080#1085#1077#1090#1072
  end
  object Label7: TLabel
    Left = 4
    Top = 138
    Width = 81
    Height = 15
    Caption = #1060#1048#1054' '#1087#1072#1094#1080#1077#1085#1090#1072
  end
  object ID_TALON: TEdit
    Left = 368
    Top = 0
    Width = 41
    Height = 23
    Enabled = False
    TabOrder = 0
  end
  object DateZap: TDateTimePicker
    Left = 312
    Top = 27
    Width = 97
    Height = 21
    Date = 44687.000000000000000000
    Time = 0.724518101851572300
    Enabled = False
    TabOrder = 1
  end
  object DatATALON: TDateTimePicker
    Left = 312
    Top = 81
    Width = 97
    Height = 21
    Date = 44687.000000000000000000
    Time = 0.724518101851572300
    Enabled = False
    TabOrder = 2
  end
  object TIMEZAP: TEdit
    Left = 312
    Top = 54
    Width = 97
    Height = 23
    Enabled = False
    TabOrder = 3
  end
  object CAB: TComboBox
    Left = 184
    Top = 108
    Width = 225
    Height = 23
    Enabled = False
    TabOrder = 4
  end
  object ID_PACIENT: TComboBox
    Left = 184
    Top = 135
    Width = 225
    Height = 23
    Enabled = False
    TabOrder = 5
  end
  object GroupBox1: TGroupBox
    Left = 26
    Top = 162
    Width = 356
    Height = 65
    Caption = #1053#1072#1074#1080#1075#1072#1094#1080#1103
    Color = clCream
    ParentBackground = False
    ParentColor = False
    TabOrder = 6
    object FirstBtn: TButton
      Left = 18
      Top = 25
      Width = 75
      Height = 25
      Caption = #1042' '#1085#1072#1095#1072#1083#1086
      TabOrder = 0
    end
    object LastBtn: TButton
      Left = 262
      Top = 25
      Width = 75
      Height = 25
      Caption = #1042' '#1082#1086#1085#1077#1094
      TabOrder = 1
    end
    object BackBtn: TButton
      Left = 99
      Top = 25
      Width = 75
      Height = 25
      Caption = #1053#1072#1079#1072#1076
      TabOrder = 2
    end
    object NextBtn: TButton
      Left = 181
      Top = 25
      Width = 75
      Height = 25
      Caption = #1042#1087#1077#1088#1105#1076
      TabOrder = 3
    end
  end
  object Button1: TButton
    Left = 272
    Top = 233
    Width = 91
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1090#1072#1083#1086#1085
    TabOrder = 7
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
    Left = 256
    Top = 8
  end
  object IBTransaction: TIBTransaction
    DefaultDatabase = DB
    Left = 178
    Top = 56
  end
  object DataSource1: TDataSource
    Left = 128
    Top = 8
  end
  object TALON: TIBQuery
    Database = DB
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    PrecommittedReads = False
    Left = 186
    Top = 8
  end
  object Query: TIBQuery
    Database = DB
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DataSource1
    ParamCheck = False
    PrecommittedReads = False
    Left = 226
    Top = 8
  end
end

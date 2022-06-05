object FrmNewTalon: TFrmNewTalon
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1040#1048#1057' '#1056#1077#1075#1080#1089#1090#1088#1072#1090#1091#1088#1099' RegPol: '#1055#1086#1080#1089#1082' '#1087#1072#1094#1080#1077#1085#1090#1072' '#1076#1083#1103' '#1090#1072#1083#1086#1085#1072
  ClientHeight = 316
  ClientWidth = 633
  Color = clInfoBk
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = True
  PrintScale = poNone
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object NoPacient: TLabel
    Left = 427
    Top = 178
    Width = 139
    Height = 19
    Cursor = crHandPoint
    Caption = #1053#1077#1090' '#1090#1072#1082#1086#1075#1086' '#1087#1072#1094#1080#1077#1085#1090#1072'?'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clHotLight
    Font.Height = -14
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    OnClick = NoPacientClick
    OnMouseEnter = NoPacientMouseEnter
    OnMouseLeave = NoPacientMouseLeave
  end
  object Labelf: TLabel
    Left = 8
    Top = 119
    Width = 195
    Height = 19
    Caption = #1042#1099#1073#1086#1088' '#1076#1072#1090#1099' '#1080' '#1074#1088#1077#1084#1077#1085#1080' '#1079#1072#1087#1080#1089#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -14
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 8
    Top = 5
    Width = 159
    Height = 19
    Caption = #1048#1085#1092#1086#1088#1084#1072#1094#1080#1103' '#1086' '#1087#1072#1094#1080#1077#1085#1090#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -14
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 8
    Top = 30
    Width = 617
    Height = 84
    Color = clMenuBar
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 83
      Height = 15
      Caption = #1048#1084#1103' '#1087#1072#1094#1080#1077#1085#1090#1072'*'
    end
    object Label2: TLabel
      Left = 8
      Top = 29
      Width = 110
      Height = 15
      Caption = #1060#1072#1084#1080#1083#1080#1103' '#1087#1072#1094#1080#1077#1085#1090#1072'*'
    end
    object Label3: TLabel
      Left = 8
      Top = 50
      Width = 110
      Height = 15
      Caption = #1054#1090#1095#1077#1089#1090#1074#1086' '#1087#1072#1094#1080#1077#1085#1090#1072'*'
    end
    object Label4: TLabel
      Left = 311
      Top = 8
      Width = 142
      Height = 15
      Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103' '#1087#1072#1094#1080#1077#1085#1090#1072'*'
    end
    object NamePac: TEdit
      Left = 125
      Top = 8
      Width = 162
      Height = 15
      BorderStyle = bsNone
      MaxLength = 30
      TabOrder = 0
      TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1080#1084#1103' '#1087#1072#1094#1080#1077#1085#1090#1072' '
      OnChange = NamePacChange
      OnKeyPress = NamePacKeyPress
    end
    object Fname: TEdit
      Left = 125
      Top = 29
      Width = 162
      Height = 15
      BorderStyle = bsNone
      MaxLength = 30
      TabOrder = 1
      TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1092#1072#1084#1080#1083#1080#1102' '#1087#1072#1094#1080#1077#1085#1090#1072' '
      OnChange = FnameChange
      OnKeyPress = NamePacKeyPress
    end
    object OTCHNAME: TEdit
      Left = 125
      Top = 50
      Width = 162
      Height = 15
      BorderStyle = bsNone
      MaxLength = 30
      TabOrder = 2
      TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1086#1090#1095#1077#1089#1090#1074#1086' '#1087#1072#1094#1080#1077#1085#1090#1072
      OnChange = OTCHNAMEChange
      OnKeyPress = NamePacKeyPress
    end
    object Date_Born: TDateTimePicker
      Left = 459
      Top = 8
      Width = 131
      Height = 18
      Date = 44665.000000000000000000
      Time = 0.493385636575112600
      TabOrder = 3
      OnChange = NamePacChange
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 144
    Width = 401
    Height = 129
    Color = clMenuBar
    ParentBackground = False
    TabOrder = 1
    object Label5: TLabel
      Left = 8
      Top = 19
      Width = 123
      Height = 15
      Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1084#1077#1076'.  '#1091#1089#1083#1091#1075#1091
    end
    object Label6: TLabel
      Left = 8
      Top = 56
      Width = 123
      Height = 15
      Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1076#1077#1085#1100' '#1079#1072#1087#1080#1089#1080
    end
    object Label7: TLabel
      Left = 8
      Top = 93
      Width = 132
      Height = 15
      Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1074#1088#1077#1084#1103' '#1079#1072#1087#1080#1089#1080
    end
    object ID_MED_USL: TComboBox
      Left = 144
      Top = 16
      Width = 241
      Height = 23
      Style = csDropDownList
      TabOrder = 0
      OnChange = ID_MED_USLChange
    end
    object Days: TComboBox
      Left = 144
      Top = 53
      Width = 241
      Height = 23
      Style = csDropDownList
      Enabled = False
      TabOrder = 1
      OnChange = DaysChange
    end
    object Hours: TComboBox
      Left = 144
      Top = 90
      Width = 241
      Height = 23
      Style = csDropDownList
      Enabled = False
      TabOrder = 2
    end
  end
  object Button1: TButton
    Left = 427
    Top = 147
    Width = 171
    Height = 25
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1090#1072#1083#1086#1085
    TabOrder = 2
    OnClick = Button1Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 288
    Width = 633
    Height = 28
    Panels = <
      item
        Width = 50
      end>
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
    Left = 304
    Top = 112
  end
  object Trans: TIBTransaction
    DefaultDatabase = DB
    Left = 328
    Top = 112
  end
  object DataSource: TDataSource
    Left = 240
    Top = 112
  end
  object Query: TIBQuery
    Database = DB
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DataSource
    ParamCheck = False
    Left = 272
    Top = 112
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

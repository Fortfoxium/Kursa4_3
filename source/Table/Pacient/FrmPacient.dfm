object Pacient: TPacient
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1040#1048#1057' '#1088#1077#1075#1080#1089#1090#1088#1072#1090#1091#1088#1099' '#1087#1086#1083#1080#1082#1083#1080#1085#1080#1082#1080' RegPol:'#1055#1072#1094#1080#1077#1085#1090#1099
  ClientHeight = 333
  ClientWidth = 881
  Color = clGradientInactiveCaption
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
    Width = 80
    Height = 13
    Caption = 'ID '#1055#1072#1094#1080#1077#1085#1090#1072'*'
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
    Left = 306
    Top = 47
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
    Left = 582
    Top = 47
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
    Top = 82
    Width = 102
    Height = 13
    Caption = #1044#1072#1090#1072' '#1088#1086#1078#1076#1077#1085#1080#1103'*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 20
    Top = 111
    Width = 149
    Height = 13
    Caption = #8470' '#1072#1084#1073#1091#1083#1072#1090#1086#1088#1085#1086#1081' '#1082#1072#1088#1090#1099'*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 20
    Top = 194
    Width = 115
    Height = 13
    Caption = #1069#1083#1077#1082#1090#1088#1086#1085#1085#1072#1103' '#1087#1086#1095#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 20
    Top = 139
    Width = 105
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1090#1077#1083#1077#1092#1086#1085#1072'*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 20
    Top = 167
    Width = 49
    Height = 13
    Caption = #8470' '#1054#1052#1057'*'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 226
    Width = 356
    Height = 65
    Caption = #1053#1072#1074#1080#1075#1072#1094#1080#1103
    Color = clSkyBlue
    ParentBackground = False
    ParentColor = False
    TabOrder = 0
    object FirstBtn: TButton
      Left = 16
      Top = 21
      Width = 75
      Height = 25
      Caption = #1042' '#1085#1072#1095#1072#1083#1086
      TabOrder = 0
      OnClick = FirstBtnClick
    end
    object LastBtn: TButton
      Left = 260
      Top = 21
      Width = 75
      Height = 25
      Caption = #1042' '#1082#1086#1085#1077#1094
      TabOrder = 1
      OnClick = LastBtnClick
    end
    object BackBtn: TButton
      Left = 97
      Top = 21
      Width = 75
      Height = 25
      Caption = #1053#1072#1079#1072#1076
      TabOrder = 2
      OnClick = BackBtnClick
    end
    object NextBtn: TButton
      Left = 178
      Top = 21
      Width = 75
      Height = 25
      Caption = #1042#1087#1077#1088#1105#1076
      TabOrder = 3
      OnClick = NextBtnClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 377
    Top = 226
    Width = 356
    Height = 65
    Caption = #1056#1072#1073#1086#1090#1072' '#1089' '#1076#1072#1085#1085#1099#1084#1080
    Color = clSkyBlue
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
  object ID_PACIENT: TEdit
    Left = 128
    Top = 12
    Width = 41
    Height = 21
    Enabled = False
    NumbersOnly = True
    TabOrder = 2
  end
  object FNAME: TEdit
    Left = 82
    Top = 44
    Width = 216
    Height = 21
    Enabled = False
    MaxLength = 30
    TabOrder = 3
    OnKeyPress = FNAMEKeyPress
  end
  object NAME: TEdit
    Left = 339
    Top = 44
    Width = 229
    Height = 21
    Enabled = False
    MaxLength = 30
    TabOrder = 4
    OnKeyPress = FNAMEKeyPress
  end
  object OTCHNAME: TEdit
    Left = 644
    Top = 44
    Width = 229
    Height = 21
    Enabled = False
    MaxLength = 30
    TabOrder = 5
    OnKeyPress = FNAMEKeyPress
  end
  object ID_CART: TEdit
    Left = 175
    Top = 106
    Width = 182
    Height = 21
    Enabled = False
    MaxLength = 5
    NumbersOnly = True
    TabOrder = 6
  end
  object EMAIL: TEdit
    Left = 141
    Top = 191
    Width = 216
    Height = 21
    Enabled = False
    MaxLength = 30
    TabOrder = 7
  end
  object OMS: TEdit
    Left = 160
    Top = 164
    Width = 197
    Height = 21
    Enabled = False
    MaxLength = 16
    NumbersOnly = True
    TabOrder = 8
  end
  object GroupBox3: TGroupBox
    Left = 377
    Top = 79
    Width = 333
    Height = 103
    Caption = #1052#1077#1089#1090#1086' '#1087#1088#1086#1078#1080#1074#1072#1085#1080#1103' '#1087#1072#1094#1080#1077#1085#1090#1072
    Color = clSkyBlue
    ParentBackground = False
    ParentColor = False
    TabOrder = 9
    object Label10: TLabel
      Left = 19
      Top = 20
      Width = 43
      Height = 13
      Caption = #1059#1083#1080#1094#1072'*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 19
      Top = 47
      Width = 55
      Height = 13
      Caption = #8470' '#1076#1086#1084#1072'*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 19
      Top = 74
      Width = 62
      Height = 13
      Caption = #1050#1074#1072#1088#1090#1080#1088#1072'*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object STREET: TEdit
      Left = 103
      Top = 17
      Width = 216
      Height = 21
      Enabled = False
      MaxLength = 30
      TabOrder = 0
      OnKeyPress = FNAMEKeyPress
    end
    object Building: TEdit
      Left = 103
      Top = 44
      Width = 105
      Height = 21
      Enabled = False
      MaxLength = 5
      NumbersOnly = True
      TabOrder = 1
    end
    object APART: TEdit
      Left = 103
      Top = 71
      Width = 105
      Height = 21
      Enabled = False
      MaxLength = 5
      NumbersOnly = True
      TabOrder = 2
    end
  end
  object Date_Born: TDateTimePicker
    Left = 175
    Top = 79
    Width = 182
    Height = 21
    Date = 44665.000000000000000000
    Time = 0.493385636575112600
    Enabled = False
    TabOrder = 10
  end
  object Panel1: TPanel
    Left = -3
    Top = 297
    Width = 884
    Height = 41
    Color = clSkyBlue
    ParentBackground = False
    TabOrder = 11
    object Label13: TLabel
      Left = 6
      Top = 11
      Width = 34
      Height = 13
      Caption = #1055#1086#1080#1089#1082':'
    end
    object Search: TEdit
      Left = 45
      Top = 8
      Width = 202
      Height = 21
      MaxLength = 16
      NumbersOnly = True
      TabOrder = 0
      TextHint = #1042#1074#1077#1076#1080#1090#1077' '#1085#1086#1084#1077#1088' '#1054#1052#1057
      OnChange = SearchChange
    end
    object TableBtn: TButton
      Left = 271
      Top = 7
      Width = 75
      Height = 25
      Caption = #1058#1072#1073#1083#1080#1094#1072
      TabOrder = 1
      OnClick = TableBtnClick
    end
  end
  object RadioGroup1: TRadioGroup
    Left = 737
    Top = 82
    Width = 81
    Height = 100
    Caption = #1055#1086#1083
    Color = clSkyBlue
    Enabled = False
    ItemIndex = 0
    Items.Strings = (
      #1052#1091#1078#1089#1082#1086#1081
      #1046#1077#1085#1089#1082#1080#1081)
    ParentBackground = False
    ParentColor = False
    TabOrder = 12
  end
  object Tel: TMaskEdit
    Left = 160
    Top = 136
    Width = 105
    Height = 21
    Enabled = False
    EditMask = '!\(999\)000-0000;1;_'
    MaxLength = 13
    TabOrder = 13
    Text = '(   )   -    '
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
    Left = 856
    Top = 240
  end
  object IBTransaction: TIBTransaction
    DefaultDatabase = DB
    Left = 856
    Top = 216
  end
  object DataSource: TDataSource
    Left = 856
    Top = 128
  end
  object PACIENT: TIBQuery
    Database = DB
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 856
    Top = 160
  end
  object Query: TIBQuery
    Database = DB
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DataSource
    ParamCheck = False
    Left = 856
    Top = 192
  end
end

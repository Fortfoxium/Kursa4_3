object NewPacient: TNewPacient
  Left = 0
  Top = 0
  Caption = #1040#1048#1057' '#1056#1077#1075#1080#1089#1090#1088#1072#1090#1091#1088#1099' RegPol: '#1057#1086#1079#1076#1072#1085#1080#1077' '#1085#1086#1074#1086#1075#1086' '#1087#1072#1094#1080#1077#1085#1090#1072
  ClientHeight = 226
  ClientWidth = 881
  Color = clGradientInactiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
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
    Left = 304
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
  object ID_PACIENT: TEdit
    Left = 128
    Top = 8
    Width = 41
    Height = 23
    Enabled = False
    NumbersOnly = True
    TabOrder = 0
  end
  object FNAME: TEdit
    Left = 82
    Top = 44
    Width = 216
    Height = 23
    MaxLength = 30
    TabOrder = 1
    OnKeyPress = FNAMEKeyPress
  end
  object NAME: TEdit
    Left = 339
    Top = 44
    Width = 229
    Height = 23
    MaxLength = 30
    TabOrder = 2
    OnKeyPress = FNAMEKeyPress
  end
  object OTCHNAME: TEdit
    Left = 644
    Top = 44
    Width = 229
    Height = 23
    MaxLength = 30
    TabOrder = 3
    OnKeyPress = FNAMEKeyPress
  end
  object ID_CART: TEdit
    Left = 175
    Top = 106
    Width = 182
    Height = 23
    MaxLength = 5
    NumbersOnly = True
    TabOrder = 4
  end
  object EMAIL: TEdit
    Left = 141
    Top = 191
    Width = 216
    Height = 23
    MaxLength = 30
    TabOrder = 5
  end
  object OMS: TEdit
    Left = 160
    Top = 164
    Width = 197
    Height = 23
    MaxLength = 16
    NumbersOnly = True
    TabOrder = 6
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
    TabOrder = 7
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
      Top = 15
      Width = 216
      Height = 23
      MaxLength = 30
      TabOrder = 0
      OnKeyPress = FNAMEKeyPress
    end
    object Building: TEdit
      Left = 103
      Top = 44
      Width = 105
      Height = 23
      MaxLength = 10
      NumbersOnly = True
      TabOrder = 1
    end
    object APART: TEdit
      Left = 103
      Top = 71
      Width = 105
      Height = 23
      MaxLength = 10
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
    TabOrder = 8
  end
  object RadioGroup1: TRadioGroup
    Left = 737
    Top = 82
    Width = 81
    Height = 102
    Caption = #1055#1086#1083
    Color = clSkyBlue
    ItemIndex = 0
    Items.Strings = (
      #1052#1091#1078#1089#1082#1086#1081
      #1046#1077#1085#1089#1082#1080#1081)
    ParentBackground = False
    ParentColor = False
    TabOrder = 9
  end
  object AddBtn: TButton
    Left = 743
    Top = 190
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 10
    OnClick = AddBtnClick
  end
  object Cancel: TButton
    Left = 662
    Top = 190
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 11
    OnClick = CancelClick
  end
  object TEL: TMaskEdit
    Left = 232
    Top = 135
    Width = 123
    Height = 23
    EditMask = '!\(999\)000-0000;1;_'
    MaxLength = 13
    TabOrder = 12
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
    Left = 440
  end
  object IBTransaction: TIBTransaction
    DefaultDatabase = DB
    Left = 392
  end
  object DataSource: TDataSource
    Left = 272
  end
  object PACIENT: TIBQuery
    Database = DB
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 328
  end
  object Query: TIBQuery
    Database = DB
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = DataSource
    ParamCheck = False
    Left = 224
  end
end

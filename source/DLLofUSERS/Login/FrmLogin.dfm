object Login: TLogin
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1040#1048#1057' '#1088#1077#1075#1080#1089#1090#1088#1072#1090#1091#1088#1099' '#1087#1086#1083#1080#1082#1083#1080#1085#1085#1080#1082#1080': '#1042#1093#1086#1076
  ClientHeight = 92
  ClientWidth = 350
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Visible = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Startbtn: TButton
    Left = 136
    Top = 62
    Width = 75
    Height = 25
    Caption = #1042#1086#1081#1090#1080
    DragCursor = crHandPoint
    TabOrder = 0
    OnClick = StartbtnClick
  end
  object Editlogin: TEdit
    Left = 104
    Top = 8
    Width = 153
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 1
    TextHint = #1042#1072#1096' '#1083#1086#1075#1080#1085
  end
  object EditPassword: TEdit
    Left = 104
    Top = 35
    Width = 153
    Height = 21
    PasswordChar = '*'
    TabOrder = 2
    TextHint = #1042#1072#1096' '#1087#1072#1088#1086#1083#1100
  end
  object Button1: TButton
    Left = 8
    Top = 56
    Width = 33
    Height = 31
    Caption = 'Ad'
    TabOrder = 3
    OnClick = Button1Click
  end
  object DB: TIBDatabase
    LoginPrompt = False
    ServerType = 'IBServer'
    Left = 8
    Top = 8
  end
  object IBTransaction: TIBTransaction
    DefaultDatabase = DB
    Left = 288
  end
  object Query: TIBQuery
    Database = DB
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 288
    Top = 48
  end
end

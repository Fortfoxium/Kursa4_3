object Reg: TReg
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1040#1048#1057' RegPol '#1088#1077#1075#1080#1089#1090#1088#1072#1090#1091#1088#1099' '#1087#1086#1083#1080#1082#1083#1080#1085#1080#1082#1080': '#1056#1077#1075#1080#1089#1090#1088#1072#1094#1080#1103
  ClientHeight = 99
  ClientWidth = 462
  Color = clMoneyGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Startbtn: TButton
    Left = 152
    Top = 62
    Width = 137
    Height = 25
    Caption = #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1090#1100#1089#1103
    TabOrder = 0
    OnClick = StartbtnClick
  end
  object Editlogin: TEdit
    Left = 144
    Top = 8
    Width = 153
    Height = 21
    TabOrder = 1
    TextHint = #1042#1072#1096' '#1083#1086#1075#1080#1085
  end
  object EditPassword: TEdit
    Left = 144
    Top = 35
    Width = 153
    Height = 21
    PasswordChar = '*'
    TabOrder = 2
    TextHint = #1042#1072#1096' '#1087#1072#1088#1086#1083#1100
  end
  object DB: TIBDatabase
    LoginPrompt = False
    DefaultTransaction = Trans
    ServerType = 'IBServer'
    Left = 16
    Top = 8
  end
  object Trans: TIBTransaction
    DefaultDatabase = DB
    Left = 88
    Top = 24
  end
  object Query: TIBQuery
    Database = DB
    Transaction = Trans
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 312
    Top = 24
  end
end

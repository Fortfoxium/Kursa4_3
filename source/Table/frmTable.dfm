object FrTable: TFrTable
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = #1058#1072#1073#1083#1080#1094#1072' '
  ClientHeight = 475
  ClientWidth = 724
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
  object Scr: TScrollBox
    Left = 0
    Top = 2
    Width = 721
    Height = 473
    TabOrder = 0
  end
  object DataSource: TDataSource
    DataSet = Query
    Left = 453
    Top = 104
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
    Left = 509
    Top = 120
  end
  object IBTransaction: TIBTransaction
    DefaultDatabase = DB
    Left = 165
    Top = 8
  end
  object Query: TIBQuery
    Database = DB
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = False
    Left = 261
    Top = 104
  end
end

object FrmTABLETALON: TFrmTABLETALON
  Left = 0
  Top = 0
  AutoSize = True
  Caption = #1058#1072#1073#1083#1080#1094#1072
  ClientHeight = 527
  ClientWidth = 769
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
    Top = 0
    Width = 769
    Height = 527
    Color = clActiveBorder
    ParentColor = False
    TabOrder = 0
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
    Left = 837
    Top = 488
  end
  object DataSource: TDataSource
    DataSet = Query
    Left = 781
    Top = 472
  end
  object Query: TIBQuery
    Database = DB
    Transaction = IBTransaction
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = False
    Left = 589
    Top = 472
  end
  object IBTransaction: TIBTransaction
    DefaultDatabase = DB
    Left = 493
    Top = 376
  end
end

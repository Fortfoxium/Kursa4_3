object Main: TMain
  Left = 0
  Top = 0
  Caption = #1040#1048#1057' '#1056#1077#1075#1080#1089#1090#1088#1072#1090#1091#1088#1099' RegPol: '#1044#1086#1073#1088#1086' '#1087#1086#1078#1072#1083#1086#1074#1072#1090#1100'!'
  ClientHeight = 124
  ClientWidth = 514
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 105
    Width = 514
    Height = 19
    Panels = <>
    SimpleText = 'fdfgdfgdf'
  end
  object IBTransaction: TIBTransaction
    Left = 248
    Top = 48
  end
  object Query: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 304
    Top = 48
  end
  object DB: TIBDatabase
    LoginPrompt = False
    ServerType = 'IBServer'
    Left = 200
    Top = 48
  end
  object MainMenu1: TMainMenu
    Left = 16
    object N1: TMenuItem
      Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
      object Enter: TMenuItem
        Caption = #1042#1086#1081#1090#1080
        OnClick = EnterClick
      end
      object Register: TMenuItem
        Caption = #1047#1072#1088#1077#1075#1080#1089#1090#1088#1080#1088#1086#1074#1072#1090#1100#1089#1103
        Visible = False
        OnClick = RegisterClick
      end
      object Exit: TMenuItem
        Caption = #1042#1099#1081#1090#1080
        Visible = False
        OnClick = ExitClick
      end
    end
    object Sprav: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      Visible = False
      object RaspM: TMenuItem
        Caption = #1056#1072#1089#1087#1080#1089#1072#1085#1080#1077
        OnClick = RaspMClick
      end
      object PacientM: TMenuItem
        Caption = #1055#1072#1094#1080#1077#1085#1090
        OnClick = PacientMClick
      end
      object UslugaM: TMenuItem
        Caption = #1059#1089#1083#1091#1075#1072
        OnClick = UslugaMClick
      end
      object CabinetM: TMenuItem
        Caption = #1050#1072#1073#1080#1085#1077#1090
        OnClick = CabinetMClick
      end
      object DoctorM: TMenuItem
        Caption = #1044#1086#1082#1090#1086#1088
        OnClick = DoctorMClick
      end
    end
    object Otchet: TMenuItem
      Caption = #1046#1091#1088#1085#1072#1083' '#1086#1087#1077#1088#1072#1094#1080#1081
      Visible = False
      object N14: TMenuItem
        Caption = #1058#1072#1083#1086#1085
        OnClick = N14Click
      end
    end
    object N7: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1082#1072' '#1087#1086' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
      object AutorsM: TMenuItem
        Caption = #1040#1074#1090#1086#1088#1099
        OnClick = AutorsMClick
      end
      object AboutM: TMenuItem
        Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
        OnClick = AboutMClick
      end
    end
    object N2: TMenuItem
      Caption = #1054#1090#1095#1105#1090#1099
      Visible = False
      object N4: TMenuItem
        Caption = #1057#1087#1080#1089#1086#1082' '#1087#1072#1094#1080#1077#1085#1090#1086#1074' '#1076#1083#1103' '#1074#1088#1072#1095#1072
        OnClick = N4Click
      end
    end
  end
end

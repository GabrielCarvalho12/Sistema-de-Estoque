object frmProdutos: TfrmProdutos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Produtos'
  ClientHeight = 321
  ClientWidth = 519
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 151
    Top = 10
    Width = 358
    Height = 41
    Caption = 'Cadastro de Produtos'
    Color = clBtnHighlight
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
  end
  object SearchBox1: TSearchBox
    Left = 8
    Top = 77
    Width = 161
    Height = 21
    TabOrder = 1
    TextHint = 'Pesquisar'
  end
  object Button1: TButton
    Left = 251
    Top = 75
    Width = 75
    Height = 25
    Caption = 'Inserir'
    TabOrder = 2
  end
  object Button2: TButton
    Left = 338
    Top = 75
    Width = 75
    Height = 25
    Caption = 'Editar'
    TabOrder = 3
  end
  object Button3: TButton
    Left = 426
    Top = 74
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 4
  end
  object Clientes: TLabeledEdit
    Left = 271
    Top = 125
    Width = 230
    Height = 22
    EditLabel.Width = 50
    EditLabel.Height = 16
    EditLabel.Caption = 'Produto'
    EditLabel.Font.Charset = ANSI_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -13
    EditLabel.Font.Name = 'Arial'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    LabelPosition = lpLeft
    LabelSpacing = 10
    ParentFont = False
    ParentShowHint = False
    ReadOnly = True
    ShowHint = False
    TabOrder = 5
  end
  object LabeledEdit1: TLabeledEdit
    Left = 271
    Top = 158
    Width = 230
    Height = 22
    EditLabel.Width = 68
    EditLabel.Height = 16
    EditLabel.Caption = 'Fabricante'
    EditLabel.Font.Charset = ANSI_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -13
    EditLabel.Font.Name = 'Arial'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    LabelPosition = lpLeft
    LabelSpacing = 10
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
  end
  object LabeledEdit2: TLabeledEdit
    Left = 271
    Top = 190
    Width = 230
    Height = 22
    EditLabel.Width = 53
    EditLabel.Height = 16
    EditLabel.Caption = 'Unidade'
    EditLabel.Font.Charset = ANSI_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -13
    EditLabel.Font.Name = 'Arial'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    LabelPosition = lpLeft
    LabelSpacing = 10
    ParentFont = False
    ReadOnly = True
    TabOrder = 7
  end
  object LabeledEdit4: TLabeledEdit
    Left = 271
    Top = 222
    Width = 230
    Height = 22
    EditLabel.Width = 35
    EditLabel.Height = 16
    EditLabel.Caption = 'Custo'
    EditLabel.Font.Charset = ANSI_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -13
    EditLabel.Font.Name = 'Arial'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    LabelPosition = lpLeft
    LabelSpacing = 10
    ParentFont = False
    ReadOnly = True
    TabOrder = 8
  end
  object LabeledEdit5: TLabeledEdit
    Left = 271
    Top = 254
    Width = 230
    Height = 22
    EditLabel.Width = 37
    EditLabel.Height = 16
    EditLabel.Caption = 'Pre'#231'o'
    EditLabel.Font.Charset = ANSI_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -13
    EditLabel.Font.Name = 'Arial'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    LabelPosition = lpLeft
    LabelSpacing = 10
    ParentFont = False
    ReadOnly = True
    TabOrder = 9
  end
  object DBListBox1: TDBListBox
    Left = 8
    Top = 122
    Width = 161
    Height = 167
    ItemHeight = 13
    TabOrder = 10
  end
end

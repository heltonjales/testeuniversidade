object frmHistoricoAlunos: TfrmHistoricoAlunos
  Left = 0
  Top = 0
  Caption = 'frmHistoricoAlunos'
  ClientHeight = 500
  ClientWidth = 788
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object rlHistoricoAlunos: TRLReport
    Left = -8
    Top = 8
    Width = 794
    Height = 1123
    DataSource = frmFiltroRelatorio.dsAluno
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 83
      Width = 718
      Height = 30
      BandType = btColumnHeader
      Color = clActiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      object RLLabel2: TRLLabel
        Left = 3
        Top = 7
        Width = 49
        Height = 19
        Caption = 'Aluno'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 377
      Width = 718
      Height = 40
      BandType = btFooter
      object RLDraw2: TRLDraw
        Left = 5
        Top = 12
        Width = 710
        Height = 2
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 3
        Top = 17
        Width = 60
        Height = 16
        Info = itFullDate
        Text = ''
      end
      object RLLabel3: TRLLabel
        Left = 557
        Top = 17
        Width = 44
        Height = 16
        Caption = 'P'#225'gina'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 626
        Top = 17
        Width = 87
        Height = 16
        Info = itPageNumber
        Text = ''
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 45
      BandType = btHeader
      object RLLabel1: TRLLabel
        Left = -1
        Top = 9
        Width = 186
        Height = 22
        Caption = 'Relat'#243'rio de Alunos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDraw1: TRLDraw
        Left = 3
        Top = 33
        Width = 710
        Height = 2
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 113
      Width = 718
      Height = 264
      DataFields = 'CPF'
      object RLBand4: TRLBand
        Left = 0
        Top = 47
        Width = 718
        Height = 23
        object RLDBText3: TRLDBText
          Left = 3
          Top = 3
          Width = 80
          Height = 16
          DataField = 'DESCRICAO'
          DataSource = frmFiltroRelatorio.dsAluno
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 221
          Top = 3
          Width = 120
          Height = 16
          Alignment = taCenter
          DataField = 'NOTA_PERIODO_1'
          DataSource = frmFiltroRelatorio.dsAluno
          Text = ''
        end
        object RLDBText5: TRLDBText
          Left = 362
          Top = 3
          Width = 120
          Height = 16
          Alignment = taCenter
          DataField = 'NOTA_PERIODO_2'
          DataSource = frmFiltroRelatorio.dsAluno
          Text = ''
        end
        object RLDBText6: TRLDBText
          Left = 497
          Top = 3
          Width = 116
          Height = 16
          Alignment = taCenter
          DataField = 'NOTA_TRABALHO'
          DataSource = frmFiltroRelatorio.dsAluno
          Text = ''
        end
        object RLDBText2: TRLDBText
          Left = 632
          Top = 3
          Width = 83
          Height = 16
          Alignment = taCenter
          DataField = 'MEDIA'
          DataSource = frmFiltroRelatorio.dsAluno
          Text = ''
        end
      end
      object RLBand5: TRLBand
        Left = 0
        Top = 25
        Width = 718
        Height = 22
        BandType = btColumnHeader
        object RLLabel4: TRLLabel
          Left = 221
          Top = 4
          Width = 119
          Height = 16
          Alignment = taCenter
          Caption = 'Nota 1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel5: TRLLabel
          Left = 362
          Top = 4
          Width = 119
          Height = 16
          Alignment = taCenter
          Caption = 'Nota 2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel6: TRLLabel
          Left = 496
          Top = 4
          Width = 119
          Height = 16
          Alignment = taCenter
          Caption = 'Trabalho'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel7: TRLLabel
          Left = 632
          Top = 4
          Width = 79
          Height = 16
          Caption = 'M'#233'dia Final'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLLabel9: TRLLabel
          Left = 3
          Top = 4
          Width = 66
          Height = 16
          Caption = 'Disciplina'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object RLBand6: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 25
        BandType = btHeader
        Color = clWhite
        ParentColor = False
        Transparent = False
        object RLDBText1: TRLDBText
          Left = 3
          Top = 9
          Width = 42
          Height = 16
          DataField = 'NOME'
          DataSource = frmFiltroRelatorio.dsAluno
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Text = ''
          Transparent = False
        end
      end
    end
    object RLLabel8: TRLLabel
      Left = 376
      Top = 552
      Width = 4
      Height = 16
    end
  end
  object qrAluno: TFDQuery
    Active = True
    Connection = dm.Conexao
    SQL.Strings = (
      'SELECT  a.id '
      '       ,a.nome'
      '       ,a.cpf'
      '       ,d.descricao'
      '       ,da.nota_periodo_1'
      '       ,da.nota_periodo_2'
      '       ,da.nota_trabalho'
      '  FROM aluno a'
      '  LEFT JOIN disciplina_aluno da'
      '    ON a.id = da.codigo_aluno'
      '  LEFT JOIN disciplinas d'
      '    ON d.id = da.codigo_disciplina'
      ' ORDER BY a.nome, d.descricao')
    Left = 648
    Top = 288
    object qrAlunoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 50
    end
    object qrAlunoCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Required = True
      FixedChar = True
      Size = 11
    end
    object qrAlunoDESCRICAO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qrAlunoNOTA_PERIODO_1: TCurrencyField
      AutoGenerateValue = arDefault
      FieldName = 'NOTA_PERIODO_1'
      Origin = 'NOTA_PERIODO_1'
      ProviderFlags = []
      ReadOnly = True
      currency = False
    end
    object qrAlunoNOTA_PERIODO_2: TCurrencyField
      AutoGenerateValue = arDefault
      FieldName = 'NOTA_PERIODO_2'
      Origin = 'NOTA_PERIODO_2'
      ProviderFlags = []
      ReadOnly = True
      currency = False
    end
    object qrAlunoNOTA_TRABALHO: TCurrencyField
      AutoGenerateValue = arDefault
      FieldName = 'NOTA_TRABALHO'
      Origin = 'NOTA_TRABALHO'
      ProviderFlags = []
      ReadOnly = True
      currency = False
    end
  end
  object dsAluno: TDataSource
    DataSet = qrAluno
    Left = 696
    Top = 288
  end
end

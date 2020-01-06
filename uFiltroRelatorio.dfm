object frmFiltroRelatorio: TfrmFiltroRelatorio
  Left = 0
  Top = 0
  Caption = 'Filtro Relat'#243'rio'
  ClientHeight = 150
  ClientWidth = 292
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
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 225
    Height = 23
    Caption = 'FILTRO DE RELAT'#211'RIO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cbFiltro: TComboBox
    Left = 16
    Top = 64
    Width = 145
    Height = 21
    ItemIndex = 0
    TabOrder = 0
    Text = 'Todos'
    Items.Strings = (
      'Todos'
      'Alunos Aprovados'
      'Alunos Reprovados')
  end
  object btnFiltrar: TButton
    Left = 175
    Top = 62
    Width = 75
    Height = 25
    Caption = 'Filtrar'
    TabOrder = 1
    OnClick = btnFiltrarClick
  end
  object qrAluno: TFDQuery
    Connection = dm.Conexao
    SQL.Strings = (
      'SELECT  a.id '
      '       ,a.nome'
      '       ,a.cpf'
      '       ,d.descricao'
      '       ,da.nota_periodo_1'
      '       ,da.nota_periodo_2'
      '       ,da.nota_trabalho'
      
        '       ,(da.nota_periodo_1 + da.nota_periodo_2 + da.nota_trabalh' +
        'o ) /3 As Media'
      '  FROM aluno a'
      '  LEFT JOIN disciplina_aluno da'
      '    ON a.id = da.codigo_aluno'
      '  LEFT JOIN disciplinas d'
      '    ON d.id = da.codigo_disciplina'
      ' ORDER BY a.nome, d.descricao')
    Left = 200
    Top = 104
    object qrAlunoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
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
    object qrAlunoMEDIA: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'MEDIA'
      Origin = 'MEDIA'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 2
    end
  end
  object dsAluno: TDataSource
    DataSet = qrAluno
    Left = 240
    Top = 104
  end
end

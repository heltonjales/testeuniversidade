inherited frmLancamentoNotas: TfrmLancamentoNotas
  Caption = 'Lan'#231'amento de Notas'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited sbNovo: TSpeedButton
      OnClick = sbNovoClick
    end
    inherited sbSalvar: TSpeedButton
      OnClick = sbSalvarClick
    end
    inherited sbExcluir: TSpeedButton
      OnClick = sbExcluirClick
    end
    inherited sbEditar: TSpeedButton
      OnClick = sbEditarClick
    end
  end
  inherited Panel2: TPanel
    object Label4: TLabel
      Left = 237
      Top = 13
      Width = 57
      Height = 13
      Caption = 'Professores'
    end
    object Label1: TLabel
      Left = 12
      Top = 13
      Width = 43
      Height = 13
      Caption = 'Disciplina'
    end
    object Label2: TLabel
      Left = 12
      Top = 38
      Width = 57
      Height = 13
      Caption = 'Nome Aluno'
    end
    object Label3: TLabel
      Left = 259
      Top = 38
      Width = 32
      Height = 13
      Caption = 'Nota 1'
    end
    object Label5: TLabel
      Left = 351
      Top = 37
      Width = 32
      Height = 13
      Caption = 'Nota 2'
    end
    object Label6: TLabel
      Left = 444
      Top = 37
      Width = 68
      Height = 13
      Caption = 'Nota Trabalho'
    end
    object cbProfessores: TComboBox
      Left = 300
      Top = 10
      Width = 222
      Height = 21
      TabOrder = 1
      OnClick = cbProfessoresClick
    end
    object cbDisciplina: TComboBox
      Left = 61
      Top = 10
      Width = 160
      Height = 21
      TabOrder = 0
      OnClick = cbDisciplinaClick
    end
    object edtAluno: TEdit
      Left = 12
      Top = 56
      Width = 233
      Height = 21
      TabOrder = 2
    end
    object edtN1: TEdit
      Left = 259
      Top = 56
      Width = 78
      Height = 21
      TabOrder = 3
      OnKeyPress = edtN1KeyPress
    end
    object edtN2: TEdit
      Left = 351
      Top = 55
      Width = 78
      Height = 21
      TabOrder = 4
      OnKeyPress = edtN2KeyPress
    end
    object edtNotaTrabalho: TEdit
      Left = 444
      Top = 56
      Width = 78
      Height = 21
      TabOrder = 5
      OnKeyPress = edtNotaTrabalhoKeyPress
    end
  end
  inherited db: TDBGrid
    DataSource = dsDados
    OnCellClick = dbCellClick
  end
  object qrDiscip_Prof: TFDQuery
    Connection = dm.Conexao
    SQL.Strings = (
      'select * from disciplina_professor')
    Left = 544
    Top = 56
  end
  object qrDisciplina: TFDQuery
    Connection = dm.Conexao
    SQL.Strings = (
      'select * from disciplinas')
    Left = 544
    Top = 104
  end
  object qrDados: TFDQuery
    Active = True
    Connection = dm.Conexao
    SQL.Strings = (
      'SELECT da.id                       '
      '       ,a.nome                     '
      '       ,da.nota_periodo_1          '
      '       ,da.nota_periodo_2          '
      '       ,da.nota_trabalho           '
      '  FROM disciplina_aluno da         '
      ' INNER JOIN disciplinas d          '
      '    ON d.id = da.codigo_disciplina '
      ' INNER JOIN professor p            '
      '    ON p.id = da.codigo_professor  '
      ' INNER JOIN aluno a                '
      '    ON a.id = da.codigo_aluno      '
      ''
      '')
    Left = 544
    Top = 209
    object qrDadosID: TIntegerField
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 8
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object qrDadosNOME: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Aluno'
      DisplayWidth = 40
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qrDadosNOTA_PERIODO_1: TCurrencyField
      DisplayLabel = 'Avalia'#231#227'o N1'
      DisplayWidth = 12
      FieldName = 'NOTA_PERIODO_1'
      Origin = 'NOTA_PERIODO_1'
      currency = False
    end
    object qrDadosNOTA_PERIODO_2: TCurrencyField
      DisplayLabel = 'Avalia'#231#227'o N2'
      DisplayWidth = 12
      FieldName = 'NOTA_PERIODO_2'
      Origin = 'NOTA_PERIODO_2'
      currency = False
    end
    object qrDadosNOTA_TRABALHO: TCurrencyField
      DisplayLabel = 'Trabalho'
      FieldName = 'NOTA_TRABALHO'
      Origin = 'NOTA_TRABALHO'
      currency = False
    end
  end
  object dsDados: TDataSource
    DataSet = qrDados
    Left = 544
    Top = 153
  end
end

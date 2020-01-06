inherited frmCadastroProf_Disciplina: TfrmCadastroProf_Disciplina
  Caption = 'Cadastro de Disciplinas X Professores'
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
    object Label1: TLabel
      Left = 401
      Top = 23
      Width = 43
      Height = 13
      Caption = 'Disciplina'
    end
    object Label2: TLabel
      Left = 152
      Top = 23
      Width = 76
      Height = 13
      Caption = 'Nome Professor'
    end
    object Label3: TLabel
      Left = 13
      Top = 23
      Width = 68
      Height = 13
      Caption = 'CPF Professor'
    end
    object cbDisciplina: TComboBox
      Left = 401
      Top = 41
      Width = 160
      Height = 21
      TabOrder = 2
      OnClick = cbDisciplinaClick
    end
    object edtProfessor: TEdit
      Left = 152
      Top = 41
      Width = 233
      Height = 21
      TabOrder = 1
    end
    object edtCpf: TMaskEdit
      Left = 13
      Top = 41
      Width = 120
      Height = 21
      EditMask = '999.999.999-99;0; '
      MaxLength = 14
      TabOrder = 0
      Text = ''
      OnExit = edtCpfExit
    end
  end
  inherited db: TDBGrid
    DataSource = dsDados
    OnCellClick = dbCellClick
  end
  object qrDados: TFDQuery
    Active = True
    Connection = dm.Conexao
    SQL.Strings = (
      'SELECT d.descricao '
      '  FROM disciplina_professor dp'
      ' INNER JOIN disciplinas d'
      '    ON d.id = dp.codigo_disciplina')
    Left = 496
    Top = 8
  end
  object dsDados: TDataSource
    DataSet = qrDados
    Left = 536
    Top = 8
  end
  object qrProfessor: TFDQuery
    Active = True
    Connection = dm.Conexao
    SQL.Strings = (
      'select * from professor')
    Left = 544
    Top = 64
  end
  object qrDisciplina: TFDQuery
    Active = True
    Connection = dm.Conexao
    SQL.Strings = (
      'select * from disciplinas')
    Left = 544
    Top = 112
  end
end

inherited frmCadastroAlunoDisciplina: TfrmCadastroAlunoDisciplina
  Caption = 'Matricula'
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
    object Label3: TLabel
      Left = 12
      Top = 6
      Width = 49
      Height = 13
      Caption = 'CPF Aluno'
    end
    object Label2: TLabel
      Left = 151
      Top = 6
      Width = 57
      Height = 13
      Caption = 'Nome Aluno'
    end
    object Label1: TLabel
      Left = 401
      Top = 6
      Width = 43
      Height = 13
      Caption = 'Disciplina'
    end
    object Label4: TLabel
      Left = 12
      Top = 58
      Width = 57
      Height = 13
      Caption = 'Professores'
    end
    object edtCpf: TMaskEdit
      Left = 12
      Top = 24
      Width = 120
      Height = 21
      EditMask = '999.999.999-99;0; '
      MaxLength = 14
      TabOrder = 0
      Text = ''
      OnExit = edtCpfExit
    end
    object edtAluno: TEdit
      Left = 151
      Top = 24
      Width = 233
      Height = 21
      TabOrder = 1
    end
    object cbDisciplina: TComboBox
      Left = 401
      Top = 24
      Width = 160
      Height = 21
      TabOrder = 2
      OnClick = cbDisciplinaClick
    end
    object cbProfessores: TComboBox
      Left = 75
      Top = 55
      Width = 309
      Height = 21
      TabOrder = 3
      OnClick = cbProfessoresClick
    end
  end
  inherited db: TDBGrid
    DataSource = dsDados
    OnCellClick = dbCellClick
  end
  object qrDados: TFDQuery
    Connection = dm.Conexao
    SQL.Strings = (
      'select * from disciplina_aluno'
      '')
    Left = 536
    Top = 241
  end
  object dsDados: TDataSource
    DataSet = qrDados
    Left = 536
    Top = 185
  end
  object qrAluno: TFDQuery
    Connection = dm.Conexao
    SQL.Strings = (
      'select * from aluno')
    Left = 536
    Top = 136
  end
  object qrDisciplina: TFDQuery
    Connection = dm.Conexao
    SQL.Strings = (
      'select * from disciplinas')
    Left = 480
    Top = 184
  end
  object qrDiscip_Prof: TFDQuery
    Connection = dm.Conexao
    SQL.Strings = (
      'select * from disciplina_professor')
    Left = 488
    Top = 248
  end
end

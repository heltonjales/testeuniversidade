﻿inherited frmCadastroDisciplina: TfrmCadastroDisciplina
  Caption = 'Cadastro de Disciplinas'
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
    object Código: TLabel
      Left = 16
      Top = 17
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object Descrição: TLabel
      Left = 82
      Top = 17
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object edtId: TEdit
      Left = 16
      Top = 36
      Width = 49
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object edtDescricao: TEdit
      Left = 81
      Top = 36
      Width = 200
      Height = 21
      TabOrder = 1
    end
  end
  inherited db: TDBGrid
    DataSource = dsDisciplina
    OnCellClick = dbCellClick
  end
  object qrDisciplina: TFDQuery
    Active = True
    Connection = dm.Conexao
    SQL.Strings = (
      'select * from disciplinas')
    Left = 456
    Top = 65
    object qrDisciplinaID: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 8
      FieldName = 'ID'
      Origin = 'ID'
      Required = True
    end
    object qrDisciplinaDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 40
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 50
    end
  end
  object dsDisciplina: TDataSource
    DataSet = qrDisciplina
    Left = 520
    Top = 65
  end
end

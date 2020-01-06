unit uDisciplina;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmCadastroDisciplina = class(TfrmCadastroBase)
    C�digo: TLabel;
    edtId: TEdit;
    Descri��o: TLabel;
    edtDescricao: TEdit;
    qrDisciplina: TFDQuery;
    dsDisciplina: TDataSource;
    qrDisciplinaID: TIntegerField;
    qrDisciplinaDESCRICAO: TStringField;
    procedure sbSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbExcluirClick(Sender: TObject);
    procedure dbCellClick(Column: TColumn);
    procedure sbEditarClick(Sender: TObject);
    procedure sbNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LimparCampos;
    procedure ExibirRegistros;
  end;

var
  frmCadastroDisciplina: TfrmCadastroDisciplina;

implementation

{$R *.dfm}

uses uModulo, uSystemUtils;

procedure TfrmCadastroDisciplina.dbCellClick(Column: TColumn);
begin
  inherited;
  if qrDisciplina.FieldByName('id').AsString <> null then
  begin
    edtId.Text := qrDisciplina.FieldByName('id').AsString;
    edtDescricao.Text := qrDisciplina.FieldByName('descricao').AsString;

    edtId.Enabled := False;
  end;
end;

procedure TfrmCadastroDisciplina.ExibirRegistros;
begin
  qrDisciplina.Close;
  qrDisciplina.SQL.Clear;
  qrDisciplina.SQL.Add('SELECT * FROM disciplinas');
  qrDisciplina.SQL.Add(' ORDER BY id ASC   ');
  qrDisciplina.Open();
end;

procedure TfrmCadastroDisciplina.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmCadastroDisciplina := nil;
end;

procedure TfrmCadastroDisciplina.LimparCampos;
begin
  edtId.Text := '';
  edtDescricao.Text := '';
end;

procedure TfrmCadastroDisciplina.sbEditarClick(Sender: TObject);
begin
  inherited;
  if Trim(edtId.Text) = '' then
  begin
    ShowMessage('Selecione um registro para atualiza��o.');
    db.SetFocus;
    Exit;
  end;

  qrDisciplina.Close;
  qrDisciplina.SQL.Clear;
  qrDisciplina.SQL.Add('UPDATE disciplinas');
  qrDisciplina.SQL.Add('SET descricao = :descricao');
  qrDisciplina.SQL.Add('WHERE id = :id');
  qrDisciplina.ParamByName('id').AsString := edtId.Text;
  qrDisciplina.ParamByName('descricao').AsString := edtDescricao.Text;
  qrDisciplina.ExecSQL;

  ShowMessage('Cadastro atualizado com sucesso.');
  LimparCampos;
  ExibirRegistros;
end;

procedure TfrmCadastroDisciplina.sbExcluirClick(Sender: TObject);
begin
  inherited;
  if not db.Columns.Grid.Focused then
  begin
    ShowMessage('Selecione um registro para exclus�o.');
    db.SetFocus;
    Exit;
  end;

  if MsgConfirm('Deseja excluir registro?') then
  begin
    qrDisciplina.Close;
    qrDisciplina.SQL.Clear;
    qrDisciplina.SQL.Add('DELETE FROM disciplinas WHERE id = :id');
    qrDisciplina.ParamByName('id').AsString := edtId.Text;
    qrDisciplina.ExecSQL;

    LimparCampos;
    ExibirRegistros;
    ShowMessage('Registro excluido com sucesso.');
    edtDescricao.SetFocus;
  end;
end;

procedure TfrmCadastroDisciplina.sbNovoClick(Sender: TObject);
begin
  inherited;
  LimparCampos;
  edtDescricao.Text := '';
end;

procedure TfrmCadastroDisciplina.sbSalvarClick(Sender: TObject);
begin
  inherited;
  if Trim(edtDescricao.Text) = '' then
  begin
    ShowMessage('Campo nome descric�o.');
    edtDescricao.SetFocus;
    Exit;
  end;

  qrDisciplina.Close;
  qrDisciplina.SQL.Clear;
  qrDisciplina.SQL.Add('SELECT * FROM disciplinas WHERE descricao = :descricao');
  qrDisciplina.ParamByName('descricao').AsString := edtDescricao.Text;
  qrDisciplina.Open;

  if qrDisciplina.IsEmpty then
  begin
    qrDisciplina.Close;
    qrDisciplina.SQL.Clear;
    qrDisciplina.SQL.Add('INSERT INTO disciplinas (descricao)');
    qrDisciplina.SQL.Add('VALUES (:descricao)');
    qrDisciplina.ParamByName('descricao').AsString := edtDescricao.Text;
    qrDisciplina.ExecSQL;

    ShowMessage('Cadastro realizado com sucesso.');
    LimparCampos;
    ExibirRegistros;
    Exit;
  end
  else
  begin
    ShowMessage('Disciplina possui cadastro.');
    Exit;
  end;
end;

end.

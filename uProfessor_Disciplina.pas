unit uProfessor_Disciplina;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, Data.DB, Vcl.Mask, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmCadastroProf_Disciplina = class(TfrmCadastroBase)
    cbDisciplina: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtProfessor: TEdit;
    edtCpf: TMaskEdit;
    qrDados: TFDQuery;
    dsDados: TDataSource;
    qrProfessor: TFDQuery;
    qrDisciplina: TFDQuery;
    procedure edtCpfExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure cbDisciplinaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbCellClick(Column: TColumn);
    procedure sbExcluirClick(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
    procedure sbNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LimparCampos;
    procedure ExibirRegistros;
    procedure CarregarDisciplinas;
  end;

var
  frmCadastroProf_Disciplina: TfrmCadastroProf_Disciplina;
  id_disciplina : integer;
  codigo_disciplina : integer;
  codigo_professor : integer;

implementation

{$R *.dfm}

uses uModulo, uSystemUtils;

procedure TfrmCadastroProf_Disciplina.CarregarDisciplinas;
begin
  ExibirRegistros;
  cbDisciplina.Items.Clear;
  qrDisciplina.Close;
  qrDisciplina.SQL.Clear;
  qrDisciplina.SQL.Add('SELECT * FROM disciplinas');
  qrDisciplina.Open();

  while not qrDisciplina.Eof do
  begin
    cbDisciplina.Items.AddObject(qrDisciplina.FieldByName('descricao').AsString, TObject(qrDisciplina.FieldByName('id').AsInteger));
    qrDisciplina.Next;
  end;
  qrDisciplina.Open();
end;

procedure TfrmCadastroProf_Disciplina.cbDisciplinaClick(Sender: TObject);
begin
  inherited;

  qrDisciplina.Close;
  qrDisciplina.SQL.Clear;
  qrDisciplina.SQL.Add('SELECT * FROM disciplinas');
  qrDisciplina.SQL.Add(' WHERE id = :id');
  qrDisciplina.ParamByName('id').AsInteger := Integer(cbDisciplina.Items.Objects[cbDisciplina.ItemIndex]);
  qrDisciplina.Open();

  codigo_disciplina := qrDisciplina.FieldByName('id').AsInteger;
end;

procedure TfrmCadastroProf_Disciplina.dbCellClick(Column: TColumn);
begin
  inherited;
  if qrDados.FieldByName('id').AsString <> null then
  begin
    id_disciplina := qrDados.FieldByName('id').AsInteger;
    cbDisciplina.Text := qrDados.FieldByName('descricao').AsString;
  end;
end;

procedure TfrmCadastroProf_Disciplina.edtCpfExit(Sender: TObject);
begin
  inherited;
  qrProfessor.Close;
  qrProfessor.SQL.Clear;
  qrProfessor.SQL.Add('SELECT * FROM professor');
  qrProfessor.SQL.Add(' WHERE cpf = :cpf');
  qrProfessor.ParamByName('cpf').AsString := edtCpf.Text;
  qrProfessor.Open();

  if qrProfessor.IsEmpty then
  begin
    ShowMessage('CPF n�o encontrado.');
    LimparCampos;
    edtCpf.SetFocus;
    Exit;
  end
  else
  begin
    codigo_professor := qrProfessor.FieldByName('id').AsInteger;
    edtCpf.Text :=qrProfessor.FieldByName('cpf').AsString;
    edtProfessor.Text := qrProfessor.FieldByName('nome').AsString;
    ExibirRegistros;
  end;
end;

procedure TfrmCadastroProf_Disciplina.ExibirRegistros;
begin
  qrDados.Close;
  qrDados.SQL.Clear;
  qrDados.SQL.Add('SELECT dp.id                       ');
  qrDados.SQL.Add('       ,d.descricao                ');
  qrDados.SQL.Add('  FROM disciplina_professor dp     ');
  qrDados.SQL.Add(' INNER JOIN disciplinas d          ');
  qrDados.SQL.Add('    ON d.id = dp.codigo_disciplina ');
  qrDados.SQL.Add(' INNER JOIN professor p            ');
  qrDados.SQL.Add('    ON p.id = dp.codigo_professor  ');
  qrDados.SQL.Add(' WHERE  p.cpf = :cpf               ');
  qrDados.SQL.Add(' ORDER BY id ASC                   ');

  qrDados.ParamByName('cpf').AsString := edtCpf.Text;
  qrDados.Open();
end;

procedure TfrmCadastroProf_Disciplina.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmCadastroProf_Disciplina := nil;
end;

procedure TfrmCadastroProf_Disciplina.FormShow(Sender: TObject);
begin
  inherited;
  CarregarDisciplinas;
end;

procedure TfrmCadastroProf_Disciplina.LimparCampos;
begin
  edtCpf.Text := '';
  edtProfessor.Text := '';
  cbDisciplina.Text := '';
end;

procedure TfrmCadastroProf_Disciplina.sbEditarClick(Sender: TObject);
begin
  inherited;
  if Trim(edtProfessor.Text) = '' then
  begin
    ShowMessage('Selecione um registro para atualiza��o.');
    db.SetFocus;
    Exit;
  end;

  if id_disciplina = 0 then
  begin
    ShowMessage('Selecione um registro para atualiza��o.');
    db.SetFocus;
    Exit;
  end;

  qrDados.Close;
  qrDados.SQL.Clear;
  qrDados.SQL.Add('SELECT * FROM disciplina_professor');
  qrDados.SQL.Add(' WHERE codigo_disciplina = :codigo_disciplina');
  qrDados.ParamByName('codigo_disciplina').AsInteger := codigo_disciplina;
  qrDados.Open;

  if qrDados.IsEmpty then
  begin
    qrDados.Close;
    qrDados.SQL.Clear;
    qrDados.SQL.Add('UPDATE disciplina_professor');
    qrDados.SQL.Add('SET codigo_disciplina = :codigo_disciplina');
    qrDados.SQL.Add('WHERE id = :id');
    qrDados.ParamByName('id').AsInteger := id_disciplina;
    qrDados.ParamByName('codigo_disciplina').AsInteger := codigo_disciplina;

    qrDados.ExecSQL;
    ShowMessage('Cadastro atualizado com sucesso.');
    cbDisciplina.Text := '';
    ExibirRegistros;
  end
  else
  begin
    ExibirRegistros;
    ShowMessage('Disciplina j� possui cadastro.');
    Exit;
  end;
end;

procedure TfrmCadastroProf_Disciplina.sbExcluirClick(Sender: TObject);
begin
  inherited;

  if not db.Columns.Grid.Focused then
  begin
    ShowMessage('Selecione um registro para exclus�o.');
    db.SetFocus;
    Exit;
  end;

  if Trim(edtProfessor.Text) = '' then
  begin
    ShowMessage('Selecione um registro para atualiza��o.');
    db.SetFocus;
    Exit;
  end;

  if MsgConfirm('Deseja excluir disciplina?') then
  begin
    qrDados.Close;
    qrDados.SQL.Clear;
    qrDados.SQL.Add('DELETE FROM disciplina_professor WHERE id = :id');
    qrDados.ParamByName('id').AsInteger := codigo_disciplina;
    qrDados.ExecSQL;

    cbDisciplina.Text := '';
    ExibirRegistros;
    ShowMessage('Registro excluido com sucesso.');
    db.SetFocus;
  end;

end;

procedure TfrmCadastroProf_Disciplina.sbNovoClick(Sender: TObject);
begin
  inherited;
  LimparCampos;
  qrDados.Close;
end;

procedure TfrmCadastroProf_Disciplina.sbSalvarClick(Sender: TObject);
begin
  inherited;

  if Trim(edtCpf.Text) = '' then
  begin
    ShowMessage('Campo CPF obrigat�rio.');
    edtCpf.SetFocus;
    Exit;
  end;

  if Trim(edtProfessor.Text) = '' then
  begin
    ShowMessage('Campo nome obrigat�rio.');
    edtProfessor.SetFocus;
    Exit;
  end;

  if Trim(cbDisciplina.Text) = '' then
  begin
    ShowMessage('Campo disciplina obrigat�rio.');
    cbDisciplina.SetFocus;
    Exit;
  end;

  qrDados.Close;
  qrDados.SQL.Clear;
  qrDados.SQL.Add('SELECT * FROM disciplina_professor');
  qrDados.SQL.Add(' WHERE codigo_disciplina = :codigo_disciplina');
  qrDados.SQL.Add('   AND codigo_professor = :codigo_professor');
  qrDados.ParamByName('codigo_disciplina').AsInteger := codigo_disciplina;
  qrDados.ParamByName('codigo_professor').AsInteger := codigo_professor;
  qrDados.Open;

  if qrDados.IsEmpty then
  begin
    qrDados.Close;
    qrDados.SQL.Clear;
    qrDados.SQL.Add('INSERT INTO disciplina_professor (codigo_disciplina, codigo_professor)');
    qrDados.SQL.Add('VALUES (:codigo_disciplina, :codigo_professor)');
    qrDados.ParamByName('codigo_disciplina').AsInteger := codigo_disciplina;
    qrDados.ParamByName('codigo_professor').AsInteger := codigo_professor;
    qrDados.ExecSQL;

    ExibirRegistros;
    ShowMessage('Cadastro realizado com sucesso.');
    cbDisciplina.ItemIndex := -1;
    Exit;
  end
   else
  begin
    ExibirRegistros;
    ShowMessage('Disciplina possui cadastro.');
    Exit;
  end;

end;

end.

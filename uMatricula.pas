unit uMatricula;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmCadastroAlunoDisciplina = class(TfrmCadastroBase)
    Label3: TLabel;
    edtCpf: TMaskEdit;
    Label2: TLabel;
    edtAluno: TEdit;
    qrDados: TFDQuery;
    dsDados: TDataSource;
    qrAluno: TFDQuery;
    cbDisciplina: TComboBox;
    Label1: TLabel;
    cbProfessores: TComboBox;
    Label4: TLabel;
    qrDisciplina: TFDQuery;
    qrDiscip_Prof: TFDQuery;
    procedure edtCpfExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbDisciplinaClick(Sender: TObject);
    procedure sbNovoClick(Sender: TObject);
    procedure sbSalvarClick(Sender: TObject);
    procedure cbProfessoresClick(Sender: TObject);
    procedure sbExcluirClick(Sender: TObject);
    procedure dbCellClick(Column: TColumn);
    procedure sbEditarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LimparCampos;
    procedure CarregarDisciplinas;
    procedure CarregarProfessores;
    procedure ExibirRegistros;
  end;

var
  frmCadastroAlunoDisciplina: TfrmCadastroAlunoDisciplina;
  id_matricula : integer;
  codigo_aluno : integer;
  codigo_disciplina : integer;
  codigo_professor : integer;

implementation

{$R *.dfm}

uses uModulo, uCadastroAluno, uSystemUtils;

procedure TfrmCadastroAlunoDisciplina.CarregarDisciplinas;
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

procedure TfrmCadastroAlunoDisciplina.CarregarProfessores;
begin
  qrDiscip_Prof.Close;
  qrDiscip_Prof.SQL.Clear;
  qrDiscip_Prof.SQL.Add('SELECT * FROM professor');
  qrDiscip_Prof.SQL.Add(' WHERE id = :id');
  qrDiscip_Prof.ParamByName('id').AsInteger := Integer(cbProfessores.Items.Objects[cbProfessores.ItemIndex]);
  qrDiscip_Prof.Open();

  codigo_professor := qrDiscip_Prof.FieldByName('id').AsInteger;

end;

procedure TfrmCadastroAlunoDisciplina.cbDisciplinaClick(Sender: TObject);
begin
  inherited;

  qrDisciplina.Close;
  qrDisciplina.SQL.Clear;
  qrDisciplina.SQL.Add('SELECT * FROM disciplinas');
  qrDisciplina.SQL.Add(' WHERE id = :id');
  qrDisciplina.ParamByName('id').AsInteger := Integer(cbDisciplina.Items.Objects[cbDisciplina.ItemIndex]);
  qrDisciplina.Open();

  codigo_disciplina := qrDisciplina.FieldByName('id').AsInteger;

  cbProfessores.Items.Clear;
  qrDiscip_Prof.Close;
  qrDiscip_Prof.SQL.Clear;
  qrDiscip_Prof.SQL.Add('SELECT p.id, p.nome                 ');
  qrDiscip_Prof.SQL.Add('  FROM professor p                  ');
  qrDiscip_Prof.SQL.Add(' INNER JOIN disciplina_professor dp ');
  qrDiscip_Prof.SQL.Add('    ON p.id = dp.codigo_professor   ');
  qrDiscip_Prof.SQL.Add(' WHERE dp.codigo_disciplina = :codigo_disciplina');
  qrDiscip_Prof.ParamByName('codigo_disciplina').AsInteger := codigo_disciplina;
  qrDiscip_Prof.Open();

  qrDiscip_Prof.First;

  while not qrDiscip_Prof.Eof do
  begin
    cbProfessores.Items.AddObject(qrDiscip_Prof.FieldByName('nome').AsString, TObject(qrDiscip_Prof.FieldByName('id').AsInteger));
    cbProfessores.ItemIndex := 0;
    qrDiscip_Prof.Next;
  end;

  qrDiscip_Prof.Open();

  if qrDiscip_Prof.FieldByName('nome').AsString <> '' then
    CarregarProfessores
  else
  begin
    ShowMessage('Disciplina n�o possui professor cadastrado.');
    exit
  end;

end;

procedure TfrmCadastroAlunoDisciplina.cbProfessoresClick(Sender: TObject);
begin
  inherited;
  CarregarProfessores;
end;

procedure TfrmCadastroAlunoDisciplina.dbCellClick(Column: TColumn);
begin
  inherited;
  if qrDados.FieldByName('id').AsString <> null then
  begin
    id_matricula := qrDados.FieldByName('id').AsInteger;
    cbDisciplina.Text := qrDados.FieldByName('descricao').AsString;
    cbProfessores.Text := qrDados.FieldByName('nome').AsString;
  end;
end;

procedure TfrmCadastroAlunoDisciplina.edtCpfExit(Sender: TObject);
begin
  inherited;
  qrAluno.Close;
  qrAluno.SQL.Clear;
  qrAluno.SQL.Add('SELECT * FROM aluno');
  qrAluno.SQL.Add(' WHERE cpf = :cpf');
  qrAluno.ParamByName('cpf').AsString := edtCpf.Text;
  qrAluno.Open();

  if qrAluno.IsEmpty then
  begin
    ShowMessage('CPF n�o encontrado.');
    LimparCampos;
    edtCpf.SetFocus;
    Exit;
  end
  else
  begin
    ExibirRegistros;
    codigo_aluno := qrAluno.FieldByName('id').AsInteger;
    edtCpf.Text := qrAluno.FieldByName('cpf').AsString;
    edtAluno.Text := qrAluno.FieldByName('nome').AsString;
    edtAluno.Enabled := True;
    cbDisciplina.Enabled := True;
    cbProfessores.Enabled := True;
  end;
end;

procedure TfrmCadastroAlunoDisciplina.ExibirRegistros;
begin
  qrDados.Close;
  qrDados.SQL.Clear;
  qrDados.SQL.Add('SELECT da.id                       ');
  qrDados.SQL.Add('       ,d.descricao                ');
  qrDados.SQL.Add('       ,p.nome                     ');
  qrDados.SQL.Add('  FROM disciplina_aluno da         ');
  qrDados.SQL.Add(' INNER JOIN disciplinas d          ');
  qrDados.SQL.Add('    ON d.id = da.codigo_disciplina ');
  qrDados.SQL.Add(' INNER JOIN professor p            ');
  qrDados.SQL.Add('    ON p.id = da.codigo_professor  ');
  qrDados.SQL.Add(' INNER JOIN aluno a                ');
  qrDados.SQL.Add('    ON a.id = da.codigo_aluno      ');
  qrDados.SQL.Add(' WHERE  a.cpf = :cpf               ');
  qrDados.SQL.Add(' ORDER BY id ASC                   ');

  qrDados.ParamByName('cpf').AsString := edtCpf.Text;
  qrDados.Open();
end;

procedure TfrmCadastroAlunoDisciplina.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmCadastroAlunoDisciplina := nil;
end;

procedure TfrmCadastroAlunoDisciplina.FormShow(Sender: TObject);
begin
  inherited;
  CarregarDisciplinas;
  ExibirRegistros;
  edtAluno.Enabled := False;
  cbDisciplina.Enabled := False;
  cbProfessores.Enabled := False;
end;

procedure TfrmCadastroAlunoDisciplina.LimparCampos;
begin
  edtCpf.Text := '';
  edtAluno.Text := '';
end;

procedure TfrmCadastroAlunoDisciplina.sbEditarClick(Sender: TObject);
begin
  inherited;
  if cbDisciplina.ItemIndex = -1 then
  begin
    ShowMessage('Selecione um registro para atualiza��o.');
    Exit;
  end;

  if id_matricula = 0 then
  begin
    ShowMessage('Selecione um registro para atualiza��o.');
    Exit;
  end;

  qrDados.Close;
  qrDados.SQL.Clear;
  qrDados.SQL.Add('SELECT * FROM disciplina_aluno');
  qrDados.SQL.Add(' WHERE codigo_disciplina = :codigo_disciplina');
  qrDados.SQL.Add('   AND codigo_professor = :codigo_professor');
  qrDados.ParamByName('codigo_disciplina').AsInteger := codigo_disciplina;
  qrDados.ParamByName('codigo_professor').AsInteger := codigo_professor;
  qrDados.Open;

  if qrDados.IsEmpty then
  begin

    qrDados.Close;
    qrDados.SQL.Clear;
    qrDados.SQL.Add('UPDATE disciplina_aluno');
    qrDados.SQL.Add('SET codigo_disciplina = :codigo_disciplina, codigo_professor = :codigo_professor');
    qrDados.SQL.Add('WHERE id = :id');
    qrDados.ParamByName('id').AsInteger := id_matricula;
    qrDados.ParamByName('codigo_disciplina').AsInteger := codigo_disciplina;
    qrDados.ParamByName('codigo_professor').AsInteger := codigo_professor;

    qrDados.ExecSQL;
    ShowMessage('Cadastro atualizado com sucesso.');
    cbDisciplina.Text := '';
    cbProfessores.Text := '';
    ExibirRegistros;
  end
  else
  begin
    ExibirRegistros;
    ShowMessage('Disciplina j� possui cadastro.');
    Exit;
  end;
end;

procedure TfrmCadastroAlunoDisciplina.sbExcluirClick(Sender: TObject);
begin
  inherited;
  if not db.Columns.Grid.Focused then
  begin
    ShowMessage('Selecione um registro para exclus�o.');
    Exit;
  end;

  if Trim(cbDisciplina.Text) = '' then
  begin
    ShowMessage('Selecione um registro para atualiza��o.');
    Exit;
  end;

  if MsgConfirm('Deseja excluir disciplina?') then
  begin
    qrDados.Close;
    qrDados.SQL.Clear;
    qrDados.SQL.Add('DELETE FROM disciplina_aluno WHERE id = :id');
    qrDados.ParamByName('id').AsInteger := id_matricula;
    qrDados.ExecSQL;

    ExibirRegistros;
    ShowMessage('Registro excluido com sucesso.');
    cbProfessores.ItemIndex := -1;
    db.SetFocus;
  end;
end;

procedure TfrmCadastroAlunoDisciplina.sbNovoClick(Sender: TObject);
begin
  inherited;
  edtCpf.Text := '';
  edtAluno.Text := '';
  cbDisciplina.Items.Clear;
  cbProfessores.Items.Clear;
end;

procedure TfrmCadastroAlunoDisciplina.sbSalvarClick(Sender: TObject);
begin
  inherited;
  if Trim(edtCpf.Text) = '' then
  begin
    ShowMessage('Campo CPF obrigat�rio.');
    edtCpf.SetFocus;
    Exit;
  end;

  if Trim(edtAluno.Text) = '' then
  begin
    ShowMessage('Campo nome obrigat�rio.');
    edtAluno.SetFocus;
    Exit;
  end;

  if cbDisciplina.ItemIndex = - 1 then
  begin
    ShowMessage('Campo disciplina obrigat�rio.');
    cbDisciplina.SetFocus;
    Exit;
  end;

  if cbProfessores.ItemIndex = - 1 then
  begin
    ShowMessage('Campo professor obrigat�rio.');
    cbDisciplina.SetFocus;
    Exit;
  end;

  qrDados.Close;
  qrDados.SQL.Clear;
  qrDados.SQL.Add('SELECT * FROM disciplina_aluno');
  qrDados.SQL.Add(' WHERE codigo_disciplina = :codigo_disciplina');
  qrDados.SQL.Add('   AND codigo_aluno = :codigo_aluno');
  qrDados.ParamByName('codigo_disciplina').AsInteger := codigo_disciplina;
  qrDados.ParamByName('codigo_aluno').AsInteger := codigo_aluno;
  qrDados.Open;

  if qrDados.IsEmpty then
  begin
    qrDados.Close;
    qrDados.SQL.Clear;
    qrDados.SQL.Add('INSERT INTO disciplina_aluno (codigo_aluno ,codigo_disciplina, codigo_professor)');
    qrDados.SQL.Add('VALUES (:codigo_aluno, :codigo_disciplina, :codigo_professor)');
    qrDados.ParamByName('codigo_aluno').AsInteger := codigo_aluno;
    qrDados.ParamByName('codigo_disciplina').AsInteger := codigo_disciplina;
    qrDados.ParamByName('codigo_professor').AsInteger := codigo_professor;
    qrDados.ExecSQL;

    ExibirRegistros;
    ShowMessage('Cadastro realizado com sucesso.');
    cbDisciplina.ItemIndex := -1;
    cbProfessores.ItemIndex := -1;
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

unit uCadastroProfessores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Mask, Vcl.StdCtrls;

type
  TfrmCadastroProfessores = class(TfrmCadastroBase)
    C�digo: TLabel;
    edtId: TEdit;
    Nome: TLabel;
    edtNome: TEdit;
    CPF: TLabel;
    edtCpf: TMaskEdit;
    qrProfessor: TFDQuery;
    dsProfessor: TDataSource;
    qrProfessorID: TIntegerField;
    qrProfessorNOME: TStringField;
    qrProfessorCPF: TStringField;
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure edtCpfKeyPress(Sender: TObject; var Key: Char);
    procedure dbCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LimparCampos;
    procedure ExibirRegistros;
  end;

var
  frmCadastroProfessores: TfrmCadastroProfessores;

implementation

{$R *.dfm}

uses uModulo, uSystemUtils;

procedure TfrmCadastroProfessores.dbCellClick(Column: TColumn);
begin
  inherited;
   if qrProfessor.FieldByName('cpf').AsString <> null then
  begin
    edtId.Text := qrProfessor.FieldByName('id').AsString;
    edtNome.Text := qrProfessor.FieldByName('nome').AsString;
    edtCpf.Text := qrProfessor.FieldByName('cpf').AsString;

    edtId.Enabled := False;
    edtCpf.Enabled := False;
  end;
end;

procedure TfrmCadastroProfessores.edtCpfKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if not IsNumber(Key) then
    Key := #0;
end;

procedure TfrmCadastroProfessores.ExibirRegistros;
begin
  qrProfessor.Close;
  qrProfessor.SQL.Clear;
  qrProfessor.SQL.Add('SELECT * FROM professor');
  qrProfessor.SQL.Add(' ORDER BY id ASC   ');
  qrProfessor.Open();
end;

procedure TfrmCadastroProfessores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmCadastroProfessores := nil;
end;

procedure TfrmCadastroProfessores.LimparCampos;
begin
  edtId.Text := '';
  edtNome.Text := '';
  edtCpf.Text := '';
end;

procedure TfrmCadastroProfessores.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  LimparCampos;
  ExibirRegistros;
  edtNome.SetFocus;
end;

procedure TfrmCadastroProfessores.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if Trim(edtNome.Text) = '' then
  begin
    ShowMessage('Campo nome obrigat�rio.');
    edtNome.SetFocus;
    Exit;
  end;

  if Trim(edtCpf.Text) = '' then
  begin
    ShowMessage('Campo cpf obrigat�rio.');
    edtCpf.SetFocus;
    Exit;
  end;

  qrProfessor.Close;
  qrProfessor.SQL.Clear;
  qrProfessor.SQL.Add('SELECT * FROM professor WHERE cpf = :cpf');
  qrProfessor.ParamByName('cpf').AsString := edtCpf.Text;
  qrProfessor.Open;

  if qrProfessor.IsEmpty then
  begin
    qrProfessor.Close;
    qrProfessor.SQL.Clear;
    qrProfessor.SQL.Add('INSERT INTO professor (nome, cpf)');
    qrProfessor.SQL.Add('VALUES (:nome, :cpf)');
    qrProfessor.ParamByName('nome').AsString := edtNome.Text;
    qrProfessor.ParamByName('cpf').AsString := edtCpf.Text;
    qrProfessor.ExecSQL;

    ShowMessage('Cadastro realizado com sucesso.');
    LimparCampos;
    ExibirRegistros;
    Exit;
  end
  else
  begin
    ShowMessage('Professor possui cadastro.');
    Exit;
  end;
end;

procedure TfrmCadastroProfessores.SpeedButton3Click(Sender: TObject);
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
    qrProfessor.Close;
    qrProfessor.SQL.Clear;
    qrProfessor.SQL.Add('DELETE FROM professor WHERE id = :id');
    qrProfessor.ParamByName('id').AsString := edtId.Text;
    qrProfessor.ExecSQL;

    LimparCampos;
    ExibirRegistros;
    ShowMessage('Registro excluido com sucesso.');
    edtNome.SetFocus;
  end;
end;

procedure TfrmCadastroProfessores.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  if Trim(edtId.Text) = '' then
  begin
    ShowMessage('Selecione um registro para atualiza��o.');
    db.SetFocus;
    Exit;
  end;

  qrProfessor.Close;
  qrProfessor.SQL.Clear;
  qrProfessor.SQL.Add('UPDATE professor');
  qrProfessor.SQL.Add('SET nome = :nome');
  qrProfessor.SQL.Add('WHERE id = :id');
  qrProfessor.ParamByName('id').AsString := edtId.Text;
  qrProfessor.ParamByName('nome').AsString := edtNome.Text;
  qrProfessor.ExecSQL;

  ShowMessage('Cadastro atualizado com sucesso.');
  LimparCampos;
  ExibirRegistros;
end;

end.

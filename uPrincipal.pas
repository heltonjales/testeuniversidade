unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Alunos1: TMenuItem;
    Professores1: TMenuItem;
    Disciplinas1: TMenuItem;
    Pedaggico1: TMenuItem;
    Relatrios1: TMenuItem;
    Matriculas1: TMenuItem;
    urmas1: TMenuItem;
    LanamentodeNotas1: TMenuItem;
    Alunos3: TMenuItem;
    AlunoseProfessores1: TMenuItem;
    Sair1: TMenuItem;
    procedure Alunos1Click(Sender: TObject);
    procedure Professores1Click(Sender: TObject);
    procedure Disciplinas1Click(Sender: TObject);
    procedure urmas1Click(Sender: TObject);
    procedure Matriculas1Click(Sender: TObject);
    procedure LanamentodeNotas1Click(Sender: TObject);
    procedure Alunos3Click(Sender: TObject);
    procedure AlunoseProfessores1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uCadastroAluno, uCadastroProfessores, uDisciplina, uProfessor_Disciplina,
  uMatricula, uNotas, uRelAlunos, uAlunosProfessores, uFiltroRelatorio;

procedure TfrmPrincipal.Alunos1Click(Sender: TObject);
begin
  if frmCadastroAluno = nil then
    frmCadastroAluno := TfrmCadastroAluno.Create(Self);

  frmCadastroAluno.Show;
end;

procedure TfrmPrincipal.Alunos3Click(Sender: TObject);
begin
  if frmFiltroRelatorio = nil then
    frmFiltroRelatorio := TfrmFiltroRelatorio.Create(Self);

  frmFiltroRelatorio.Show;
end;

procedure TfrmPrincipal.AlunoseProfessores1Click(Sender: TObject);
begin
  if frmAlunosProfessores = nil then
    frmAlunosProfessores := TfrmAlunosProfessores.Create(Self);

  frmAlunosProfessores.rlAlunosProfessores.Preview();
end;

procedure TfrmPrincipal.Disciplinas1Click(Sender: TObject);
begin
  if frmCadastroDisciplina = nil then
    frmCadastroDisciplina := TfrmCadastroDisciplina.Create(Self);

  frmCadastroDisciplina.Show;

end;

procedure TfrmPrincipal.LanamentodeNotas1Click(Sender: TObject);
begin
  if frmLancamentoNotas = nil then
    frmLancamentoNotas := TfrmLancamentoNotas.Create(Self);

  frmLancamentoNotas.Show;
end;

procedure TfrmPrincipal.Matriculas1Click(Sender: TObject);
begin
  if frmCadastroAlunoDisciplina = nil then
    frmCadastroAlunoDisciplina := TfrmCadastroAlunoDisciplina.Create(Self);

  frmCadastroAlunoDisciplina.Show;

end;

procedure TfrmPrincipal.Professores1Click(Sender: TObject);
begin
  if frmCadastroProfessores = nil then
    frmCadastroProfessores := TfrmCadastroProfessores.Create(Self);

  frmCadastroProfessores.Show;
end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.urmas1Click(Sender: TObject);
begin
  if frmCadastroProf_Disciplina = nil then
    frmCadastroProf_Disciplina := TfrmCadastroProf_Disciplina.Create(Self);

  frmCadastroProf_Disciplina.Show;
end;

end.

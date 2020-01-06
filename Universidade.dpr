program Universidade;

uses
  Vcl.Forms,
  uBase in 'uBase.pas' {frmCadastroBase},
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uModulo in 'uModulo.pas' {dm: TDataModule},
  uCadastroAluno in 'uCadastroAluno.pas' {frmCadastroAluno},
  uSystemUtils in 'uSystemUtils.pas',
  uCadastroProfessores in 'uCadastroProfessores.pas' {frmCadastroProfessores},
  uDisciplina in 'uDisciplina.pas' {frmCadastroDisciplina},
  uProfessor_Disciplina in 'uProfessor_Disciplina.pas' {frmCadastroProf_Disciplina},
  uMatricula in 'uMatricula.pas' {frmCadastroAlunoDisciplina},
  uNotas in 'uNotas.pas' {frmLancamentoNotas},
  uRelAlunos in 'uRelAlunos.pas' {frmHistoricoAlunos},
  uAlunosProfessores in 'uAlunosProfessores.pas' {Form1},
  uFiltroRelatorio in 'uFiltroRelatorio.pas' {frmFiltroRelatorio};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.

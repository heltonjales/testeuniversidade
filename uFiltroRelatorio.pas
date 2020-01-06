unit uFiltroRelatorio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmFiltroRelatorio = class(TForm)
    Label1: TLabel;
    cbFiltro: TComboBox;
    btnFiltrar: TButton;
    qrAluno: TFDQuery;
    dsAluno: TDataSource;
    qrAlunoID: TIntegerField;
    qrAlunoNOME: TStringField;
    qrAlunoCPF: TStringField;
    qrAlunoDESCRICAO: TStringField;
    qrAlunoNOTA_PERIODO_1: TCurrencyField;
    qrAlunoNOTA_PERIODO_2: TCurrencyField;
    qrAlunoNOTA_TRABALHO: TCurrencyField;
    qrAlunoMEDIA: TFMTBCDField;
    procedure btnFiltrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmFiltroRelatorio: TfrmFiltroRelatorio;


implementation

{$R *.dfm}

uses uRelAlunos, uModulo;

procedure TfrmFiltroRelatorio.btnFiltrarClick(Sender: TObject);
begin
  qrAluno.Close;
  qrAluno.SQL.Clear;

  qrAluno.SQL.Add('SELECT  a.id                                                                     ');
  qrAluno.SQL.Add('       ,a.nome                                                                   ');
  qrAluno.SQL.Add('       ,a.cpf                                                                    ');
  qrAluno.SQL.Add('       ,d.descricao                                                              ');
  qrAluno.SQL.Add('       ,da.nota_periodo_1                                                       ');
  qrAluno.SQL.Add('       ,da.nota_periodo_2                                                       ');
  qrAluno.SQL.Add('       ,da.nota_trabalho                                                        ');
  qrAluno.SQL.Add('       ,((da.nota_periodo_1 + da.nota_periodo_2 + da.nota_trabalho ) /3) as Media  ');
  qrAluno.SQL.Add('  FROM aluno a                                                                   ');
  qrAluno.SQL.Add('  LEFT JOIN disciplina_aluno da                                                  ');
  qrAluno.SQL.Add('    ON a.id = da.codigo_aluno                                                    ');
  qrAluno.SQL.Add('  LEFT JOIN disciplinas d                                                        ');
  qrAluno.SQL.Add('    ON d.id = da.codigo_disciplina                                               ');
  qrAluno.SQL.Add(' WHERE 1 = 1                                                                     ');

  if cbFiltro.ItemIndex = 1 then
    qrAluno.SQL.Add('AND ((da.nota_periodo_1 + da.nota_periodo_2 + da.nota_trabalho ) /3) >= 7')
  else if cbFiltro.ItemIndex = 2 then
    qrAluno.SQL.Add('AND ((da.nota_periodo_1 + da.nota_periodo_2 + da.nota_trabalho ) /3) <= 6.9');


  qrAluno.SQL.Add(' ORDER BY a.nome, d.descricao                                                     ');
  qrAluno.Open();

  if frmHistoricoAlunos = nil then
    frmHistoricoAlunos := TfrmHistoricoAlunos.Create(Self);

  frmHistoricoAlunos.rlHistoricoAlunos.Preview();
end;


end.

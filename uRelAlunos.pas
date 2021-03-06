unit uRelAlunos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmHistoricoAlunos = class(TForm)
    rlHistoricoAlunos: TRLReport;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLLabel1: TRLLabel;
    RLDraw1: TRLDraw;
    RLLabel2: TRLLabel;
    qrAluno: TFDQuery;
    dsAluno: TDataSource;
    RLGroup1: TRLGroup;
    RLBand4: TRLBand;
    RLBand5: TRLBand;
    RLBand6: TRLBand;
    RLDBText1: TRLDBText;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    qrAlunoNOME: TStringField;
    qrAlunoCPF: TStringField;
    qrAlunoDESCRICAO: TStringField;
    qrAlunoNOTA_PERIODO_1: TCurrencyField;
    qrAlunoNOTA_PERIODO_2: TCurrencyField;
    qrAlunoNOTA_TRABALHO: TCurrencyField;
    RLDraw2: TRLDraw;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel3: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLDBText2: TRLDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHistoricoAlunos: TfrmHistoricoAlunos;
  n1 : double;
  n2 : double;
  trabalho : double;
  media_final : double;

implementation

{$R *.dfm}

uses uModulo, uFiltroRelatorio;

end.

unit uAlunosProfessores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmAlunosProfessores = class(TForm)
    rlAlunosProfessores: TRLReport;
    RLBand1: TRLBand;
    RLLabel2: TRLLabel;
    RLBand2: TRLBand;
    RLDraw2: TRLDraw;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel3: TRLLabel;
    RLSystemInfo2: TRLSystemInfo;
    RLBand3: TRLBand;
    RLLabel1: TRLLabel;
    RLDraw1: TRLDraw;
    RLGroup1: TRLGroup;
    RLBand4: TRLBand;
    RLDBText3: TRLDBText;
    RLBand5: TRLBand;
    RLLabel4: TRLLabel;
    RLLabel9: TRLLabel;
    RLBand6: TRLBand;
    RLDBText1: TRLDBText;
    RLLabel8: TRLLabel;
    qrData: TFDQuery;
    dsData: TDataSource;
    RLDBText2: TRLDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAlunosProfessores: TfrmAlunosProfessores;

implementation

{$R *.dfm}

uses uModulo;

procedure TfrmAlunosProfessores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmAlunosProfessores := nil;
end;

end.

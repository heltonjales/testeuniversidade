unit uBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmCadastroBase = class(TForm)
    Panel1: TPanel;
    sbNovo: TSpeedButton;
    sbSalvar: TSpeedButton;
    sbExcluir: TSpeedButton;
    sbEditar: TSpeedButton;
    Panel2: TPanel;
    db: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroBase: TfrmCadastroBase;

implementation

{$R *.dfm}

procedure TfrmCadastroBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmCadastroBase.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F2 : if sbNovo.Enabled then
            begin
              sbNovo.Click;
            end;
    VK_F4 : if sbSalvar.Enabled then
            begin
              sbSalvar.Click;
            end;
    VK_F5 : if sbEditar.Enabled then
            begin
              sbEditar.Click;
            end;
    VK_F9 : if sbExcluir.Enabled then
            begin
              sbExcluir.Click;
            end;
  end;
end;

end.

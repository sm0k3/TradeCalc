unit Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Buttons, help;

type

  { TTradeCalc_MainForm }

  TTradeCalc_MainForm = class(TForm)
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    ItemNUM: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    TrayIcon1: TTrayIcon;
    TT_VAL: TEdit;
    MU_VAL: TEdit;
    TOT_MU: TEdit;
    SALE_TOT: TEdit;
    procedure TradeCalc_ShowHelp(Sender: TObject);
    procedure TrayIcon1DblClick(Sender: TObject);
    procedure Main_form_DoCalc(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  TradeCalc_MainForm: TTradeCalc_MainForm;

implementation

{$R *.lfm}

{ TTradeCalc_MainForm }

function CalculateSales(): Extended;
var
  currTot,Totals,TT_VAL,Markup,ItemNUM : Extended;

begin
    if (TradeCalc_MainForm.ItemNUM.Text = '') or (TradeCalc_MainForm.ItemNUM.Text = '0')  then   TradeCalc_MainForm.ItemNUM.Text := '1';
    ItemNUM := StrToInt(TradeCalc_MainForm.ItemNUM.Text);
    if (TradeCalc_MainForm.TT_VAL.Text = '') or (StrToFloat(TradeCalc_MainForm.TT_VAL.Text) < 0.01)  then   TradeCalc_MainForm.TT_VAL.Text := '0.01';
    TT_VAL := StrToFloat(TradeCalc_MainForm.TT_VAL.Text);
    if (TradeCalc_MainForm.MU_VAL.Text = '') or (StrToFloat(TradeCalc_MainForm.MU_VAL.Text) < 100)  then   TradeCalc_MainForm.MU_VAL.Text := '100';
    Markup := StrToFloat(TradeCalc_MainForm.MU_VAL.Text);
    currTot := TT_VAL * Markup / 100;
    Totals  := CurrTot * ItemNUM;
    Result := Totals;
end;

function ProfitTT(): Extended;
var
  ProfTOT, SALE_TOT, TT_VAL, TT_TOT, ItemNUM : Extended;
begin
     ItemNUM := StrToInt(TradeCalc_MainForm.ItemNUM.Text);
     TT_VAL := StrToFloat(TradeCalc_MainForm.TT_VAL.Text);
     TT_TOT := TT_VAL * ItemNUM;
     SALE_TOT := StrToFloat(TradeCalc_MainForm.SALE_TOT.Text);
     ProfTOT := TT_TOT - SALE_TOT;
     Result := ProfTOT;
end;


procedure TTradeCalc_MainForm.TrayIcon1DblClick(Sender: TObject);
begin
    TradeCalc_MainForm.WindowState:=wsNormal ;
    Application.BringToFront;
end;

procedure TTradeCalc_MainForm.TradeCalc_ShowHelp(Sender: TObject);
begin
     TradeCalc_HELP.Show;
     TradeCalc_HELP.ShowOnTop
end;

procedure TTradeCalc_MainForm.Main_form_DoCalc(Sender: TObject);
begin
     TradeCalc_MainForm.SALE_TOT.Text := FloatToStr(CalculateSales());
     TradeCalc_MainForm.TOT_MU.Text := FloatToStr(ProfitTT());
end;

end.


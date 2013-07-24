program TradeCalc;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Main, help;

{$R *.res}

begin
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(TTradeCalc_MainForm, TradeCalc_MainForm);
  Application.CreateForm(TTradeCalc_HELP, TradeCalc_HELP);
  Application.Run;
end.


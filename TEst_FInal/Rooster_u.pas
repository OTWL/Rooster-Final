unit Rooster_u;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo, FMX.DateTimeCtrls, Data.Bind.EngExt, FMX.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, FMX.Bind.Editors, Data.Bind.Components,
  System.Notification, System.DateUtils;

type
  TForm1 = class(TForm)
    pnlBackground: TPanel;
    tTimeStartPicker: TTimeEdit;
    tTimeEndPicker: TTimeEdit;
    btnSubmit: TButton;
    TimeOutput: TMemo;
    LabelStart: TLabel;
    LabelEnd: TLabel;
    NotificationCenter: TNotificationCenter;
    cbxPLength: TCheckBox;
    Button1: TButton;
    procedure tTimeStartPickerChange(Sender: TObject);
    procedure TimeCheck();
    procedure tTimeEndPickerChange(Sender: TObject);
    procedure btnSubmitClick(Sender: TObject);
    procedure SendNoti();
    procedure DeterminePeriodLenghts();
    procedure CalculateNotificationTimes();
    procedure BtnCancelClick(Sender: TObject);
  private
  var
    tStartTime, tEndTime: TDateTime;
    aTime: array [1 .. 9] of TTime;
    aNotiTime: array [1 .. 9] of TTime;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.BtnCancelClick(Sender: TObject);
begin
  NotificationCenter.CancelAll;
  ShowMessage('Notifications canceled');
  TimeOutput.Lines.Clear;
end;

procedure TForm1.btnSubmitClick(Sender: TObject);
begin
  tStartTime := tTimeStartPicker.Time;
  tEndTime := tTimeEndPicker.Time;
  DeterminePeriodLenghts();
  CalculateNotificationTimes();
  SendNoti();

end;

procedure TForm1.CalculateNotificationTimes;
var
  i: integer;
begin

  i := 0;

  for i := 1 to 8 do
  begin

    if i = 1 then
    begin
      aNotiTime[1] := aTime[i] - Time;
      // TimeOutput.Lines.add(timetostr(aTime[1] - Time));
      TimeOutput.Lines.add(timetostr(aNotiTime[i]) + 'Notification: ' +
        IntToStr(i));
      Continue;
    end;

    aNotiTime[i] := aTime[i + 1] - Time;
    TimeOutput.Lines.add(timetostr(aNotiTime[i]) + 'Notification: ' +
      IntToStr(i));
  end;
end;

procedure TForm1.DeterminePeriodLenghts;
var
  tPerLenghts: TTime;
  i: integer;
begin
  i := 1;
  tPerLenghts := (tEndTime - tStartTime); // - EncodeTime(0, 1, 0, 0); // 45

  for i := 1 to 9 do
  begin

    if i = 1 then
    begin
      aTime[i] := tStartTime; // 9:00
      TimeOutput.Lines.add(timetostr(aTime[i]) + '- Per 1');
      Continue;
    end;

    if i = 6 then
    begin
      aTime[i] := aTime[i - 1] + EncodeTime(0, 30, 0, 0); // Break;
      TimeOutput.Lines.add(timetostr(aTime[i]) + '- Per' + IntToStr(i));
      Continue;
    end;

    // a =      9:00    + 45
    aTime[i] := aTime[i - 1] + tPerLenghts;
    TimeOutput.Lines.add(timetostr(aTime[i]) + '- Per ' + IntToStr(i));

  end;
end;

procedure TForm1.SendNoti;
var
  i: integer;
  MyNotification: array [1 .. 10] of TNotification;
begin
  MyNotification[1] := NotificationCenter.CreateNotification('Succes',
    'Times have been added and notifications will be pushed throughout the day',
    now);
  MyNotification[1].FireDate := now;
  NotificationCenter.PresentNotification(MyNotification[1]);
  // Schedule all notifications
  i := 1;
  { MyNotification := NotificationCenter.CreateNotification;
    MyNotification.Name := 'Hello';
    MyNotification.AlertBody := 'Bell rings in 10 mins'; }
  /// MyNotification.FireDate := ;
  // NotificationCenter.PresentNotification(MyNotification); // windows

  // Schedule all notifications
  for i := 1 to 9 do
  begin

    MyNotification[i] := NotificationCenter.CreateNotification
      ('Period' + IntToStr(i), 'Period ' + IntToStr(i) + ' ends in 5 mins',
      aNotiTime[i] - EncodeTime(0, 5, 0, 0));
    NotificationCenter.ScheduleNotification(MyNotification[i]);
  end;
end;

procedure TForm1.TimeCheck;
begin
  // Checks if Start time is set to less then end time
  TimeOutput.Lines.Clear;

  if tTimeEndPicker.Time <= tTimeStartPicker.Time then
  begin
    tTimeEndPicker.Time := tTimeStartPicker.Time + StrToTime('1');
    TimeOutput.Lines.add(timetostr(tTimeEndPicker.Time));
  end;

end;

procedure TForm1.tTimeEndPickerChange(Sender: TObject);
begin
  TimeCheck();
end;

procedure TForm1.tTimeStartPickerChange(Sender: TObject);
begin
  TimeCheck();
end;

end.

program HorseDemo;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  Horse,
  Sempare.Template,
  System.SysUtils;

type
  TIndexData = record
    Name: string;
    Users: TArray<string>;
  end;

begin
  try
    THorseProvider.KeepConnectionAlive := true;
    THorse.Get('/',
      procedure(Req: THorseRequest; Res: THorseResponse)
      var
        LData: TIndexData;
      begin
        LData.Name := 'Sempare Template Engine';
        Res.Send(Template.Resolve('index', LData));
      end);
    THorse.Get('/page2',
      procedure(Req: THorseRequest; Res: THorseResponse)
      var
        LData: TIndexData;
      begin
        LData.Name := 'Sempare Template Engine';
        LData.Users := ['Ian', 'Macro', 'David'];
        Res.Send(Template.Resolve('page2', LData));
      end);
    THorse.Listen(8080, nil,
      procedure
      begin
        TTemplateRegistry.Finalize;
      end);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.

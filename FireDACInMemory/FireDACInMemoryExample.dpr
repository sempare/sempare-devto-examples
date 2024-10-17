program FireDACInMemoryExample;

{$APPTYPE CONSOLE}

uses
  Data.DB,
  FireDAC.Comp.Client,
  System.SysUtils,
  Sempare.Template.Evaluate,
  Sempare.Template.Rtti,
  Sempare.Template;

function CreateMockUsersTable(): TFDMemTable;

  procedure AddPerson(const AName: string; const AAge, AWeight: integer);
  begin
    result.Append;
    result.FieldByName('name').value := AName;
    result.FieldByName('age').value := AAge;
    result.FieldByName('weight').value := AWeight;
    result.Post;
  end;

begin
  result := TFDMemTable.Create(nil);
  result.FieldDefs.Add('name', ftWideString, 20);
  result.FieldDefs.Add('age', ftInteger);
  result.FieldDefs.Add('weight', ftFloat);
  result.CreateDataSet;
  AddPerson('joe', 20, 67);
  AddPerson('pete', 19, 87);
  AddPerson('jane', 23, 47);
end;

type
  TTemplateData = record
    Users: TDataSet;
  end;

var
  LTemplateData: TTemplateData;

begin
  LTemplateData.Users := CreateMockUsersTable;
  try
    writeln(Template.Resolve('users.tpl', LTemplateData));
  finally
    LTemplateData.Users.Free;
  end;

end.

unit ClassReg;

interface

implementation

uses Scripter, Controls, StdCtrls;

initialization
  RegisterType(TypeInfo(TControl),SizeOf(TControl));
    RegisterMethod(TControl.ClassName,'procedure Hide;',@TControl.Hide);
end.

With Ada.Text_IO; Use Ada.Text_IO;
With Birthdays; Use Birthdays;
With File_IO; use File_IO;
with InfoController;

Procedure Uppgift_6 is
   L : File_IO.Log;
begin

   InfoController.Get(L.Namn,L.NamnIndex);

   InfoController.Get(L.Datum);

   Put_Line(L.Namn(1..L.NamnIndex) & " have had " & CountDaysThatIs(Datum=>L.Datum,Lör=>True,Sön=>True)'img &" birthdays on saturdays or sundays.");

   ExportToFile(L);

End Uppgift_6;

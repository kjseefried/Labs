With Birthdays; use Birthdays;

Package File_IO is

   Type Log is record
      Namn      : String(1..100);
      NamnIndex : Integer;
      Datum     : TypDatum;
   end record;


   Procedure ExportToFile (aLog : in Log);

end File_IO;

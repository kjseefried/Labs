With Ada.Text_IO; use Ada.Text_IO;
Package body File_IO is

   Procedure ExportToFile (aLog : in Log) is
      FileNameIs : string := "Birthdays.log";
      File   : File_Type;

      Procedure FileHandler is
      begin
         Declare Begin
            Open (File, Append_File, FileNameIs);
         exception
            when NAME_ERROR =>
               Create (File, In_File, FileNameIs);
               Close (File);
               Open (File, Append_File, FileNameIs);
         end;
      end FileHandler;

   Begin
      FileHandler;

      Put(File, aLog.Namn(1..aLog.NamnIndex));
      Put(File, Character'Val (9));
      Put(File, aLog.Datum.Year'Img & '-' & aLog.Datum.Month'Img & integer( - aLog.Datum.Day)'Img);

      Close(File);

      Put("Data has been saved successfully!");
    end ExportToFile;
end File_IO;

With Birthdays; use Birthdays;
with Ada.Text_IO;

package body InfoController is
   package TIO renames Ada.Text_IO;

   Procedure Clere_Buffer is
      t : string(1..100);
      f : integer;
   begin
      TIO.Get_Line(t,f);
   end Clere_Buffer;


   Procedure Get(Namn      : out String;
                 NamnIndex : out Integer) is
   begin
      TIO.Put_Line("What is your name? ");
      TIO.Get_Line(Namn, NamnIndex);
   exception
      when others =>
         TIO.New_Line(2);
         TIO.Put_Line("An error occurred. Please try again.");
         Get(Namn, NamnIndex);
   end Get;


   Procedure Get(Datum : out TypDatum) is
      package YearIn is new ada.Text_IO.Integer_IO(R_�r);
      package MonIn is new ada.Text_IO.Integer_IO(R_M�nad);
      package DayIn is new ada.Text_IO.Integer_IO(R_Dag);


      Procedure Year(DY : out R_�r) is
      begin
         Clere_Buffer;
         TIO.Put_Line("Year of birthday (YYYY): ");
         YearIn.Get(DY);
      exception
         when others =>
            TIO.New_Line(2);
            TIO.Put_Line("Error occurred. Try Again.");
            Year(DY);
      end year;

      Procedure Monad(DY : out MMNamn) is
         I : R_M�nad;
      begin
         Clere_Buffer;
         TIO.Put_Line("Month of birthday (MM):");
         MonIn.Get(I);
         DY := MMNamn'Val(I-1);
      exception
         when others =>
            TIO.New_Line(2);
            TIO.Put_Line("Error occurred. Try Again.");
            Monad(DY);
      end Monad;

      --Tar TypDatum f�r att blokera icke existerande dagar;
      Procedure Day(DY : in out TypDatum) is
         DoAgen : exception;
      begin
         Clere_Buffer;
         TIO.Put_Line("Day of birthday (DD):");
         DayIn.Get(DY.Day);

         if Dy.Month = Februari and dy.Day = 29 then

            if not Skott�r(dy.Year) then
               TIO.New_Line(2);
               tio.Put_Line("Wrong day since the year is not a leap year.");
               raise DoAgen;
            else return;
            end if;

         elsif Dy.Day > M�nadDagVal(dy.Month) then
            TIO.New_Line(2);
            tio.put_Line("Unacceptable day nr. Try again.");
            raise DoAgen;
         end if;
      exception
         When DoAgen =>
            Day(DY);
         when others =>
            TIO.New_Line(2);
            TIO.Put_Line("Unexpected error occurred. Please try again.");
            Day(DY);
      end Day;


      D : TypDatum;
   begin
      TIO.New_Line; Year(D.Year);
      TIO.New_Line; Monad(D.Month);
      TIO.New_Line; Day(D);
      Clere_Buffer;

      Datum := D;
   end Get;
end InfoController;

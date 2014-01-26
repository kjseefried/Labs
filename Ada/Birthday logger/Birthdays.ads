package Birthdays is
   type YY is range 0 .. 35_000_000;
   type MM is range 0 .. 35_000_000;
   type DD is range 0 .. 35_000_000;

   subtype R_År    is YY range 0 .. 2050;
   subtype R_Månad is MM range 1 .. 12;
   subtype R_Dag   is DD range 1 .. 31;

   type DagNamn is (Måndag, Tisdag, Onsdag, Torsdag, Fredag, Lördag, Söndag);
   type MMNamn is (Januari, Februari, Mars, April, Maj, Juni, Juli, Augusti, September, Oktober, November, December);

   type MDVal is array (MMNamn'Range) of DD;
   MånadDagVal : constant MDVal := (31,29,31,30,31,30,31,31,30,31,30,31);

   type TypDatum is record
      Year  : R_År;
      Month : MMNamn;
      Day   : R_Dag;
   end record;


   function "="  (X, Y : TypDatum) return Boolean;
   function ">"  (X, Y : TypDatum) return Boolean;
   function "<"  (X, Y : TypDatum) return Boolean;
   function ">=" (X, Y : TypDatum) return Boolean;
   function "<=" (X, Y : TypDatum) return Boolean;
   function Skottår (Y : in R_År) return Boolean;
   function Skottår_Från_Noll (Y : in R_År) return DD;
   function Dagar_från_Noll (Datum : in TypDatum) return DD;
   procedure Feb_Fix (Duc : in out TypDatum);
   function  DagTyp  (Days : in DD)        return DagNamn;
   function  DagTyp  (Datum : in TypDatum) return DagNamn;
   function  DagTyp  (Datum : in TypDatum) return String;
   function CountDaysThatIs
     (Datum                             : in TypDatum;
      Mån, Tis, Ons, Tor, Fre, Lör, Sön : in Boolean := False)
      return                              Integer;
end Birthdays;

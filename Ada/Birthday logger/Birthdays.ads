package Birthdays is
   type YY is range 0 .. 35_000_000;
   type MM is range 0 .. 35_000_000;
   type DD is range 0 .. 35_000_000;

   subtype R_�r    is YY range 0 .. 2050;
   subtype R_M�nad is MM range 1 .. 12;
   subtype R_Dag   is DD range 1 .. 31;

   type DagNamn is (M�ndag, Tisdag, Onsdag, Torsdag, Fredag, L�rdag, S�ndag);
   type MMNamn is (Januari, Februari, Mars, April, Maj, Juni, Juli, Augusti, September, Oktober, November, December);

   type MDVal is array (MMNamn'Range) of DD;
   M�nadDagVal : constant MDVal := (31,29,31,30,31,30,31,31,30,31,30,31);

   type TypDatum is record
      Year  : R_�r;
      Month : MMNamn;
      Day   : R_Dag;
   end record;


   function "="  (X, Y : TypDatum) return Boolean;
   function ">"  (X, Y : TypDatum) return Boolean;
   function "<"  (X, Y : TypDatum) return Boolean;
   function ">=" (X, Y : TypDatum) return Boolean;
   function "<=" (X, Y : TypDatum) return Boolean;
   function Skott�r (Y : in R_�r) return Boolean;
   function Skott�r_Fr�n_Noll (Y : in R_�r) return DD;
   function Dagar_fr�n_Noll (Datum : in TypDatum) return DD;
   procedure Feb_Fix (Duc : in out TypDatum);
   function  DagTyp  (Days : in DD)        return DagNamn;
   function  DagTyp  (Datum : in TypDatum) return DagNamn;
   function  DagTyp  (Datum : in TypDatum) return String;
   function CountDaysThatIs
     (Datum                             : in TypDatum;
      M�n, Tis, Ons, Tor, Fre, L�r, S�n : in Boolean := False)
      return                              Integer;
end Birthdays;

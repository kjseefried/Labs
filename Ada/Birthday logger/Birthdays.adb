with ada.Calendar;
Package Body Birthdays is


   Function SysDate return TypDatum is
      Ignor :ada.calendar.Day_Duration;
      Re    : TypDatum;
      TemYY,TemMM,TemDD : integer:=0;
   begin
      ada.Calendar.Split(ada.Calendar.Clock, TemYY, TemMM, TemDD, Ignor);
      Re.Year  := YY(TemYY);
      Re.Month := MMNamn'val(TemMM-1);
      Re.Day   := DD(TemDD);
      return re;
   end SysDate;



   Function "="  (X,Y :TypDatum) Return Boolean Is
   Begin
      Return X.Year  = Y.Year  And
        X.Month = Y.Month And
        X.Day   = Y.Day;
   End "=";

   Function ">"  (X,Y :TypDatum) Return Boolean Is
   Begin
      Return X.Year > Y.Year    or(
                                   X.Year  = Y.Year   and
                                     X.Month > Y.Month) or(
                                                           X.Year  = Y.Year   and
                                                             X.Month > Y.Month  and
                                                               X.Day   >  Y.Day);
   End ">";

   Function "<"  (X,Y :TypDatum) Return Boolean Is
   Begin
      Return Y>X;
   End "<";

   Function ">=" (X,Y :TypDatum) Return Boolean Is
   Begin
      Return X>Y Or X=Y;
   End ">=";

   Function "<=" (X,Y :TypDatum) Return Boolean is
   Begin
      Return Y>X Or X=Y;

   End "<=";


   -------------------------------------------------------------------------------
   --Funktioner/Procedures
   Function  Skott�r           (Y : in R_�r) Return Boolean is
      X : YY;
   begin
      if Y = 0 then
         return True;
      end if;
      X := Y-1;
      return (Y/400 - X/400) - (Y/100 - X/100) + (Y/4 - X/4) = 1;
      --     exception
      --        when others => return false;
   end Skott�r;

   Function  Skott�r_Fr�n_Noll (Y : In R_�r) Return DD is
   begin
      Return DD(Y/400 - Y/100 + Y/4); --d� 0 inte �r  ett skot�r
   end Skott�r_Fr�n_Noll;

   Function Dagar_fr�n_noll (Datum : in TypDatum) Return DD is
      T : DD      := 0;
      M : MMNamn  := Datum.Month;
   Begin
      T := DD(Datum.Year*365) + Datum.Day +
        Skott�r_Fr�n_Noll(Datum.Year-1*(boolean'pos(Datum.Year > 0)));

      if M /= Januari then
         for i in Januari..MMNamn'Pred(M) loop
            T := T + M�nadDagVal(i);
         end loop;
      end if;

      return T;
   end Dagar_fr�n_noll;


   Procedure Feb_Fix (Duc : In out TypDatum) is
   begin
      if Duc = (Duc.Year, Februari, 29) and
        Skott�r(Duc.Year) = false then
         Duc := (Duc.Year, Mars, 1);
      end if;
   end Feb_Fix;


   Function DagTyp (Days :DD) Return DagNamn is
      K : DD := Days+7-2;
   begin

      Return  DagNamn'Val(K rem 7);       --DagNamn'Val(K - (K / 7)*7);
   end DagTyp;

   Function DagTyp (Datum :TypDatum) Return DagNamn is
   Begin Return DagTyp(Dagar_fr�n_noll(Datum));
   end DagTyp;

   Function DagTyp (Datum :TypDatum) Return string is
   Begin Return DagTyp(Dagar_fr�n_noll(Datum))'img;
   end DagTyp;


   Function CountDaysThatIs (Datum : in TypDatum;
                             M�n, Tis, Ons, Tor, Fre, L�r, S�n : in Boolean :=False)
                             Return Integer Is
      ToDay   : TypDatum := SysDate;
      Temp    : TypDatum := Datum;
      Corect  : Integer  := 0;
      R�ttDag : array(DagNamn'Range) of boolean := (M�n, Tis, Ons, Tor, Fre, L�r, S�n);
   Begin
      --Om alla Allternativ �r false s�tt alla till true
      if R�ttDag  = (False, False, False, False, False, False, False) then
         R�ttDag := (others => true);
      end if;


      --Spara om dagen �r r�tt
      If Datum.Year < ToDay.Year Then
         for i in Datum.Year .. ToDay.Year - YY(1) loop
            Temp.Year := i;
            Corect := Corect + boolean'Pos(R�ttDag(DagTyp(Temp)));
         end loop;
      end if;

      If ToDay.Month > Datum.Month      or
        (ToDay.Month = Datum.Month   and
           ToDay.Day   >= Datum.Day) then

         Corect := Corect + boolean'Pos(R�ttDag(DagTyp(Datum)));
      end if;

      Return Corect;
   end CountDaysThatIs;

end Birthdays;

with ada.text_io,ada.Integer_Text_IO;
use ada.text_io,ada.Integer_Text_IO;

procedure Uppgift_2 is


   generic
      type Element_T is private;
   procedure Generic_Swap (X, Y : in out Element_T);



   procedure Generic_Swap (X, Y : in out Element_T) is
      Temporary : constant Element_T := X;
   begin
      X := Y;
      Y := Temporary;
   end Generic_Swap;



   procedure Swap is new Generic_Swap(Integer);

   Data : array(1..100) of integer :=
     ( 80,  10,   3,  85,  61,  23,  18,   5,  92,   4,
      20,  23,  81,  74,  80,   6,  20,  23,  81,  64,
      77,  48,  49,  96,  69,  81,  27,  85,  85,  94,
      68,  18,  45,  35,  21,  94,  39,  43,  41,  22,
      53,  89,  39,  98,  31,  66,  58,  19,  33,  76,
      4,   5,  48,  63,  79,   6,   2,  26,  37,  96,
      40,   9,  62,  45,  49,  70,   2,  41,  20,  24,
      66,  45,  14,  70,  58,  46,  89,  71,   0,   9,
      64,  89,  84,  13,  79,  76,  54,  64,  39,   1,
      18,  22,  39,  29,  98,  90,   5,  71,   8,  14);


   done : boolean := true;

begin

   loop
      done := true;
      for i in 1..data'length-1 loop
         if(data(i) < data(i+1)) then
            swap(data(i),data(i+1));
            done := false;
         end if;
      end loop;
      exit when done;
   end loop;

   for i in data'range loop
      put_line(data(i)'img);
   end loop;

end Uppgift_2;

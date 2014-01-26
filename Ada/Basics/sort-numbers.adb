With Ada.Text_IO, Ada.Integer_Text_IO;
Use Ada.Text_IO, Ada.Integer_Text_IO;

Procedure Uppgift_1 is

   i, ii, CurrentMax : Integer := 0;
   Position: Positive;
   Value   : Integer;
   X	: array(1..100) of integer :=( 80, 10, 20, 23, 77, 48, 68, 18, 53, 89, 3, 85, 61, 23, 18, 5, 92, 4, 81, 74, 80, 6, 20, 23, 81, 64, 49, 96, 69, 81, 27, 85, 85, 94, 45, 35, 21, 94, 39, 43, 41, 22, 39, 98, 31, 66, 58, 19, 33, 76, 4, 40, 66, 64, 18, 5,48,63,79, 6, 2,26,37,96, 9, 62, 45, 49, 70, 2, 41, 20, 24, 45, 14, 70, 58, 46, 89, 71, 0, 9, 89, 84, 13, 79, 76, 54, 64, 39, 1, 22, 39, 29, 98, 90, 5, 71, 8, 14);


begin
    --The sorting algorithm is to change place of two elements untill all elements are soreted correctly.
   for I in X'First+1 .. X'Last loop
      if X(I) < X(I-1) then
         Value := X(I);

         for J in reverse X'First .. I-1 loop
            exit when X(J) < Value;
            Position := J;
         end loop;

         X(Position+1 .. I) := X(Position .. I-1);
         X(Position) := Value;
      end if;
   end loop;

   For I in X'First..X'Last loop
      Put(X(I)'img & " ");
   end loop;

end Uppgift_1;

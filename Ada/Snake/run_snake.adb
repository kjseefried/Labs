
with Graphics; use Graphics;
with Graphics.Snake; use Graphics.Snake;

procedure Run_Snake is
   B : Buffer (1 .. 24, 1 .. 80);
   S : Snake_Type (1..5) := ((10, 10),
                               (10, 11),
                               (10, 12),
                               (11, 12),
                               (12, 12));
   D : Duration := 0.07;
begin

   for R in 1 .. 5 loop
      Empty (B);

      Draw_Rect (B, (1, 1), Width  => 80,
                 Height            => 24);
      Draw (B, S);
      Update (B);
      Move (S, 0, -1);
      delay D;

   end loop;

   for R in 1 .. 35 loop
      Empty (B);

      Draw_Rect (B, (1, 1), Width  => 80,
                 Height            => 24);
      Draw (B, S);
      Update (B);
      Move (S, 1, 0);
      delay D;

   end loop;
   for R in 1 .. 15 loop
      Empty (B);

      Draw_Rect (B, (1, 1), Width  => 80,
                 Height            => 24);
      Draw (B, S);
      Update (B);
      Move (S, 0, 1);
      delay D;
   end loop;
   for R in 1 .. 2 loop
      Empty (B);

      Draw_Rect (B, (1, 1), Width  => 80,
                 Height            => 24);
      Draw (B, S);
      Update (B);
      Move (S, -1, 0);
      delay D;
   end loop;
   for R in 1 .. 2 loop
      Empty (B);

      Draw_Rect (B, (1, 1), Width  => 80,
                 Height            => 24);
      Draw (B, S);
      Update (B);
      Move (S, 0, -1);
      delay D;
   end loop;
   for R in 1 .. 25 loop
      Empty (B);

      Draw_Rect (B, (1, 1), Width  => 80,
                 Height            => 24);
      Draw (B, S);
      Update (B);
      Move (S, 1, 0);
      delay D;
   end loop;

end Run_Snake;

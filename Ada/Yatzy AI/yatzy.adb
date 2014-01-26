With Ada.Text_IO; use Ada.Text_IO;
With Ada.Integer_Text_IO; Use Ada.Integer_Text_IO;
With Ada.Numerics; Use Ada.Numerics;
With Ada.Numerics.Discrete_Random;

Package body Yatzy is



   Procedure DrawLine is
   begin
      for i in 1..80 loop
         Put('=');
      end loop;
      New_Line;
   end DrawLine;

   --Print Pretty
   procedure print_pretty(someDices:DicesType) is
   begin
      for r in 0..4 loop
         for i in someDices'range loop
            if( (r=0 or r=4) ) then put(" -----  "); end if;
            if(
               (someDices(i) = 1 and (r=1 or r=3)) or
                 (someDices(i) = 2 and (r=2)) or
                 (someDices(i) = 4 and (r=2))
              ) then put("|     | "); end if;
            if(
               (someDices(i) = 2 and (r=3)) or
                 (someDices(i) = 3 and (r=3))
              ) then put("|o    | "); end if;
            if(
               (someDices(i) = 1 and (r=2)) or
                 (someDices(i) = 3 and (r=2)) or
                 (someDices(i) = 5 and (r=2))
              ) then put("|  o  | "); end if;
            if(
               (someDices(i) = 2 and (r=1)) or
                 (someDices(i) = 3 and (r=1))
              ) then put("|    o| "); end if;
            if(
               (someDices(i) = 6 and (r=1 or r=2 or r=3)) or
                 (someDices(i) = 5 and (r=1 or r=3)) or
                 (someDices(i) = 4 and (r=1 or r=3))
              ) then put("|o   o| "); end if;
         end loop;
         new_line;
      end loop;
   end;

   --Return a random integer between 1 and 6
   Function RandomDiceValue return Integer is
      type Random_range is range 1..6;
      package Rand_Int is new Ada.Numerics.Discrete_Random(Random_range);
      seed : Rand_Int.Generator;
      Num : Random_range;
   begin
      Rand_Int.Reset(seed);
      Num := Rand_Int.Random(seed);
      return Integer(Random_range(Num));
   end RandomDiceValue;


   --Return a boolean array based on string separated by strings
   function ConvertStringToBoolean(str:String) return BooleanArrayType is
      BooleanArray: BooleanArrayType := (others => False);
   begin
      for j in str'range loop
            if str(j)='y' then
               BooleanArray(j):=True;
            end if;
      end loop;

	if str'Length = 0 then 
		for j in BooleanArrayType'range loop
		 BooleanArray(j):=True;
	end loop;
	
		end if;
      return BooleanArray;
   end ConvertStringToBoolean;


   --Print everybodys result
   Procedure PrintEveryonesScores(Players : in PlayersArrayType) is begin
      DrawLine;
      Put_Line("The scores have been updated. Global Score Table:");
      DrawLine;

      Put("PLAYER        ");

      for i in Players'range loop
         Put(" | ");
         if i<10 then
            Put(i,Width => 3);
         elsif i<100 and i>9 then
            Put(i,Width => 3);
         else
            Put(i,Width => 0);
         end if;
      end loop;

      New_Line;

      for i in 1..17 loop
         if i=1 or i=8 or i=17 then
            Put("--------------------------------------------------------------------------------");New_Line;
         end if;
         Put(Categories(i));

         for w in Players'range loop
            Put(" | ");
            if Players(w).score(i)<10 then
               Put(Players(w).score(i),Width => 3);
            elsif Players(w).score(i)<100 and Players(w).score(i)>9 then
              Put(Players(w).score(i),Width =>3);
            else
               Put(Players(w).score(i),Width => 0);
            end if;
         end loop;
         New_Line;
      end loop;



      DrawLine;
   end PrintEveryonesScores;


   --Decide who is winner of the game
   Procedure DecideWinner(Players : in PlayersArrayType) is
      WinnderId: Integer:=1;
   begin
      New_Line(30);
      PrintEveryonesScores(Players);

      for w in Players'range loop
         Put_Line("BOT"&w'img&" has a total of" & Players(w).score(17)'img&" points.");

         if Players(w).score(17) >= Players(WinnderId).score(17) then
            WinnderId := w;
         end if;
      end loop;
	New_Line;
      put_line("The winners is BOT nr" & WinnderId'img & " with" & Players(WinnderId).score(17)'img & " points!!!");
   end DecideWinner;


   --Save a score for a user
   Procedure SaveScore(Players : in out PlayersArrayType; PlayerID:in Positive; CategoryID:in Integer; Points:in Integer) is
      BonusPoints : Integer := 0;
   begin
      Players(PlayerID).score(CategoryID):=Players(PlayerID).score(CategoryID)+Points; --Add x points to the y category
      Players(PlayerID).score(17):=Players(PlayerID).score(17)+Points; --Add x points to the total category

      --Check for Bonus
      for i in 1..6 loop
         BonusPoints := BonusPoints + Players(PlayerID).score(i);
      end loop;
      if  BonusPoints > 63 then
         Players(PlayerID).score(7):=50; --Add 50 points to the Bonus category
         Players(PlayerID).score(17):=Players(PlayerID).score(17)+50; --Add 50 points to the total category
      end if;

   end SaveScore;


   --Calculate the result of the players turn
   Function CreateScoreTableBasedOnDices(arr : in DicesType; Player:in PlayerType) return SavingPoint is
      TempTable 		: ScoreTableType := (Others => 0);
      CategoryID		: Integer := 0;
      WhereToSave 		: SavingPoint := (Others => 0);
      alikes 			: Array(1..6) of Integer := (Others => 0);
      nPairs,fullHouse 		: Integer := 0;
      sStraight, lStraight 	: Boolean := True;
   begin

      --Check single values and Check Chance
      for i in arr'range loop
         if arr(i) = 1 then TempTable(1):=TempTable(1)+1; TempTable(15):=TempTable(15)+1;	alikes(1):=alikes(1)+1;	 	end if;
         if arr(i) = 2 then TempTable(2):=TempTable(2)+2; TempTable(15):=TempTable(15)+2;	alikes(2):=alikes(2)+1; 	end if;
         if arr(i) = 3 then TempTable(3):=TempTable(3)+3; TempTable(15):=TempTable(15)+3;	alikes(3):=alikes(3)+1;		end if;
         if arr(i) = 4 then TempTable(4):=TempTable(4)+4; TempTable(15):=TempTable(15)+4;	alikes(4):=alikes(4)+1; 	end if;
         if arr(i) = 5 then TempTable(5):=TempTable(5)+5; TempTable(15):=TempTable(15)+5;	alikes(5):=alikes(5)+1;  	end if;
         if arr(i) = 6 then TempTable(6):=TempTable(6)+6; TempTable(15):=TempTable(15)+6;	alikes(6):=alikes(6)+1; 	end if;

         --Check Small straight
         if arr(i)/=i and i<6 then sStraight:=False; end if;

         --Check Large straight
         if arr(i)/=i+1 and i>2 then lStraight:=False; end if;
      end loop;

      --Find number of pairs
      for i in alikes'range loop if alikes(i)=2 then nPairs:=nPairs+1; end if; end loop;

      --Find results
      for i in alikes'range loop
         --Check one pair
         if alikes(i)>1 then TempTable(8):=(i*2);end if;

         --Check two pairs
         if nPairs=2 or alikes(i)=4 then fullHouse:=fullHouse+1; if alikes(i)=2 then TempTable(9):=TempTable(9)+(i*2); end if; end if;

         --Check tDrawLineee of a kind
         if alikes(i)>2 then fullHouse:=fullHouse+1; TempTable(10):=TempTable(10)+(i*3);end if;

         --Check four of a kind
         if alikes(i)>3 then TempTable(11):=TempTable(11)+(i*4);end if;

         --Check Yatzi
         if alikes(i)=5 then TempTable(16):=TempTable(16)+50;end if;

         --Check Fulle House (KAK)
         for j in alikes'range loop
            if alikes(i)=2 and alikes(j)=3 then
               TempTable(14):=25;
            end if;
         end loop;

      end loop;

      --Samll straight
      if sStraight then TempTable(12):=TempTable(12)+15; end if;
      --Large straight
      if lStraight then TempTable(13):=TempTable(13)+20; end if;


      for i in 1..16 loop
         if i<10 then set_col(2); end if;
         if Player.score(i)=0 then

            if TempTable(i)>categoryID then
               categoryID := i;
            end if;

            if TempTable(i)<10 then
               Put_Line(i'Img &" - "&Categories(i)& "- " & TempTable(i)'img & " ");
            else
               Put_Line(i'Img &" - "&Categories(i)& "-" & TempTable(i)'img & " ");
            end if;

         end if;
      end loop;

      DrawLine;

      Put_Line("Please choose a category to save the score:");

      if Player.human = true then
         Get(categoryID);
         skip_line;
      end if;



      if categoryID = 0 then
         WhereToSave(1) := 1;
         WhereToSave(2) := 0;
      else
         WhereToSave(1) := categoryID;
         WhereToSave(2) := TempTable(categoryID);
      end if;

      if Player.human = false then
         Put_Line("I choose category nr"&WhereToSave(1)'img & " which gives me"&WhereToSave(2)'img&" points.");
      end if;
      return WhereToSave;

   end CreateScoreTableBasedOnDices;







   Procedure Bot_Play(Dices : in DicesType) is
      --BestOption : Integer;
   begin
      null;
   end Bot_Play;



   -- Start the game
   Procedure Start(Players : in out PlayersArrayType; nRounds : in Positive) is
      Dices			: DicesType;
      Keep			: BooleanArrayType := (Others => False);
      Input 			: String(1..25);
      InputLength		: Integer;
      AllPositionsLock 		: Integer:=0;
      result			: SavingPoint := (Others => 0);
   Begin
      for g in 1..nRounds loop
         for h in Players'range loop

            --Reset the temporary arrays
            for i in 1..5 loop
               Keep(i):=False;
            end loop;


            --Print the round nr and players turn
            Put_Line("Round " & g'img & " of " & nRounds'img);
            if Players(h).Human = True then
               Put_Line("Player number "&h'Img&"'s turn. (HUMAN)");
            else
               Put_Line("Player number "&h'Img&"'s turn. (BOT)");
            end if;
            DrawLine;


            ------ Throw and replace the dices if needed. 3 times max.
            for i in 1..3 loop
               for f in 1..5 loop
                  if Keep(f)=False  then
                     Dices(f):=RandomDiceValue;
                  end if;
               end loop;

               -------- Print out the result of the five dices
               print_pretty(Dices);
               
               for j in Dices'range loop
                  if Keep(j) = False then
                     Put(" ");
                     Put(Dices(j),Width => 0);
                     Put(" ");
                  else
                     Put("(");
                     Put(Dices(j),Width => 0);
                     Put(")");
                  end if;
               end loop;

               --------- Ask which dices the player wants to keep
               New_Line;
               if i < 3 then
                  if Players(h).human = false then
                     for u in Keep'range loop
                     	if Dices(u)>3 then 
                        	Keep(u):=True;
                        else
                        	Keep(u):=False;
						end if;
                     end loop;
                  else
                     Get_Line(Input,InputLength);
					skip_line;
                     Keep := ConvertStringToBoolean(Input(1..InputLength));
                  end if;
               end if;


               ---------- Exit the loop if all positions are kept
               for j in Keep'range loop
                  if Keep(j) = True then
                     AllPositionsLock  := AllPositionsLock+1;
                  end if;
               end loop;
               if AllPositionsLock = 5 then exit; end if;
            end loop;



            DrawLine;
            Put("You got:");
            for j in Dices'range loop
               Put(Dices(j)'img & " ");
            end loop;
            New_Line;
            DrawLine;
            Put_Line("You can now choose where you want to save the score:");
            result := CreateScoreTableBasedOnDices(Dices,Players(h));
            SaveScore(Players,h,result(1),result(2));
            PrintEveryonesScores(Players);
         end loop;
      end loop;

      DecideWinner(Players);

   End start;

end Yatzy;

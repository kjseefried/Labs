With Yatzy; use Yatzy;
With Ada.Text_IO; use Ada.Text_IO;
With Ada.Integer_Text_IO; Use Ada.Integer_Text_IO;

Procedure Run_yatzy is

   nBots	: Integer := 10;
   nHumans	: Integer := 0;
   nRounds 	: Positive := 10;

begin
   DrawLine;
   Put_Line("Welcwome to Yatzy");
   DrawLine;
   Put_Line("More than 10 player will take longer time to finnish the game!!!");
   Put_Line("Enter the number of bot players: ");
   Get(nBots);
   Put_Line("Enter the number of human players: ");
   Get(nHumans);
   Put_Line("Enter the number of rounds: ");
   Get(nRounds);
   DrawLine;
	Skip_line;
   declare
      Players : PlayersArrayType(1..nHumans+nBots);
   begin
      for i in Players'range loop
         if i<=nHumans then
            Players(i).Human := True;
         else
            Players(i).Human := False;
         end if;
      end loop;

      Start(Players, nRounds);
   end;
   DrawLine;
   Get(nRounds);
end;

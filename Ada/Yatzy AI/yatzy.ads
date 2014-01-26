
Package Yatzy is
   Subtype Dice is Integer range 1..6;
   Type DicesType is array(1..5) of Dice;			--Used for calculating the result of an omgang
   Type ScoreTableType is array(1..17) of Integer;		--Result Table Type
   Type SavingPoint is array(1..2) of Integer;			--Which category and how many points to save
   Type BooleanArrayType is array(1..5) of Boolean;		--Array type with five boolean values
   Type PlayerType is record
      human 	: Boolean;
      score	: ScoreTableType :=(Others => 0);
   end record;
   Type PlayersArrayType is Array (Positive range <>) of PlayerType;

   Categories : array(1..17) of String(1..14) :=
     ("ONES          ",
      "TWOS          ",
      "THREES        ",
      "FOURS         ",
      "FIVES         ",
      "SIXES         ",
      "BONUS         ",
      "ONE PAIR      ",
      "TWO PAIRS     ",
      "3 OF A KIND   ",
      "4 OF A KIND   ",
      "SMALL STRAIGHT",
      "LARGE STRAIGHT",
      "HOUSE         ",
      "CHANCE        ",
      "YATZY         ",
      "TOTAL         "
   );



   Procedure DrawLine; 														--Draw a separator line used for graphics
   Function RandomDiceValue return Integer; 											--Return a random Integer between 1..6
   Function ConvertStringToBoolean(str:String) return BooleanArrayType;				--Convert user input to bool. Eg: "y n y n y" to {true,false,true,false,true}
   Function CreateScoreTableBasedOnDices(arr : in DicesType; Player: in PlayerType) return SavingPoint;
   Procedure Start(Players : in out PlayersArrayType; nRounds : in Positive);
   Procedure SaveScore(Players : in out PlayersArrayType; PlayerID:in Positive; CategoryID:in Integer; Points:in Integer);
   Procedure PrintEveryonesScores(Players : in PlayersArrayType);
   Procedure DecideWinner(Players : in PlayersArrayType);

end Yatzy;

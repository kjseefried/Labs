package dice is

subtype dice is integer range 1..6;
type dices is array(integer range <>) of dice;
   function roll return dice;
   function roll(someDices:dices) return dices;
   procedure print(someDices:dices);
   procedure print_pretty(someDices:dices);
   function exctract_full_house(someDices:dices) return dices;
   function exctract_pair(someDices:dices) return dices;

   function get_many(someDices:dices;n:integer) return dices;
   function number_of(someDices:dices;theDice:dice) return integer;

   function get_house(someDices:dices) return dices;

end;

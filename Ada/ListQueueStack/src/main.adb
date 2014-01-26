with Ada.Text_IO, Ada.Integer_Text_IO;

with LinkedListHandler;
with ToolBox;
with System.Address_Image;

procedure Main is
   List1 : LinkedListHandler.List;

   package QueueHandler is
      List : LinkedListHandler.List;
      RemoveLast : access procedure (List1: in out LinkedListHandler.List) := LinkedListHandler.RemoveLast'access;
      RemoveFirst : access procedure (List1: in out LinkedListHandler.List) := LinkedListHandler.RemoveFirst'access;
   end;


   procedure square (Value : in out Integer) is
   begin
      Value := Value ** 2;
   end square;


   procedure Menu is
      Input : Character := ' ';
   begin
      loop
         Ada.Text_IO.Put_Line("+-----------------+-----------------+------------------+");
         Ada.Text_IO.Put_Line("| Quit        ESC | RemoveLast    L | Print         CR |");
         Ada.Text_IO.Put_Line("| AddLast       I | RemoveFirst   F | PrintMemory    M |");
         Ada.Text_IO.Put_Line("| AddLast A..B  X | RemoveAt      R | Reduce         + |");
         Ada.Text_IO.Put_Line("| AddLast  Key  ? | RemoveAll     D | Reduce         * |");
         Ada.Text_IO.Put_Line("| AddFirst      O | ReplaceAll    A | Square         S |");
         Ada.Text_IO.Put_Line("+-----------------+-----------------+------------------+");
	 Ada.Text_IO.Get_Immediate (Input);
	 Ada.Text_IO.New_Line (100);
         case Input is
         when ASCII.ESC =>
            Ada.Text_IO.Put_Line ("[Quitting]");
            delay 0.4;
            exit;
         when 'I' | 'i' =>
            Ada.Text_IO.Put ("AddLast ");
            LinkedListHandler.Get (List1);
         when 'O' | 'o' =>
            Ada.Text_IO.Put ("AddFirst ");
	    LinkedListHandler.AddFirst(List1,Toolbox.Get);
	 when '0'|'1' | '2'| '3'| '4'| '5'| '6'| '7'| '8'| '9' =>
	    LinkedListHandler.AddLast(List1, ToolBox.ToInteger(Input));
	    Ada.Text_IO.Put_Line("Inserted "&Input);
         when ASCII.CR =>
            Ada.Text_IO.Put_Line ("[Print]");
            Ada.Text_IO.New_Line (1);
	    LinkedListHandler.Walk (List1, ToolBox.Print'Access);
         when 'S' | 's' =>
            Ada.Text_IO.Put_Line ("[Squared]");
            LinkedListHandler.Walk (List1, square'Access);
         when 'A' | 'a' =>
            Ada.Text_IO.Put_Line ("[ReplaceAll]");
            LinkedListHandler.Walk (List1, ToolBox.Get'Access);
         when 'L' | 'l' =>
            Ada.Text_IO.Put_Line ("[RemoveLast]");
            LinkedListHandler.RemoveLast (List1);
         when 'F' | 'f' =>
            Ada.Text_IO.Put_Line ("[RemoveFirst]");
            LinkedListHandler.RemoveFirst (List1);
         when 'R' | 'r' =>
            Ada.Text_IO.Put ("Remove ");
            LinkedListHandler.Remove (List1, ToolBox.Get);
         when 'M' | 'm' =>
            Ada.Text_IO.Put_Line ("[PrintMemory]");
            Ada.Text_IO.New_Line (1);
	    LinkedListHandler.PrintMemory (List1);
         when 'D' | 'd' =>
            Ada.Text_IO.Put_Line ("[RemoveAll]");
	    LinkedListHandler.RemoveAll (List1);
         when '+' =>
            Ada.Text_IO.Put_Line ("[Reduce +]");
	    LinkedListHandler.Reduce(List1,ToolBox.Addition'Access);
         when '*' =>
            Ada.Text_IO.Put_Line ("[Reduce *]");
            LinkedListHandler.Reduce(List1,ToolBox.Multiplication'Access);
         when 'X' | 'x' =>
            Ada.Text_IO.Put_Line ("Insert A..B");
            for i in ToolBox.Get .. ToolBox.Get loop
               LinkedListHandler.AddLast (List1, i);
            end loop;
         when others =>
            null;
	 end case;
	 Ada.Text_IO.New_Line (1);
      end loop;
   end Menu;

begin

   Menu;

end Main;

with Binarytree;
with ToolBox;
with Ada.Text_IO;
with Ada.Integer_Text_IO;

procedure Main is

   Tree0 : Binarytree.Tree;

   procedure Print(NodePtr0 : Binarytree.NodePtr) is
   begin
      Ada.Text_IO.Put(NodePtr0.Value'img & " ");
   end;


   procedure Menu is
      Input : Character := ' ';
   begin
      loop
         Ada.Text_IO.Put_Line ("+------Print----+-----Tools-----+");
         Ada.Text_IO.Put_Line ("| In-Order    z | Add         a |");
         Ada.Text_IO.Put_Line ("| Post-Order  x | Delete      d |");
         Ada.Text_IO.Put_Line ("| Pre-Order   c | Exist       e |");
         Ada.Text_IO.Put_Line ("| Depth       v | Balance     b |");
         Ada.Text_IO.Put_Line ("| Info        i | Nuke        r |");
         Ada.Text_IO.Put_Line ("|               |               |");
         Ada.Text_IO.Put_Line ("|               | Quit      ESC |");
         Ada.Text_IO.Put_Line ("+---------------+---------------+");
         Ada.Text_IO.Get_Immediate (Input);

         Ada.Text_IO.New_Line (100);
         case Input is
            when ASCII.ESC =>
               Ada.Text_IO.Put_Line ("[Quitting]");
               delay 0.4;
               exit;
            when '0' |'1' |'2' |'3' |'4' |'5' |'6' |'7' |'8' |'9' =>
               Ada.Text_IO.Put_Line ("Adding " & ToolBox.ToInteger (Input)'Img);
	       Binarytree.Add (Tree0, ToolBox.ToInteger (Input));
            when 'z' =>
               Ada.Text_IO.Put_Line ("[PreOrder]");
               Binarytree.PreOrder(Tree0,Print'Access);
            when 'x' =>
               Ada.Text_IO.Put_Line ("[InOrder]");
               Binarytree.InOrder(Tree0,Print'Access);
            when 'c' =>
               Ada.Text_IO.Put_Line ("[PostOrder]");
               Binarytree.PostOrder(Tree0,Print'Access);
            when 'b' =>
               Ada.Text_IO.Put_Line ("[Balancing]");
               Binarytree.Balance (Tree0);
               Ada.Text_IO.Put_Line("Current depth:" & Binarytree.Depth(Tree0)'img);
               Ada.Text_IO.Put_Line("Optimal depth:" & Binarytree.OptimalDepth(Tree0)'img);
            when 'i' =>
               Ada.Text_IO.Put_Line("Current depth:" & Binarytree.Depth(Tree0)'img);
               Ada.Text_IO.Put_Line("Optimal depth:" & Binarytree.OptimalDepth(Tree0)'img);
               Ada.Text_IO.Put_Line("Current Length:" & Tree0.Length'img);
            when 'e' =>
               Ada.Text_IO.Put("Exist?:");
               Ada.Text_IO.Put_Line(Binarytree.Exist(Tree0,Toolbox.Get)'img);
            when 'd' =>
               Ada.Text_IO.Put("DeleteNode: ");
               declare
                  i : integer:= Toolbox.Get;
               begin
                  if Binarytree.Exist(Tree0,i) = true then
                     Binarytree.Delete(Tree0,i);
                     Ada.Text_IO.Put(i'img & " was deletet.");
                  else
                     Ada.Text_IO.Put("Value does not exist");
                  end if;
               end;
            when 'a' =>
               Ada.Text_IO.Put_Line("How many to add?");
               for i in 1..toolbox.Get loop
                  Binarytree.Add(Tree0,i);
                  if i mod 10000 = 0 then
                     Binarytree.Balance(Tree0);
                     Ada.Text_IO.Put_Line (i'Img);
                  end if;
               end loop;
            when 'r' =>
               Ada.Text_IO.Put_Line("Booom!!! Your Tree is now nuked.");
               Binarytree.Empty(Tree0);
            when others =>
               null;
         end case;
         Ada.Text_IO.New_Line (2);
      end loop;
   end Menu;

begin
   Menu;
end Main;

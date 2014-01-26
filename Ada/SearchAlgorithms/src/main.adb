with Ada.Calendar; use Ada.Calendar;
with Ada.Text_IO, Ada.Integer_Text_IO;
with Ada.Numerics;
with Ada.Numerics.Discrete_Random;
with Binarytree;
with LinkedListHandler;
with RandomNumbers;

procedure Main is


   procedure Scenario( Number : Integer ) is


      package IntList is new LinkedListHandler(Integer);

      type durations is record
         seq, opt, tree, hash: Duration := Duration(0);
      end record;
      procedure Print(durations0 : durations) is
      begin
         Ada.Text_IO.Put_Line("Sequential: "&durations0.seq'Img&"us");
         Ada.Text_IO.Put_Line("Optimised:  "&durations0.opt'Img&"us");
         Ada.Text_IO.Put_Line("Tree:       "&durations0.tree'Img&"us");
         Ada.Text_IO.Put_Line("HashTable:  "&durations0.hash'Img&"us");
      end Print;


      u : Integer := 1000000;
      Target : Integer := 666; --The Value we will be looking for.

      type ArrayOfInteger is array (1..Number) of Integer;


      procedure ShuffleArrayOfInteger (List : in out ArrayOfInteger) is
         package Discrete_Random is new Ada.Numerics.Discrete_Random(Result_Subtype => Integer);
         K : Integer;
         G : Discrete_Random.Generator;
         T : Integer;
      begin
         Discrete_Random.Reset(G);
         for I in reverse List'Range loop
            K := (Discrete_Random.Random(G) mod I) + 1;
            T := List(I);
            List(I) := List(K);
            List(K) := T;
         end loop;
      end ShuffleArrayOfInteger;

      durations0 : durations;
      StartTime : Time;
      ArrayOfInteger0 : ArrayOfInteger; --The array that is being used.
      tree0 : Binarytree.Tree;
      list0 : IntList.List;
      type ArrayOfLinkedList is array(0..7) of IntList.List;
      ArrayOfLinkedList0 : ArrayOfLinkedList; --Chained hash


      procedure TestSeq(ArrayOfInteger0 : ArrayOfInteger) is
      begin
         for i in ArrayOfInteger0'range loop
            if ArrayOfInteger0(i) = Target then
               exit;
            end if;
         end loop;
      end TestSeq;



      procedure TestOpt(ArrayOfInteger0 : ArrayOfInteger) is
      begin
         for i in ArrayOfInteger0'range loop
            if ArrayOfInteger0(i) = Target then
               exit;
            end if;
         end loop;
      end TestOpt;



      procedure TestTree(Tree0 : Binarytree.Tree) is
         dummy : boolean;
      begin
         dummy := Binarytree.exist(Tree0,Target);
      end TestTree;



      procedure TestHash(ArrayOfLinkedList0 : ArrayOfLinkedList) is
         dummy : boolean;
      begin
         dummy := IntList.IsThere(ArrayOfLinkedList0(Target mod ArrayOfLinkedList0'Length),Target);
      end TestHash;



   begin

      Ada.Text_IO.Put_Line("Generate Random " & ArrayOfInteger0'First'img & " .. " &ArrayOfInteger0'Last'img);
      --Fill mother array
      for i in ArrayOfInteger0'range loop
         ArrayOfInteger0(i) := i;
      end loop;

      --shuffle
      ShuffleArrayOfInteger(ArrayOfInteger0);

      --Fill
      for i in ArrayOfInteger0'range loop
         Binarytree.add(Tree0,i);
         IntList.addLast(ArrayOfLinkedList0(i mod ArrayOfLinkedList0'Length),i); --Chained Hash
         if i mod 1000 = 0 then
            Binarytree.Balance(Tree0);
            --Ada.Text_IO.Put_Line("i = "&i'img);
         end if;
      end loop;


      for i in 1..100 loop
         Target := i;

         StartTime := Clock;
         TestSeq(ArrayOfInteger0);
         durations0.seq :=  durations0.seq + Duration ((Clock - StartTime) * u);

         StartTime := Clock;
         ArrayOfInteger0(ArrayOfInteger0'Last) := Target;
         TestOpt(ArrayOfInteger0);
         durations0.opt :=  durations0.opt + Duration ((Clock - StartTime) * u);

         StartTime := Clock;
         TestTree(Tree0);
         durations0.tree :=  durations0.tree + Duration ((Clock - StartTime) * u);

         StartTime := Clock;
         TestHash(ArrayOfLinkedList0);
         durations0.hash :=  durations0.hash + Duration ((Clock - StartTime) * u);

      end loop;

      durations0.hash := durations0.hash/100;
      durations0.opt := durations0.opt/100;
      durations0.seq := durations0.seq/100;
      durations0.tree := durations0.tree/100;
      Print(durations0);
      Ada.Text_IO.Put_Line("--------------------------------------------");

   end Scenario;

begin

   Scenario(1);
   Scenario(10);
   Scenario(100);
   Scenario(1000);
   Scenario(10000);
   Scenario(100000);
   Scenario(1000000);

end Main;

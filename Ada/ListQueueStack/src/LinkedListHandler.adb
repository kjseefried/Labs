with Ada.Integer_Text_IO;
with Ada.Text_IO;
with System;
with System.Address_Image;
with Ada.Unchecked_Deallocation;


package body LinkedListHandler is


   procedure AddLast(List1 : in out List; Value : in Integer) is
   begin
      if List1.Head = null then
         List1.Head   := new Node'(Value, null);
         List1.Tail   := List1.Head;
         List1.Length := 1;
      else
         --Add a new node after the tail.
         List1.Tail.Next := new Node'(Value, null);
         --And assign that node to the tail.
         List1.Tail      := List1.Tail.Next;
         List1.Length    := List1.Length + 1;
      end if;
   end AddLast;


   procedure PreAddFirst (List1 : in out List; Value : in Integer) is
      link_temp : Link;
   begin
      link_temp := new Node'(Value, null);
      link_temp.next := List1.Head;
      List1.Head := link_temp;
   end PreAddFirst;






   procedure Get (List1 : in out List) is
      Value : Integer;
   begin
      Ada.Integer_Text_IO.Get (Value);
      AddLast (List1, Value);
   end Get;

   ------------------------
   -- Walking Procedures --
   ------------------------
   procedure Walk
     (Link1    : not null Link;
      callback : access procedure (Value : in out Integer))
   is
   begin
      callback (Link1.Value);
      if Link1.Next /= null then
         Walk (Link1.Next, callback);
      end if;
   end Walk;

   procedure Walk
     (List1    : List;
      callback : access procedure (Value : in out Integer))
   is
   begin
      if List1.Head /= null then
         Walk (List1.Head, callback);
      end if;
   end Walk;

   procedure WalkAdv
     (Link1    : not null Link;
      callback : access procedure (Link1 : Link))
   is
   begin
      callback (Link1);
      if Link1.Next /= null then
         WalkAdv (Link1.Next, callback);
      end if;
   end WalkAdv;

   procedure WalkAdv
     (List1    : List;
      callback : access procedure (Link1 : Link))
   is
   begin
      if List1.Head /= null then
         WalkAdv (List1.Head, callback);
      end if;
   end WalkAdv;

   procedure Reduce
     (List1    : in out List;
      callback : access function (left, right : in Integer) return Integer)
   is
      sum : Integer;
      procedure Reducer (Value : in out Integer) is
      begin
         sum := callback (sum, Value);
      end Reducer;
   begin
      if List1.Head /= null then
         --The first value is already in the sum variable
         if List1.Head.Next /= null then
            sum := List1.Head.Value;
            Walk (List1.Head.Next, Reducer'Access);
            RemoveAll (List1);
            AddLast (List1, sum);
         end if;
      end if;
   end Reduce;

   -----------------
   -- Remove Section --
   -----------------
   procedure RemoveAll (List1 : in out List) is
   begin
      List1.Head   := null;
      List1.Tail   := null;
      List1.Length := 0;
   end RemoveAll;

   procedure RemoveFirst (List1 : in out List) is
      TheOldHead :Link := List1.Head;
   begin
      if List1.Head /= null then
         if List1.Head.Next = null then
            RemoveAll (List1);
         else
            List1.Length := List1.Length - 1;
            List1.Head   := List1.Head.Next;
            Free(TheOldHead);
         end if;
      end if;
   end RemoveFirst;

   procedure RemoveLast (List1 : in out List) is
      procedure Remover (Link1 : Link) is
      begin
	 if Link1.Next.Next = null then
	    Free(Link1.Next); --Remove the last.
	    Link1.Next := null; --Unlink the last
            List1.Tail := Link1; --Update the Tail.
         end if;
      end Remover;
   begin
      if List1.Head /= null then
         if List1.Head.Next = null then
            RemoveAll(List1);
         else
            WalkAdv(List1, Remover'Access);
         end if;
      end if;
   end RemoveLast;

   procedure Remove (List1 : in out List; Index : in Integer) is
      Counter : Integer := 1;
      procedure Remover (Link1 : Link) is
      begin
         Counter := Counter + 1;
         if Counter = Index then
            --Bypass the node beetween these 2.
            Link1.Next   := Link1.Next.Next;
            List1.Length := List1.Length - 1;
         end if;
      end Remover;
   begin
      if Index = 1 then
         RemoveFirst (List1);
      elsif Index = List1.Length then
         RemoveLast (List1);
      elsif Index < List1.Length then
         --The procedure Remover taking a advanced walk troughout the list.
         WalkAdv (List1, Remover'Access);
      end if;
   end Remove;




   function Exist (List0 : List; ValueToFind : Integer) return Boolean is
      function q(Link0 : Link) return Boolean is
      begin
         if Link0.Value = ValueToFind then
            return true;
         else
            if Link0.Next /= null then
               return q(Link0.Next);
            else
               return false;
            end if;
         end if;
      end q;
   begin
      return q(List0.Head);
   end Exist;

   ---------------------
   -- Useless Section --
   ---------------------
   procedure PrintMemory (List1 : List) is
      procedure MemoryPrinter (Link1 : Link) is
      begin
	 Ada.Text_IO.Put_Line(System.Address_Image (Link1.all'Address) & " => " & Link1.Value'Img);
      end MemoryPrinter;
   begin
      WalkAdv(List1, MemoryPrinter'Access);
   end PrintMemory;

end LinkedListHandler;

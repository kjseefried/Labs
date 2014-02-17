with Ada.Integer_Text_IO;
with Ada.Text_IO;
with System;
with System.Address_Image;
with Ada.Unchecked_Deallocation;


package body LinkedListHandler is




   procedure AddLast (List0 : in out List; Value : in ElementType) is
   begin
      if List0.Head = null then
         List0.Head   := new Node'(Value, null);
         List0.Tail   := List0.Head;
         List0.Length := 1;
      else
         List0.Tail.Next := new Node'(Value, null);
         List0.Tail      := List0.Tail.Next;
         List0.Length    := List0.Length + 1;
      end if;
   end AddLast;









   procedure Walk (List0 : List; Callback : access function (Integer0 : in ElementType) return boolean) is
      Temp : NodePtr := List0.Head;
   begin
      while Temp /= null loop
	 if Callback(Temp.Value) then
	    Temp := Temp.Next;
	 end if;
      end loop;
   end Walk;





   procedure Map (List0 : List; Callback : access function (Integer0 : in ElementType) return ElementType) is
      Temp : NodePtr := List0.Head;
   begin
      while Temp /= null loop
	 Temp.Value := Callback(Temp.Value);
	 Temp := Temp.Next;
      end loop;
   end Map;






   function IsEmpty (List0 : in List) return Boolean is
   begin
      return List0.Head = null;
   end IsEmpty;


   function IsThere (List0 : List; Needle : ElementType) return Boolean is
      Temp : NodePtr := List0.Head;
   begin
      while Temp /= null loop
	 if Temp.Value = Needle then
	    return True;
	 else
	    Temp := Temp.Next;
	 end if;
      end loop;
      return False;
   end IsThere;





   procedure RemoveAll(List0 : in out List) is
      Temp : NodePtr;
   begin

      List0.Length := 0;

      if IsEmpty(List0) then
         return;
      end if;

      while List0.Head /= null loop
         Temp := List0.Head;
         List0.Head := List0.Head.Next;
         Free(Temp);
      end loop;

      List0.Tail := null;
      Free(List0.Tail);
   end RemoveAll;







   procedure Remove(List0 : in out List; Value : in ElementType) is
      Current : NodePtr := List0.Head;
      Temp : NodePtr;
   begin

      if IsEmpty(List0) then
         return;
      end if;

      if List0.Head.Value = List0.Tail.Value then
         RemoveAll(List0);
         return;
      end if;

      if List0.Head.Value = Value then
	 List0.Length := List0.Length - 1;
         List0.Head := List0.Head.Next;
         Free(Current);
         return;
      end if;


      while Current.Next /= null loop
	 if Current.Next.Value = Value and List0.Tail.Value = Value then
	    List0.Length := List0.Length - 1;
            Current.Next := null;
            List0.Tail := Current;
            Free(Current.Next);
	 elsif Current.Next.Value = Value then
	    List0.Length := List0.Length - 1;
            Temp := Current.Next;
            Current.Next := Current.Next.Next;
            Free(Temp);
         else
            Current := Current.Next;
         end if;
      end loop;
   end Remove;




   procedure RemoveFirst(List0 : in out List) is
   begin
      if IsEmpty(List0) then
         return;
      end if;
      Remove(List0,List0.Head.Value);
   end;




   procedure RemoveLast(List0 : in out List) is
   begin
      if IsEmpty(List0) then
	 return;
      end if;
      Remove(List0,List0.Tail.Value);
   end;






end LinkedListHandler;

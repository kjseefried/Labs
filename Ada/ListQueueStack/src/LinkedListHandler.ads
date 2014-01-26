with Ada;
with Ada.Unchecked_Deallocation;
package LinkedListHandler is

   ----------------
   -- Structures --
   ----------------
   type Node;--TODO: Make this private
   type NodePtr is access all Node;

   type Node is record--TODO: Make this private
      Value : Integer := 0;
      Next  : Link := null;
   end record;

    type NodePtr is record
      Head, Tail : Link    := null;
      Length     : Integer := 0;
    end record;


   procedure Free is new Ada.Unchecked_Deallocation (Node, NodePtr);


   ------------------------
   -- Walking Procedures --
   ------------------------
   --TODO: use type Walker for callback type
   type Walker is access procedure (Value : in out Integer);
   --procedure Walk (Link1 : not null Link; callback : access procedure (Value : in out Integer));
   procedure Walk (List1 : List; callback : access procedure (Value : in out Integer));

   type WalkerAdv is access procedure (Link1 : in out Link);
   procedure WalkAdv (Link1 : not null Link; callback : access procedure (Link1 : Link));
   procedure WalkAdv (List1 : List; callback : access procedure (Link1 : Link));
   --TODO: Add more compatibility for like native procedures.
   --procedure Walk (List1 : List; callback : access procedure (Value : out Integer));
   procedure Reduce (List1 : in out List; callback : access function (left,right : in Integer) return Integer);


   -----------------
   -- Adding Area --
   -----------------
   procedure Get(List1 : in out List);
   procedure AddLast (List1 : in out List; Value : in Integer);



   -----------------
   -- Remove Area --
   -----------------
   procedure RemoveAll (List1:in out List);
   procedure RemoveFirst(List1: in out List);
   procedure RemoveLast (List1 : in out List);
   procedure Remove(List1 : in out List; Index: in Integer);


   ------------------
   -- Search methods-
   ------------------
   function Exist (List0 : List; ValueToFind : Integer) return Boolean;

   ------------------
   -- Useless Area --
   ------------------
   procedure PrintMemory(List1 : in List);

private


end LinkedListHandler;

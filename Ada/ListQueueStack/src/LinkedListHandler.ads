with Ada;
with Ada.Unchecked_Deallocation;


generic
   type ElementType is private;
package LinkedListHandler is

   type Node; --TODO: Make this private
   type NodePtr is access all Node;

   type Node is record --TODO: Make this private
      Value : ElementType;
      Next  : NodePtr := null;
   end record;

   type List is record
      Head, Tail : NodePtr    := null;
      Length     : Integer := 0;
   end record;

   procedure Free is new Ada.Unchecked_Deallocation (Node, NodePtr);

   procedure AddLast (List0 : in out List; Value : in ElementType);



   procedure Remove(List0 : in out List; Value : in ElementType);
   procedure RemoveAll(List0 : in out List);
   procedure RemoveLast(List0 : in out List);
   procedure RemoveFirst(List0 : in out List);

   procedure Walk (List0: in List; Callback : access function (Integer0 : in ElementType) return boolean);
   procedure Map (List0: in List; Callback : access function (Integer0 : in ElementType) return ElementType);


   function IsThere (List0 : in List; Needle : ElementType) return Boolean;
   function IsEmpty (List0 : in List) return Boolean;


private


end LinkedListHandler;

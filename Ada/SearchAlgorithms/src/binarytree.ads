with Unchecked_Deallocation;
package Binarytree is



   type Node;
   type NodePtr is access Node;
   type Node is record
      Value : Integer := 0;
      Right : NodePtr := null;
      Left  : NodePtr := null;
   end record;

   type Tree is record
      Root : NodePtr := null;
      Length : Integer := 0;
   end record;



   procedure Add (Tree0 : in out Tree; Value : in Integer);
   function Depth (Tree0 : Tree) return Integer;
   function OptimalDepth(Tree0 : Tree) return Integer;


   procedure InOrder(Tree0 : Tree; Callback: access procedure(NodePtr0 : NodePtr));
   procedure PreOrder(Tree0 : Tree; Callback: access procedure(NodePtr0 : NodePtr));
   procedure PostOrder(Tree0 : Tree; Callback: access procedure(NodePtr0 : NodePtr));


   procedure Balance (Tree0 : in out Tree);
   function Exist (Tree0: Tree; Value: Integer) return Boolean;

   procedure Delete(Tree0:in out Tree; Value : Integer);
   procedure Empty (Tree0 : in out Tree);

end Binarytree;

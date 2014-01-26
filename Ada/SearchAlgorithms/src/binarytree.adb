with Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Numerics.Elementary_Functions;
with Interfaces;

package body Binarytree is



   procedure PrintTree(Tree0:Tree) is
      use Interfaces;
      subtype Byte is Interfaces.Unsigned_8;
      type Nodes is array(Integer range <>) of NodePtr;

      TreeDepth : Integer := Depth(Tree0);

      function Handler(DepthFind : in Integer) return Nodes is

	 arr : Nodes(0..2**(DepthFind-1)-1);

	 procedure Recursvive (NodePtr0 : NodePtr; Byte0 : in Byte; Depth0 : in Integer) is
	    Byte1 : Byte := Byte0;
	    Depth1 : Integer := Depth0;
	 begin
	    if NodePtr0 /= null then
	       if Depth1 = DepthFind then
		  --Ada.Integer_Text_IO.Put(NodePtr0.Value,4);
		  arr(Integer(Byte0)) := NodePtr0;
	       end if;

	       --Ada.Text_IO.Put(NodePtr0.Value'Img &" => "& Unsigned_8'Image(Byte0));
	       --Ada.Text_IO.New_Line;
	       Byte1 := Interfaces.Shift_Left(Byte0,1);
	       Recursvive (NodePtr0.Left,Byte1,Depth1+1);
	       Recursvive (NodePtr0.Right,(Byte1+1),Depth1+1);
	    end if;
	 end Recursvive;

      begin

	 Recursvive(Tree0.Root,0,1);
	 return arr;

      end Handler;

   begin


      for k in 1..TreeDepth loop
	 declare
	    Nodes0 : Nodes := Handler(k);
	    --Margin : Integer := ((2**TreeDepth)*4) - ((2**k)*4)
	 begin
	    Ada.Text_IO.New_Line(1);
	    for i in 1..2**(TreeDepth-k) loop Ada.Text_IO.Put(" "); end loop;
	    for i in Nodes0'Range loop
	       if Nodes0(i) /= null then
		  Ada.Integer_Text_IO.Put(Nodes0(i).Value,2);
	       else
		  Ada.Text_IO.Put("  ");
	       end if;
	       for i in 1..2**(TreeDepth-k+1) loop Ada.Text_IO.Put(" "); end loop;
	    end loop;
	 end;
      end loop;

   end PrintTree;












   function Retrieve (Tree0: in Tree; Value: Integer) return NodePtr is
      function Retrieve(NodePtr0 : in NodePtr) return NodePtr is
      begin
	 if NodePtr0 = null then
	    return null;
	 elsif Value = NodePtr0.Value then
	    return NodePtr0;
	 elsif Value > NodePtr0.Value then
	    return Retrieve(NodePtr0.Right);
	 elsif Value < NodePtr0.Value then
	    return Retrieve(NodePtr0.Left);
	 end if;
	 return null;
      end Retrieve;
   begin
      return Retrieve(Tree0.Root);
   end Retrieve;

   function Exist (Tree0: Tree; Value: Integer) return Boolean is
   begin
      return Retrieve(Tree0,Value) /= null;
   end Exist;


   --Returns a copy of NodePtr currently. TODO: Returns a reference of NodePtr.
   function FindMax(NodePtr0 : in NodePtr) return NodePtr is
   begin
      if NodePtr0.Right = null then
	 return NodePtr0;
      else
	 return FindMax(NodePtr0.Right);
      end if;
   end FindMax;







   procedure DeleteRoot(NodePtr0: in out NodePtr) is
      --Odd procedure. Only good for one thing! Needs to be replaced by FindMax!
      procedure DeleteAndGetMax(NodePtr0: in out NodePtr; Max : out Integer) is
      begin
	 if NodePtr0.Right = null then
	    Max := NodePtr0.Value;
	    if NodePtr0.Left = null then
	       NodePtr0 := null;
	    else
	       NodePtr0 := NodePtr0.Left;
	    end if;
	 else
	    DeleteAndGetMax(NodePtr0.Right,Max);
	 end if;
      end DeleteAndGetMax;
   begin
      --If there is a leaf then just delete it.
      if NodePtr0.Left = null  and NodePtr0.Right = null then
	 NodePtr0 := null;
      elsif NodePtr0.Left = null then
	 NodePtr0 := NodePtr0.Right;
      elsif NodePtr0.Right = null then
	 NodePtr0 := NodePtr0.Left;
      else
	 --Ada.Text_IO.Put_Line ("-------DEBUG--------");
	 DeleteAndGetMax(NodePtr0.Left,NodePtr0.Value);
	 --Ada.Text_IO.Put_Line ("-------DEBUG--------");
      end if;
   end DeleteRoot;

   procedure Delete(Tree0:in out Tree; Value : Integer) is
      NodePtr0 : NodePtr := Retrieve(Tree0,Value);
   begin
      DeleteRoot(NodePtr0);
      Tree0.Length := Tree0.Length - 1;
   end Delete;



   procedure Add (Tree0 : in out Tree; Value : in Integer) is
      procedure Add (NodePtr0 : in out NodePtr) is
      begin
	 if NodePtr0 = null then
	    NodePtr0 := new Node'(Value, null, null);
	    Tree0.Length := Tree0.Length + 1;
	 elsif Value > NodePtr0.Value then
	    Add(NodePtr0.Right);
	 elsif Value < NodePtr0.Value then
	    Add(NodePtr0.Left);
	 end if;
      end Add;
   begin
      if Tree0.Root = null then
	 Tree0.Root   := new Node'(Value, null, null);
	 Tree0.Length := 1;
      else
	 Add (Tree0.Root);
      end if;
   end Add;

   function Depth (Tree0 : Tree) return Integer is
      function Depth (NodePtr0 : in NodePtr) return Integer is
	 L, R : Integer;
      begin
	 if NodePtr0 = null then
	    return 0;
	 end if;
	 L := Depth (NodePtr0.Left);
	 R := Depth (NodePtr0.Right);
	 if L > R then
	    return 1 + L;
	 else
	    return 1 + R;
	 end if;
      end Depth;
   begin
      return Depth (Tree0.Root);
   end Depth;



   procedure Delete(NodePtr0 : NodePtr) is
      NodePtr1 : NodePtr := NodePtr0;
      procedure Free is new Unchecked_Deallocation (Node, NodePtr);
   begin
      Free(NodePtr1);
   end;


   procedure Empty (Tree0 : in out Tree) is
   begin
      --Free2(Tree0.Root);
      PostOrder(Tree0,Delete'Access);
      Tree0.Root   := null; --Unlink
      Tree0.Length := 0;
   end Empty;

   -----------------
   -- OptimalDepth--
   -----------------
   function OptimalDepth (Tree0 : Tree) return Integer is begin
      --UDATE +Float'Ceiling. Tree with 9 nodes should have 4 in depth. Was 3 before.
      return Integer (Float'Ceiling(Ada.Numerics.Elementary_Functions.Log (float (Tree0.Length + 1), 2.0)));
   end OptimalDepth;


   -----------------
   -- Pre,In,Post --
   -----------------
   procedure PreOrder
     (Tree0 : Tree; Callback: access procedure(NodePtr0 : NodePtr))
   is
      procedure PreOrder (NodePtr0 : NodePtr) is
      begin
	 if NodePtr0 /= null then
	    Callback (NodePtr0);
	    PreOrder (NodePtr0.Left);
	    PreOrder (NodePtr0.Right);
	 end if;
      end PreOrder;
   begin
      PreOrder (Tree0.Root);
   end PreOrder;




   procedure InOrder
     (Tree0 : Tree; Callback: access procedure(NodePtr0 : NodePtr))
   is
      procedure InOrder (NodePtr0 : NodePtr) is
      begin
	 if NodePtr0 /= null then
	    InOrder (NodePtr0.Left);
	    Callback (NodePtr0);
	    InOrder (NodePtr0.Right);
	 end if;
      end InOrder;
   begin
      InOrder (Tree0.Root);
   end InOrder;

   procedure PostOrder
     (Tree0 : Tree; Callback: access procedure(NodePtr0 : NodePtr))
   is
      procedure PostOrder (NodePtr0 : NodePtr) is
      begin
	 if NodePtr0 /= null then
	    PostOrder (NodePtr0.Left);
	    PostOrder (NodePtr0.Right);
	    Callback (NodePtr0);
	 end if;
      end PostOrder;
   begin
      PostOrder (Tree0.Root);
   end PostOrder;









   --Not fully complete yet.
   procedure Balance (Tree0 : in out Tree) is
      type Nodes is array (Positive range <>) of Integer;
      Nodes0 : Nodes (1 .. Tree0.Length);
      index : Integer := 1;

      procedure ToArray (NodePtr0 : NodePtr) is
      begin
	 if NodePtr0 /= null then
	    ToArray (NodePtr0.Left);
	    Nodes0 (index) := NodePtr0.Value;
	    index         := index + 1;
	    ToArray (NodePtr0.Right);
	 end if;
      end ToArray;

      procedure BuildTreeFromArray (Nodes0 : in out Nodes) is
	 midpoint    : Integer := (Nodes0'First + Nodes0'Last) / 2;
      begin
	 if Nodes0'Length > 2  then
	    Add (Tree0, Nodes0 (midpoint));
	    BuildTreeFromArray ( Nodes0(Nodes0'First..midpoint-1) );
	    BuildTreeFromArray ( Nodes0(midpoint+1..Nodes0'Last) );
	 elsif Nodes0'Length = 2 then
	    Add (Tree0, Nodes0(Nodes0'First));
	    Add (Tree0, Nodes0(Nodes0'Last));
	 else
	    Add (Tree0, Nodes0(Nodes0'First));
	 end if;

      end BuildTreeFromArray;

   begin
      ToArray (Tree0.Root);
      Empty (Tree0);
      BuildTreeFromArray(Nodes0);
   end Balance;

end Binarytree;

generic
   type ElementType is private;
package StorageInterface is
   type Object is interface;

   function IsThere(Self : in Object; Needle : in ElementType) return Boolean is abstract;
   function IsEmpty(Self : in Object) return Boolean is abstract;
   procedure AddLast (Self : out Object; Value : in ElementType) is abstract;

   procedure Remove(Object0 : in out Object; Value : in ElementType)  is abstract;
   procedure RemoveAll(Object0 : in out Object) is abstract;
   procedure RemoveLast(Object0 : in out Object) is abstract ;
   procedure RemoveFirst(Object0 : in out Object) is abstract;

   procedure Walk (Object0: in Object; Callback : access function (Integer0 : in ElementType) return boolean)  is abstract;
   procedure Map (Object0: in Object; Callback : access function (Integer0 : in ElementType) return ElementType) is abstract;

   type Instance is abstract new Object with record
      Length : Integer := 0;
   end record;


end StorageInterface;

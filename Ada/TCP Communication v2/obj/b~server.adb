pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~server.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~server.adb");

with System.Restrictions;
with Ada.Exceptions;

package body ada_main is
   pragma Warnings (Off);

   E088 : Short_Integer; pragma Import (Ada, E088, "system__os_lib_E");
   E017 : Short_Integer; pragma Import (Ada, E017, "system__soft_links_E");
   E027 : Short_Integer; pragma Import (Ada, E027, "system__exception_table_E");
   E172 : Short_Integer; pragma Import (Ada, E172, "ada__containers_E");
   E079 : Short_Integer; pragma Import (Ada, E079, "ada__io_exceptions_E");
   E010 : Short_Integer; pragma Import (Ada, E010, "ada__tags_E");
   E007 : Short_Integer; pragma Import (Ada, E007, "ada__streams_E");
   E081 : Short_Integer; pragma Import (Ada, E081, "interfaces__c_E");
   E083 : Short_Integer; pragma Import (Ada, E083, "interfaces__c__strings_E");
   E033 : Short_Integer; pragma Import (Ada, E033, "system__exceptions_E");
   E078 : Short_Integer; pragma Import (Ada, E078, "system__finalization_root_E");
   E076 : Short_Integer; pragma Import (Ada, E076, "ada__finalization_E");
   E101 : Short_Integer; pragma Import (Ada, E101, "system__storage_pools_E");
   E093 : Short_Integer; pragma Import (Ada, E093, "system__finalization_masters_E");
   E107 : Short_Integer; pragma Import (Ada, E107, "system__storage_pools__subpools_E");
   E184 : Short_Integer; pragma Import (Ada, E184, "ada__calendar_E");
   E182 : Short_Integer; pragma Import (Ada, E182, "ada__calendar__delays_E");
   E103 : Short_Integer; pragma Import (Ada, E103, "system__pool_global_E");
   E091 : Short_Integer; pragma Import (Ada, E091, "system__file_control_block_E");
   E067 : Short_Integer; pragma Import (Ada, E067, "ada__streams__stream_io_E");
   E074 : Short_Integer; pragma Import (Ada, E074, "system__file_io_E");
   E177 : Short_Integer; pragma Import (Ada, E177, "gnat__sockets_E");
   E192 : Short_Integer; pragma Import (Ada, E192, "system__pool_size_E");
   E021 : Short_Integer; pragma Import (Ada, E021, "system__secondary_stack_E");
   E190 : Short_Integer; pragma Import (Ada, E190, "gnat__sockets__thin_common_E");
   E180 : Short_Integer; pragma Import (Ada, E180, "gnat__sockets__thin_E");
   E065 : Short_Integer; pragma Import (Ada, E065, "system__strings__stream_ops_E");
   E147 : Short_Integer; pragma Import (Ada, E147, "system__tasking__initialization_E");
   E153 : Short_Integer; pragma Import (Ada, E153, "system__tasking__protected_objects_E");
   E169 : Short_Integer; pragma Import (Ada, E169, "ada__real_time_E");
   E174 : Short_Integer; pragma Import (Ada, E174, "ada__text_io_E");
   E157 : Short_Integer; pragma Import (Ada, E157, "system__tasking__protected_objects__entries_E");
   E161 : Short_Integer; pragma Import (Ada, E161, "system__tasking__queuing_E");
   E167 : Short_Integer; pragma Import (Ada, E167, "system__tasking__stages_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "tcp__server_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E006 := E006 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "tcp__server__finalize_spec");
      begin
         F1;
      end;
      E157 := E157 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "system__tasking__protected_objects__entries__finalize_spec");
      begin
         F2;
      end;
      E174 := E174 - 1;
      declare
         procedure F3;
         pragma Import (Ada, F3, "ada__text_io__finalize_spec");
      begin
         F3;
      end;
      declare
         procedure F4;
         pragma Import (Ada, F4, "gnat__sockets__finalize_body");
      begin
         E177 := E177 - 1;
         F4;
      end;
      E093 := E093 - 1;
      E107 := E107 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "system__file_io__finalize_body");
      begin
         E074 := E074 - 1;
         F5;
      end;
      E192 := E192 - 1;
      declare
         procedure F6;
         pragma Import (Ada, F6, "system__pool_size__finalize_spec");
      begin
         F6;
      end;
      declare
         procedure F7;
         pragma Import (Ada, F7, "gnat__sockets__finalize_spec");
      begin
         F7;
      end;
      E067 := E067 - 1;
      declare
         procedure F8;
         pragma Import (Ada, F8, "ada__streams__stream_io__finalize_spec");
      begin
         F8;
      end;
      declare
         procedure F9;
         pragma Import (Ada, F9, "system__file_control_block__finalize_spec");
      begin
         E091 := E091 - 1;
         F9;
      end;
      E103 := E103 - 1;
      declare
         procedure F10;
         pragma Import (Ada, F10, "system__pool_global__finalize_spec");
      begin
         F10;
      end;
      declare
         procedure F11;
         pragma Import (Ada, F11, "system__storage_pools__subpools__finalize_spec");
      begin
         F11;
      end;
      declare
         procedure F12;
         pragma Import (Ada, F12, "system__finalization_masters__finalize_spec");
      begin
         F12;
      end;
      declare
         procedure Reraise_Library_Exception_If_Any;
            pragma Import (Ada, Reraise_Library_Exception_If_Any, "__gnat_reraise_library_exception_if_any");
      begin
         Reraise_Library_Exception_If_Any;
      end;
   end finalize_library;

   procedure adafinal is
      procedure s_stalib_adafinal;
      pragma Import (C, s_stalib_adafinal, "system__standard_library__adafinal");
   begin
      if not Is_Elaborated then
         return;
      end if;
      Is_Elaborated := False;
      s_stalib_adafinal;
   end adafinal;

   type No_Param_Proc is access procedure;

   procedure adainit is
      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Main_CPU : Integer;
      pragma Import (C, Main_CPU, "__gl_main_cpu");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");

      procedure Install_Handler;
      pragma Import (C, Install_Handler, "__gnat_install_handler");

      Handler_Installed : Integer;
      pragma Import (C, Handler_Installed, "__gnat_handler_installed");

      Finalize_Library_Objects : No_Param_Proc;
      pragma Import (C, Finalize_Library_Objects, "__gnat_finalize_library_objects");
   begin
      if Is_Elaborated then
         return;
      end if;
      Is_Elaborated := True;
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      System.Restrictions.Run_Time_Restrictions :=
        (Set =>
          (False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, True, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False),
         Value => (0, 0, 0, 0, 0, 0, 0, 0, 0, 0),
         Violated =>
          (False, False, False, True, True, False, False, False, 
           False, False, True, True, True, True, False, False, 
           True, False, False, True, True, False, True, True, 
           True, True, True, True, False, False, True, False, 
           True, False, False, True, False, False, True, False, 
           True, False, True, False, False, False, True, False, 
           True, False, False, True, False, True, False, True, 
           True, True, False, False, True, False, False, True, 
           False, True, True, False, True, True, True, False, 
           True, False, False, False, False, False, True, True, 
           False, False, False),
         Count => (0, 0, 0, 0, 0, 3, 1, 0, 0, 0),
         Unknown => (False, False, False, False, False, False, True, False, False, False));
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      if Handler_Installed = 0 then
         Install_Handler;
      end if;

      Finalize_Library_Objects := finalize_library'access;

      System.Soft_Links'Elab_Spec;
      System.Exception_Table'Elab_Body;
      E027 := E027 + 1;
      Ada.Containers'Elab_Spec;
      E172 := E172 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E079 := E079 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Streams'Elab_Spec;
      E007 := E007 + 1;
      Interfaces.C'Elab_Spec;
      Interfaces.C.Strings'Elab_Spec;
      System.Exceptions'Elab_Spec;
      E033 := E033 + 1;
      System.Finalization_Root'Elab_Spec;
      E078 := E078 + 1;
      Ada.Finalization'Elab_Spec;
      E076 := E076 + 1;
      System.Storage_Pools'Elab_Spec;
      E101 := E101 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Storage_Pools.Subpools'Elab_Spec;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E184 := E184 + 1;
      Ada.Calendar.Delays'Elab_Body;
      E182 := E182 + 1;
      System.Pool_Global'Elab_Spec;
      E103 := E103 + 1;
      System.File_Control_Block'Elab_Spec;
      E091 := E091 + 1;
      Ada.Streams.Stream_Io'Elab_Spec;
      E067 := E067 + 1;
      Gnat.Sockets'Elab_Spec;
      System.Pool_Size'Elab_Spec;
      E192 := E192 + 1;
      System.File_Io'Elab_Body;
      E074 := E074 + 1;
      E107 := E107 + 1;
      System.Finalization_Masters'Elab_Body;
      E093 := E093 + 1;
      E083 := E083 + 1;
      E081 := E081 + 1;
      Ada.Tags'Elab_Body;
      E010 := E010 + 1;
      System.Soft_Links'Elab_Body;
      E017 := E017 + 1;
      System.Os_Lib'Elab_Body;
      E088 := E088 + 1;
      System.Secondary_Stack'Elab_Body;
      E021 := E021 + 1;
      Gnat.Sockets.Thin_Common'Elab_Spec;
      E190 := E190 + 1;
      Gnat.Sockets.Thin'Elab_Body;
      E180 := E180 + 1;
      Gnat.Sockets'Elab_Body;
      E177 := E177 + 1;
      System.Strings.Stream_Ops'Elab_Body;
      E065 := E065 + 1;
      System.Tasking.Initialization'Elab_Body;
      E147 := E147 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E153 := E153 + 1;
      Ada.Real_Time'Elab_Spec;
      Ada.Real_Time'Elab_Body;
      E169 := E169 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E174 := E174 + 1;
      System.Tasking.Protected_Objects.Entries'Elab_Spec;
      E157 := E157 + 1;
      System.Tasking.Queuing'Elab_Body;
      E161 := E161 + 1;
      System.Tasking.Stages'Elab_Body;
      E167 := E167 + 1;
      TCP.SERVER'ELAB_SPEC;
      TCP.SERVER'ELAB_BODY;
      E006 := E006 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_server");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure Initialize (Addr : System.Address);
      pragma Import (C, Initialize, "__gnat_initialize");

      procedure Finalize;
      pragma Import (C, Finalize, "__gnat_finalize");
      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Ada_Main_Program;
      adafinal;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   /Users/Alex/Documents/Git/Labs/Ada/TCP server/obj/tcp.o
   --   /Users/Alex/Documents/Git/Labs/Ada/TCP server/obj/tcp-server.o
   --   /Users/Alex/Documents/Git/Labs/Ada/TCP server/obj/server.o
   --   -L/Users/Alex/Documents/Git/Labs/Ada/TCP server/obj/
   --   -L/Users/Alex/Documents/Git/Labs/Ada/TCP server/obj/
   --   -L/usr/local/gnat/lib/gcc/x86_64-apple-darwin12.2.0/4.7.4/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;

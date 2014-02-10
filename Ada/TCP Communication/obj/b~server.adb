pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~server.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~server.adb");

with System.Restrictions;
with Ada.Exceptions;

package body ada_main is
   pragma Warnings (Off);

   E116 : Short_Integer; pragma Import (Ada, E116, "system__os_lib_E");
   E014 : Short_Integer; pragma Import (Ada, E014, "system__soft_links_E");
   E008 : Short_Integer; pragma Import (Ada, E008, "system__exception_table_E");
   E005 : Short_Integer; pragma Import (Ada, E005, "ada__containers_E");
   E060 : Short_Integer; pragma Import (Ada, E060, "ada__io_exceptions_E");
   E050 : Short_Integer; pragma Import (Ada, E050, "ada__tags_E");
   E048 : Short_Integer; pragma Import (Ada, E048, "ada__streams_E");
   E071 : Short_Integer; pragma Import (Ada, E071, "interfaces__c_E");
   E113 : Short_Integer; pragma Import (Ada, E113, "interfaces__c__strings_E");
   E026 : Short_Integer; pragma Import (Ada, E026, "system__exceptions_E");
   E059 : Short_Integer; pragma Import (Ada, E059, "system__finalization_root_E");
   E047 : Short_Integer; pragma Import (Ada, E047, "ada__finalization_E");
   E127 : Short_Integer; pragma Import (Ada, E127, "system__storage_pools_E");
   E121 : Short_Integer; pragma Import (Ada, E121, "system__finalization_masters_E");
   E133 : Short_Integer; pragma Import (Ada, E133, "system__storage_pools__subpools_E");
   E145 : Short_Integer; pragma Import (Ada, E145, "ada__calendar_E");
   E143 : Short_Integer; pragma Import (Ada, E143, "ada__calendar__delays_E");
   E129 : Short_Integer; pragma Import (Ada, E129, "system__pool_global_E");
   E119 : Short_Integer; pragma Import (Ada, E119, "system__file_control_block_E");
   E167 : Short_Integer; pragma Import (Ada, E167, "ada__streams__stream_io_E");
   E111 : Short_Integer; pragma Import (Ada, E111, "system__file_io_E");
   E138 : Short_Integer; pragma Import (Ada, E138, "gnat__sockets_E");
   E157 : Short_Integer; pragma Import (Ada, E157, "system__pool_size_E");
   E018 : Short_Integer; pragma Import (Ada, E018, "system__secondary_stack_E");
   E153 : Short_Integer; pragma Import (Ada, E153, "gnat__sockets__thin_common_E");
   E141 : Short_Integer; pragma Import (Ada, E141, "gnat__sockets__thin_E");
   E165 : Short_Integer; pragma Import (Ada, E165, "system__strings__stream_ops_E");
   E173 : Short_Integer; pragma Import (Ada, E173, "system__tasking__initialization_E");
   E181 : Short_Integer; pragma Import (Ada, E181, "system__tasking__protected_objects_E");
   E062 : Short_Integer; pragma Import (Ada, E062, "ada__real_time_E");
   E107 : Short_Integer; pragma Import (Ada, E107, "ada__text_io_E");
   E183 : Short_Integer; pragma Import (Ada, E183, "system__tasking__protected_objects__entries_E");
   E179 : Short_Integer; pragma Import (Ada, E179, "system__tasking__queuing_E");
   E169 : Short_Integer; pragma Import (Ada, E169, "system__tasking__stages_E");
   E196 : Short_Integer; pragma Import (Ada, E196, "tcp__server_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E183 := E183 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "system__tasking__protected_objects__entries__finalize_spec");
      begin
         F1;
      end;
      E107 := E107 - 1;
      declare
         procedure F2;
         pragma Import (Ada, F2, "ada__text_io__finalize_spec");
      begin
         F2;
      end;
      declare
         procedure F3;
         pragma Import (Ada, F3, "gnat__sockets__finalize_body");
      begin
         E138 := E138 - 1;
         F3;
      end;
      E121 := E121 - 1;
      E133 := E133 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "system__file_io__finalize_body");
      begin
         E111 := E111 - 1;
         F4;
      end;
      E157 := E157 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "system__pool_size__finalize_spec");
      begin
         F5;
      end;
      declare
         procedure F6;
         pragma Import (Ada, F6, "gnat__sockets__finalize_spec");
      begin
         F6;
      end;
      E167 := E167 - 1;
      declare
         procedure F7;
         pragma Import (Ada, F7, "ada__streams__stream_io__finalize_spec");
      begin
         F7;
      end;
      declare
         procedure F8;
         pragma Import (Ada, F8, "system__file_control_block__finalize_spec");
      begin
         E119 := E119 - 1;
         F8;
      end;
      E129 := E129 - 1;
      declare
         procedure F9;
         pragma Import (Ada, F9, "system__pool_global__finalize_spec");
      begin
         F9;
      end;
      declare
         procedure F10;
         pragma Import (Ada, F10, "system__storage_pools__subpools__finalize_spec");
      begin
         F10;
      end;
      declare
         procedure F11;
         pragma Import (Ada, F11, "system__finalization_masters__finalize_spec");
      begin
         F11;
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
           True, False, False, False, False, False, False, True, 
           False, False, False),
         Count => (0, 0, 0, 0, 0, 0, 1, 0, 0, 0),
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
      E008 := E008 + 1;
      Ada.Containers'Elab_Spec;
      E005 := E005 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E060 := E060 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Streams'Elab_Spec;
      E048 := E048 + 1;
      Interfaces.C'Elab_Spec;
      Interfaces.C.Strings'Elab_Spec;
      System.Exceptions'Elab_Spec;
      E026 := E026 + 1;
      System.Finalization_Root'Elab_Spec;
      E059 := E059 + 1;
      Ada.Finalization'Elab_Spec;
      E047 := E047 + 1;
      System.Storage_Pools'Elab_Spec;
      E127 := E127 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Storage_Pools.Subpools'Elab_Spec;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E145 := E145 + 1;
      Ada.Calendar.Delays'Elab_Body;
      E143 := E143 + 1;
      System.Pool_Global'Elab_Spec;
      E129 := E129 + 1;
      System.File_Control_Block'Elab_Spec;
      E119 := E119 + 1;
      Ada.Streams.Stream_Io'Elab_Spec;
      E167 := E167 + 1;
      Gnat.Sockets'Elab_Spec;
      System.Pool_Size'Elab_Spec;
      E157 := E157 + 1;
      System.File_Io'Elab_Body;
      E111 := E111 + 1;
      E133 := E133 + 1;
      System.Finalization_Masters'Elab_Body;
      E121 := E121 + 1;
      E113 := E113 + 1;
      E071 := E071 + 1;
      Ada.Tags'Elab_Body;
      E050 := E050 + 1;
      System.Soft_Links'Elab_Body;
      E014 := E014 + 1;
      System.Os_Lib'Elab_Body;
      E116 := E116 + 1;
      System.Secondary_Stack'Elab_Body;
      E018 := E018 + 1;
      Gnat.Sockets.Thin_Common'Elab_Spec;
      E153 := E153 + 1;
      Gnat.Sockets.Thin'Elab_Body;
      E141 := E141 + 1;
      Gnat.Sockets'Elab_Body;
      E138 := E138 + 1;
      System.Strings.Stream_Ops'Elab_Body;
      E165 := E165 + 1;
      System.Tasking.Initialization'Elab_Body;
      E173 := E173 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E181 := E181 + 1;
      Ada.Real_Time'Elab_Spec;
      Ada.Real_Time'Elab_Body;
      E062 := E062 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E107 := E107 + 1;
      System.Tasking.Protected_Objects.Entries'Elab_Spec;
      E183 := E183 + 1;
      System.Tasking.Queuing'Elab_Body;
      E179 := E179 + 1;
      System.Tasking.Stages'Elab_Body;
      E169 := E169 + 1;
      E196 := E196 + 1;
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
   --   /Users/Alex/Documents/Git/Labs/Ada/TCP Communication/obj/tcp.o
   --   /Users/Alex/Documents/Git/Labs/Ada/TCP Communication/obj/tcp-server.o
   --   /Users/Alex/Documents/Git/Labs/Ada/TCP Communication/obj/server.o
   --   -L/Users/Alex/Documents/Git/Labs/Ada/TCP Communication/obj/
   --   -L/Users/Alex/Documents/Git/Labs/Ada/TCP Communication/obj/
   --   -L/usr/local/gnat/lib/gcc/x86_64-apple-darwin12.2.0/4.7.4/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;

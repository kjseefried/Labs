pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~client.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~client.adb");

with System.Restrictions;
with Ada.Exceptions;

package body ada_main is
   pragma Warnings (Off);

   E121 : Short_Integer; pragma Import (Ada, E121, "system__os_lib_E");
   E013 : Short_Integer; pragma Import (Ada, E013, "system__soft_links_E");
   E023 : Short_Integer; pragma Import (Ada, E023, "system__exception_table_E");
   E055 : Short_Integer; pragma Import (Ada, E055, "ada__io_exceptions_E");
   E100 : Short_Integer; pragma Import (Ada, E100, "ada__tags_E");
   E098 : Short_Integer; pragma Import (Ada, E098, "ada__streams_E");
   E048 : Short_Integer; pragma Import (Ada, E048, "interfaces__c_E");
   E118 : Short_Integer; pragma Import (Ada, E118, "interfaces__c__strings_E");
   E029 : Short_Integer; pragma Import (Ada, E029, "system__exceptions_E");
   E116 : Short_Integer; pragma Import (Ada, E116, "system__finalization_root_E");
   E114 : Short_Integer; pragma Import (Ada, E114, "ada__finalization_E");
   E132 : Short_Integer; pragma Import (Ada, E132, "system__storage_pools_E");
   E126 : Short_Integer; pragma Import (Ada, E126, "system__finalization_masters_E");
   E138 : Short_Integer; pragma Import (Ada, E138, "system__storage_pools__subpools_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "ada__calendar_E");
   E052 : Short_Integer; pragma Import (Ada, E052, "ada__calendar__delays_E");
   E134 : Short_Integer; pragma Import (Ada, E134, "system__pool_global_E");
   E124 : Short_Integer; pragma Import (Ada, E124, "system__file_control_block_E");
   E164 : Short_Integer; pragma Import (Ada, E164, "ada__streams__stream_io_E");
   E112 : Short_Integer; pragma Import (Ada, E112, "system__file_io_E");
   E143 : Short_Integer; pragma Import (Ada, E143, "gnat__sockets_E");
   E156 : Short_Integer; pragma Import (Ada, E156, "system__pool_size_E");
   E017 : Short_Integer; pragma Import (Ada, E017, "system__secondary_stack_E");
   E152 : Short_Integer; pragma Import (Ada, E152, "gnat__sockets__thin_common_E");
   E146 : Short_Integer; pragma Import (Ada, E146, "gnat__sockets__thin_E");
   E162 : Short_Integer; pragma Import (Ada, E162, "system__strings__stream_ops_E");
   E172 : Short_Integer; pragma Import (Ada, E172, "system__tasking__initialization_E");
   E180 : Short_Integer; pragma Import (Ada, E180, "system__tasking__protected_objects_E");
   E057 : Short_Integer; pragma Import (Ada, E057, "ada__real_time_E");
   E108 : Short_Integer; pragma Import (Ada, E108, "ada__text_io_E");
   E182 : Short_Integer; pragma Import (Ada, E182, "system__tasking__protected_objects__entries_E");
   E178 : Short_Integer; pragma Import (Ada, E178, "system__tasking__queuing_E");
   E168 : Short_Integer; pragma Import (Ada, E168, "system__tasking__stages_E");
   E195 : Short_Integer; pragma Import (Ada, E195, "tcp__client_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E182 := E182 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "system__tasking__protected_objects__entries__finalize_spec");
      begin
         F1;
      end;
      E108 := E108 - 1;
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
         E143 := E143 - 1;
         F3;
      end;
      E126 := E126 - 1;
      E138 := E138 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "system__file_io__finalize_body");
      begin
         E112 := E112 - 1;
         F4;
      end;
      E156 := E156 - 1;
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
      E164 := E164 - 1;
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
         E124 := E124 - 1;
         F8;
      end;
      E134 := E134 - 1;
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
          (False, False, False, True, True, False, False, True, 
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
      E023 := E023 + 1;
      Ada.Io_Exceptions'Elab_Spec;
      E055 := E055 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Streams'Elab_Spec;
      E098 := E098 + 1;
      Interfaces.C'Elab_Spec;
      Interfaces.C.Strings'Elab_Spec;
      System.Exceptions'Elab_Spec;
      E029 := E029 + 1;
      System.Finalization_Root'Elab_Spec;
      E116 := E116 + 1;
      Ada.Finalization'Elab_Spec;
      E114 := E114 + 1;
      System.Storage_Pools'Elab_Spec;
      E132 := E132 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Storage_Pools.Subpools'Elab_Spec;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E006 := E006 + 1;
      Ada.Calendar.Delays'Elab_Body;
      E052 := E052 + 1;
      System.Pool_Global'Elab_Spec;
      E134 := E134 + 1;
      System.File_Control_Block'Elab_Spec;
      E124 := E124 + 1;
      Ada.Streams.Stream_Io'Elab_Spec;
      E164 := E164 + 1;
      Gnat.Sockets'Elab_Spec;
      System.Pool_Size'Elab_Spec;
      E156 := E156 + 1;
      System.File_Io'Elab_Body;
      E112 := E112 + 1;
      E138 := E138 + 1;
      System.Finalization_Masters'Elab_Body;
      E126 := E126 + 1;
      E118 := E118 + 1;
      E048 := E048 + 1;
      Ada.Tags'Elab_Body;
      E100 := E100 + 1;
      System.Soft_Links'Elab_Body;
      E013 := E013 + 1;
      System.Os_Lib'Elab_Body;
      E121 := E121 + 1;
      System.Secondary_Stack'Elab_Body;
      E017 := E017 + 1;
      Gnat.Sockets.Thin_Common'Elab_Spec;
      E152 := E152 + 1;
      Gnat.Sockets.Thin'Elab_Body;
      E146 := E146 + 1;
      Gnat.Sockets'Elab_Body;
      E143 := E143 + 1;
      System.Strings.Stream_Ops'Elab_Body;
      E162 := E162 + 1;
      System.Tasking.Initialization'Elab_Body;
      E172 := E172 + 1;
      System.Tasking.Protected_Objects'Elab_Body;
      E180 := E180 + 1;
      Ada.Real_Time'Elab_Spec;
      Ada.Real_Time'Elab_Body;
      E057 := E057 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E108 := E108 + 1;
      System.Tasking.Protected_Objects.Entries'Elab_Spec;
      E182 := E182 + 1;
      System.Tasking.Queuing'Elab_Body;
      E178 := E178 + 1;
      System.Tasking.Stages'Elab_Body;
      E168 := E168 + 1;
      E195 := E195 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_client");

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
   --   /Users/Alex/Desktop/Server/obj/tcp.o
   --   /Users/Alex/Desktop/Server/obj/tcp-client.o
   --   /Users/Alex/Desktop/Server/obj/client.o
   --   -L/Users/Alex/Desktop/Server/obj/
   --   -L/Users/Alex/Desktop/Server/obj/
   --   -L/usr/local/gnat/lib/gcc/x86_64-apple-darwin12.2.0/4.7.4/adalib/
   --   -static
   --   -lgnarl
   --   -lgnat
--  END Object file/option list   

end ada_main;

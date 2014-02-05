pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~main.adb");
with Ada.Exceptions;

package body ada_main is
   pragma Warnings (Off);

   E013 : Short_Integer; pragma Import (Ada, E013, "system__soft_links_E");
   E023 : Short_Integer; pragma Import (Ada, E023, "system__exception_table_E");
   E057 : Short_Integer; pragma Import (Ada, E057, "ada__io_exceptions_E");
   E060 : Short_Integer; pragma Import (Ada, E060, "ada__tags_E");
   E058 : Short_Integer; pragma Import (Ada, E058, "ada__streams_E");
   E048 : Short_Integer; pragma Import (Ada, E048, "interfaces__c_E");
   E080 : Short_Integer; pragma Import (Ada, E080, "interfaces__c__strings_E");
   E029 : Short_Integer; pragma Import (Ada, E029, "system__exceptions_E");
   E078 : Short_Integer; pragma Import (Ada, E078, "system__finalization_root_E");
   E076 : Short_Integer; pragma Import (Ada, E076, "ada__finalization_E");
   E096 : Short_Integer; pragma Import (Ada, E096, "system__storage_pools_E");
   E088 : Short_Integer; pragma Import (Ada, E088, "system__finalization_masters_E");
   E102 : Short_Integer; pragma Import (Ada, E102, "system__storage_pools__subpools_E");
   E006 : Short_Integer; pragma Import (Ada, E006, "ada__calendar_E");
   E054 : Short_Integer; pragma Import (Ada, E054, "ada__calendar__delays_E");
   E098 : Short_Integer; pragma Import (Ada, E098, "system__pool_global_E");
   E105 : Short_Integer; pragma Import (Ada, E105, "gnat__sockets_E");
   E086 : Short_Integer; pragma Import (Ada, E086, "system__file_control_block_E");
   E141 : Short_Integer; pragma Import (Ada, E141, "ada__streams__stream_io_E");
   E074 : Short_Integer; pragma Import (Ada, E074, "system__file_io_E");
   E114 : Short_Integer; pragma Import (Ada, E114, "system__pool_size_E");
   E017 : Short_Integer; pragma Import (Ada, E017, "system__secondary_stack_E");
   E110 : Short_Integer; pragma Import (Ada, E110, "gnat__sockets__thin_common_E");
   E108 : Short_Integer; pragma Import (Ada, E108, "gnat__sockets__thin_E");
   E083 : Short_Integer; pragma Import (Ada, E083, "system__os_lib_E");
   E139 : Short_Integer; pragma Import (Ada, E139, "system__strings__stream_ops_E");
   E069 : Short_Integer; pragma Import (Ada, E069, "ada__text_io_E");
   E146 : Short_Integer; pragma Import (Ada, E146, "tcp__server_E");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   Is_Elaborated : Boolean := False;

   procedure finalize_library is
   begin
      E069 := E069 - 1;
      declare
         procedure F1;
         pragma Import (Ada, F1, "ada__text_io__finalize_spec");
      begin
         F1;
      end;
      declare
         procedure F2;
         pragma Import (Ada, F2, "gnat__sockets__finalize_body");
      begin
         E105 := E105 - 1;
         F2;
      end;
      declare
         procedure F3;
         pragma Import (Ada, F3, "system__file_io__finalize_body");
      begin
         E074 := E074 - 1;
         F3;
      end;
      E088 := E088 - 1;
      E102 := E102 - 1;
      E114 := E114 - 1;
      declare
         procedure F4;
         pragma Import (Ada, F4, "system__pool_size__finalize_spec");
      begin
         F4;
      end;
      E141 := E141 - 1;
      declare
         procedure F5;
         pragma Import (Ada, F5, "ada__streams__stream_io__finalize_spec");
      begin
         F5;
      end;
      declare
         procedure F6;
         pragma Import (Ada, F6, "system__file_control_block__finalize_spec");
      begin
         E086 := E086 - 1;
         F6;
      end;
      declare
         procedure F7;
         pragma Import (Ada, F7, "gnat__sockets__finalize_spec");
      begin
         F7;
      end;
      E098 := E098 - 1;
      declare
         procedure F8;
         pragma Import (Ada, F8, "system__pool_global__finalize_spec");
      begin
         F8;
      end;
      declare
         procedure F9;
         pragma Import (Ada, F9, "system__storage_pools__subpools__finalize_spec");
      begin
         F9;
      end;
      declare
         procedure F10;
         pragma Import (Ada, F10, "system__finalization_masters__finalize_spec");
      begin
         F10;
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
      Zero_Cost_Exceptions : Integer;
      pragma Import (C, Zero_Cost_Exceptions, "__gl_zero_cost_exceptions");
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
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Main_CPU := -1;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Zero_Cost_Exceptions := 1;
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
      E057 := E057 + 1;
      Ada.Tags'Elab_Spec;
      Ada.Streams'Elab_Spec;
      E058 := E058 + 1;
      Interfaces.C'Elab_Spec;
      Interfaces.C.Strings'Elab_Spec;
      System.Exceptions'Elab_Spec;
      E029 := E029 + 1;
      System.Finalization_Root'Elab_Spec;
      E078 := E078 + 1;
      Ada.Finalization'Elab_Spec;
      E076 := E076 + 1;
      System.Storage_Pools'Elab_Spec;
      E096 := E096 + 1;
      System.Finalization_Masters'Elab_Spec;
      System.Storage_Pools.Subpools'Elab_Spec;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E006 := E006 + 1;
      Ada.Calendar.Delays'Elab_Body;
      E054 := E054 + 1;
      System.Pool_Global'Elab_Spec;
      E098 := E098 + 1;
      Gnat.Sockets'Elab_Spec;
      System.File_Control_Block'Elab_Spec;
      E086 := E086 + 1;
      Ada.Streams.Stream_Io'Elab_Spec;
      E141 := E141 + 1;
      System.Pool_Size'Elab_Spec;
      E114 := E114 + 1;
      E102 := E102 + 1;
      System.Finalization_Masters'Elab_Body;
      E088 := E088 + 1;
      E080 := E080 + 1;
      E048 := E048 + 1;
      Ada.Tags'Elab_Body;
      E060 := E060 + 1;
      System.Soft_Links'Elab_Body;
      E013 := E013 + 1;
      System.Secondary_Stack'Elab_Body;
      E017 := E017 + 1;
      Gnat.Sockets.Thin_Common'Elab_Spec;
      E110 := E110 + 1;
      Gnat.Sockets.Thin'Elab_Body;
      E108 := E108 + 1;
      System.Os_Lib'Elab_Body;
      E083 := E083 + 1;
      System.File_Io'Elab_Body;
      E074 := E074 + 1;
      System.Strings.Stream_Ops'Elab_Body;
      E139 := E139 + 1;
      Gnat.Sockets'Elab_Body;
      E105 := E105 + 1;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E069 := E069 + 1;
      E146 := E146 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_main");

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
   --   C:\Users\Alex\Dropbox\Pepsi\Ada TCP server\Server\obj\tcp.o
   --   C:\Users\Alex\Dropbox\Pepsi\Ada TCP server\Server\obj\tcp-server.o
   --   C:\Users\Alex\Dropbox\Pepsi\Ada TCP server\Server\obj\main.o
   --   -LC:\Users\Alex\Dropbox\Pepsi\Ada TCP server\Server\obj\
   --   -LC:/GNAT/2012/lib/gcc/i686-pc-mingw32/4.5.4/adalib/
   --   -static
   --   -lgnat
   --   -lws2_32
   --   -Wl,--stack=0x2000000
--  END Object file/option list   

end ada_main;

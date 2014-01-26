pragma Ada_95;
with System;
package ada_main is
   pragma Warnings (Off);

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: GPL 2009 (20090519)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_main" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure Break_Start;
   pragma Import (C, Break_Start, "__gnat_break_start");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#d87a975a#;
   u00002 : constant Version_32 := 16#6385d640#;
   u00003 : constant Version_32 := 16#c332087d#;
   u00004 : constant Version_32 := 16#9c7dd3ea#;
   u00005 : constant Version_32 := 16#6db88462#;
   u00006 : constant Version_32 := 16#dc2d9adb#;
   u00007 : constant Version_32 := 16#eff31f01#;
   u00008 : constant Version_32 := 16#8535bfda#;
   u00009 : constant Version_32 := 16#b63f3caa#;
   u00010 : constant Version_32 := 16#eea4b732#;
   u00011 : constant Version_32 := 16#ba011fb9#;
   u00012 : constant Version_32 := 16#e3d85f73#;
   u00013 : constant Version_32 := 16#0e6ea6c5#;
   u00014 : constant Version_32 := 16#63a35e59#;
   u00015 : constant Version_32 := 16#92dfa46e#;
   u00016 : constant Version_32 := 16#2ea84b20#;
   u00017 : constant Version_32 := 16#fd40f02c#;
   u00018 : constant Version_32 := 16#18c4823a#;
   u00019 : constant Version_32 := 16#78788d18#;
   u00020 : constant Version_32 := 16#bcda8803#;
   u00021 : constant Version_32 := 16#aabbdae3#;
   u00022 : constant Version_32 := 16#892f4d5b#;
   u00023 : constant Version_32 := 16#e2a4447e#;
   u00024 : constant Version_32 := 16#2f60aa04#;
   u00025 : constant Version_32 := 16#d9ad4092#;
   u00026 : constant Version_32 := 16#e43c4f3d#;
   u00027 : constant Version_32 := 16#56db7cfd#;
   u00028 : constant Version_32 := 16#ebfc0b85#;
   u00029 : constant Version_32 := 16#668b0bd3#;
   u00030 : constant Version_32 := 16#88c8686c#;
   u00031 : constant Version_32 := 16#4a31e901#;
   u00032 : constant Version_32 := 16#6997f8be#;
   u00033 : constant Version_32 := 16#8d294e8f#;
   u00034 : constant Version_32 := 16#ce975c20#;
   u00035 : constant Version_32 := 16#08a5f9f2#;
   u00036 : constant Version_32 := 16#3eaa2b04#;
   u00037 : constant Version_32 := 16#776b72d1#;
   u00038 : constant Version_32 := 16#badd64f5#;
   u00039 : constant Version_32 := 16#906233be#;
   u00040 : constant Version_32 := 16#954a6cef#;
   u00041 : constant Version_32 := 16#a69cad5c#;
   u00042 : constant Version_32 := 16#093802d2#;
   u00043 : constant Version_32 := 16#1dd92a55#;
   u00044 : constant Version_32 := 16#fe5e1c6e#;
   u00045 : constant Version_32 := 16#a80054a5#;
   u00046 : constant Version_32 := 16#7b40079a#;
   u00047 : constant Version_32 := 16#46b49d08#;
   u00048 : constant Version_32 := 16#4eeb7510#;
   u00049 : constant Version_32 := 16#59507545#;
   u00050 : constant Version_32 := 16#e98c0dd7#;
   u00051 : constant Version_32 := 16#85250faf#;
   u00052 : constant Version_32 := 16#499c33c1#;
   u00053 : constant Version_32 := 16#8e705356#;
   u00054 : constant Version_32 := 16#03bc737c#;
   u00055 : constant Version_32 := 16#614b54f8#;
   u00056 : constant Version_32 := 16#0a7e05c0#;
   u00057 : constant Version_32 := 16#89667d4f#;
   u00058 : constant Version_32 := 16#647de85b#;
   u00059 : constant Version_32 := 16#2fa8111e#;
   u00060 : constant Version_32 := 16#0d0a8d0c#;
   u00061 : constant Version_32 := 16#5440dba9#;
   u00062 : constant Version_32 := 16#895f8c1e#;
   u00063 : constant Version_32 := 16#10ed8c5f#;
   u00064 : constant Version_32 := 16#4e66f673#;
   u00065 : constant Version_32 := 16#5d4e287b#;
   u00066 : constant Version_32 := 16#a8d17654#;
   u00067 : constant Version_32 := 16#62e56d2b#;
   u00068 : constant Version_32 := 16#ced5a363#;
   u00069 : constant Version_32 := 16#74e99aba#;
   u00070 : constant Version_32 := 16#f1de4b60#;
   u00071 : constant Version_32 := 16#2681d8be#;
   u00072 : constant Version_32 := 16#1a3a7ed3#;
   u00073 : constant Version_32 := 16#37a7e042#;
   u00074 : constant Version_32 := 16#6d0998e1#;
   u00075 : constant Version_32 := 16#7f2a6758#;
   u00076 : constant Version_32 := 16#a0a00019#;
   u00077 : constant Version_32 := 16#7fae2656#;
   u00078 : constant Version_32 := 16#293ff6f7#;
   u00079 : constant Version_32 := 16#00934dae#;
   u00080 : constant Version_32 := 16#2461b049#;
   u00081 : constant Version_32 := 16#0aa29e81#;
   u00082 : constant Version_32 := 16#2274d34a#;
   u00083 : constant Version_32 := 16#b9e451e5#;
   u00084 : constant Version_32 := 16#a0aa86d6#;
   u00085 : constant Version_32 := 16#cc47afb0#;
   u00086 : constant Version_32 := 16#c6d1a624#;
   u00087 : constant Version_32 := 16#d93d8ca1#;
   u00088 : constant Version_32 := 16#4be846ff#;
   u00089 : constant Version_32 := 16#e42a19e8#;
   u00090 : constant Version_32 := 16#6ffd7991#;
   u00091 : constant Version_32 := 16#d8af02ef#;
   u00092 : constant Version_32 := 16#b8ac4cbc#;
   u00093 : constant Version_32 := 16#2f3f02be#;
   u00094 : constant Version_32 := 16#d9f6bc78#;
   u00095 : constant Version_32 := 16#1acb98ae#;
   u00096 : constant Version_32 := 16#0255db5c#;
   u00097 : constant Version_32 := 16#f913b5f9#;
   u00098 : constant Version_32 := 16#8ab10de5#;
   u00099 : constant Version_32 := 16#fcd6b425#;
   u00100 : constant Version_32 := 16#17c88cd6#;
   u00101 : constant Version_32 := 16#ee360a5d#;
   u00102 : constant Version_32 := 16#76b10c12#;
   u00103 : constant Version_32 := 16#06e6ef50#;
   u00104 : constant Version_32 := 16#91b7530a#;
   u00105 : constant Version_32 := 16#4c1a6f15#;
   u00106 : constant Version_32 := 16#294c3b74#;
   u00107 : constant Version_32 := 16#dc5caf17#;
   u00108 : constant Version_32 := 16#3131a464#;
   u00109 : constant Version_32 := 16#45a56406#;
   u00110 : constant Version_32 := 16#5056e8dd#;
   u00111 : constant Version_32 := 16#32cc4e27#;
   u00112 : constant Version_32 := 16#5706a9e0#;
   u00113 : constant Version_32 := 16#9dd1f45b#;
   u00114 : constant Version_32 := 16#808e35e2#;
   u00115 : constant Version_32 := 16#b3ddb2e1#;
   u00116 : constant Version_32 := 16#e9d51972#;
   u00117 : constant Version_32 := 16#45aed95a#;
   u00118 : constant Version_32 := 16#3cdf3a90#;
   u00119 : constant Version_32 := 16#eeb3fe26#;
   u00120 : constant Version_32 := 16#6bf893b1#;
   u00121 : constant Version_32 := 16#e0683b80#;
   u00122 : constant Version_32 := 16#49bc21ce#;
   u00123 : constant Version_32 := 16#7b0a7633#;
   u00124 : constant Version_32 := 16#dd162c28#;
   u00125 : constant Version_32 := 16#d4bc7d4e#;
   u00126 : constant Version_32 := 16#5e0e8a4c#;
   u00127 : constant Version_32 := 16#a63d2351#;
   u00128 : constant Version_32 := 16#80e564ae#;
   u00129 : constant Version_32 := 16#3346551f#;
   u00130 : constant Version_32 := 16#0556d5d9#;
   u00131 : constant Version_32 := 16#a67fbc2f#;
   u00132 : constant Version_32 := 16#bb852b1e#;
   u00133 : constant Version_32 := 16#c8eda076#;

   pragma Export (C, u00001, "mainB");
   pragma Export (C, u00002, "system__standard_libraryB");
   pragma Export (C, u00003, "system__standard_libraryS");
   pragma Export (C, u00004, "adaS");
   pragma Export (C, u00005, "ada__calendar__delaysB");
   pragma Export (C, u00006, "ada__calendar__delaysS");
   pragma Export (C, u00007, "ada__calendarB");
   pragma Export (C, u00008, "ada__calendarS");
   pragma Export (C, u00009, "ada__exceptionsB");
   pragma Export (C, u00010, "ada__exceptionsS");
   pragma Export (C, u00011, "ada__exceptions__last_chance_handlerB");
   pragma Export (C, u00012, "ada__exceptions__last_chance_handlerS");
   pragma Export (C, u00013, "systemS");
   pragma Export (C, u00014, "system__soft_linksB");
   pragma Export (C, u00015, "system__soft_linksS");
   pragma Export (C, u00016, "system__parametersB");
   pragma Export (C, u00017, "system__parametersS");
   pragma Export (C, u00018, "system__secondary_stackB");
   pragma Export (C, u00019, "system__secondary_stackS");
   pragma Export (C, u00020, "system__storage_elementsB");
   pragma Export (C, u00021, "system__storage_elementsS");
   pragma Export (C, u00022, "system__stack_checkingB");
   pragma Export (C, u00023, "system__stack_checkingS");
   pragma Export (C, u00024, "system__exception_tableB");
   pragma Export (C, u00025, "system__exception_tableS");
   pragma Export (C, u00026, "system__htableB");
   pragma Export (C, u00027, "system__htableS");
   pragma Export (C, u00028, "system__string_hashB");
   pragma Export (C, u00029, "system__string_hashS");
   pragma Export (C, u00030, "system__exceptionsB");
   pragma Export (C, u00031, "system__exceptionsS");
   pragma Export (C, u00032, "system__tracebackB");
   pragma Export (C, u00033, "system__tracebackS");
   pragma Export (C, u00034, "system__unsigned_typesS");
   pragma Export (C, u00035, "system__wch_conB");
   pragma Export (C, u00036, "system__wch_conS");
   pragma Export (C, u00037, "system__wch_stwB");
   pragma Export (C, u00038, "system__wch_stwS");
   pragma Export (C, u00039, "system__wch_cnvB");
   pragma Export (C, u00040, "system__wch_cnvS");
   pragma Export (C, u00041, "interfacesS");
   pragma Export (C, u00042, "system__wch_jisB");
   pragma Export (C, u00043, "system__wch_jisS");
   pragma Export (C, u00044, "system__traceback_entriesB");
   pragma Export (C, u00045, "system__traceback_entriesS");
   pragma Export (C, u00046, "system__os_primitivesB");
   pragma Export (C, u00047, "system__os_primitivesS");
   pragma Export (C, u00048, "system__win32S");
   pragma Export (C, u00049, "interfaces__cB");
   pragma Export (C, u00050, "interfaces__cS");
   pragma Export (C, u00051, "system__win32__extS");
   pragma Export (C, u00052, "system__tracesB");
   pragma Export (C, u00053, "system__tracesS");
   pragma Export (C, u00054, "ada__integer_text_ioB");
   pragma Export (C, u00055, "ada__integer_text_ioS");
   pragma Export (C, u00056, "ada__tagsB");
   pragma Export (C, u00057, "ada__tagsS");
   pragma Export (C, u00058, "system__val_unsB");
   pragma Export (C, u00059, "system__val_unsS");
   pragma Export (C, u00060, "system__val_utilB");
   pragma Export (C, u00061, "system__val_utilS");
   pragma Export (C, u00062, "system__case_utilB");
   pragma Export (C, u00063, "system__case_utilS");
   pragma Export (C, u00064, "ada__text_ioB");
   pragma Export (C, u00065, "ada__text_ioS");
   pragma Export (C, u00066, "ada__streamsS");
   pragma Export (C, u00067, "interfaces__c_streamsB");
   pragma Export (C, u00068, "interfaces__c_streamsS");
   pragma Export (C, u00069, "system__crtlS");
   pragma Export (C, u00070, "system__file_ioB");
   pragma Export (C, u00071, "system__file_ioS");
   pragma Export (C, u00072, "ada__finalizationB");
   pragma Export (C, u00073, "ada__finalizationS");
   pragma Export (C, u00074, "system__finalization_rootB");
   pragma Export (C, u00075, "system__finalization_rootS");
   pragma Export (C, u00076, "system__finalization_implementationB");
   pragma Export (C, u00077, "system__finalization_implementationS");
   pragma Export (C, u00078, "system__restrictionsB");
   pragma Export (C, u00079, "system__restrictionsS");
   pragma Export (C, u00080, "system__stream_attributesB");
   pragma Export (C, u00081, "system__stream_attributesS");
   pragma Export (C, u00082, "ada__io_exceptionsS");
   pragma Export (C, u00083, "system__os_libB");
   pragma Export (C, u00084, "system__os_libS");
   pragma Export (C, u00085, "system__stringsB");
   pragma Export (C, u00086, "system__stringsS");
   pragma Export (C, u00087, "system__file_control_blockS");
   pragma Export (C, u00088, "ada__finalization__list_controllerB");
   pragma Export (C, u00089, "ada__finalization__list_controllerS");
   pragma Export (C, u00090, "ada__text_io__integer_auxB");
   pragma Export (C, u00091, "ada__text_io__integer_auxS");
   pragma Export (C, u00092, "ada__text_io__generic_auxB");
   pragma Export (C, u00093, "ada__text_io__generic_auxS");
   pragma Export (C, u00094, "system__img_biuB");
   pragma Export (C, u00095, "system__img_biuS");
   pragma Export (C, u00096, "system__img_intB");
   pragma Export (C, u00097, "system__img_intS");
   pragma Export (C, u00098, "system__img_llbB");
   pragma Export (C, u00099, "system__img_llbS");
   pragma Export (C, u00100, "system__img_lliB");
   pragma Export (C, u00101, "system__img_lliS");
   pragma Export (C, u00102, "system__img_llwB");
   pragma Export (C, u00103, "system__img_llwS");
   pragma Export (C, u00104, "system__img_wiuB");
   pragma Export (C, u00105, "system__img_wiuS");
   pragma Export (C, u00106, "system__val_intB");
   pragma Export (C, u00107, "system__val_intS");
   pragma Export (C, u00108, "system__val_lliB");
   pragma Export (C, u00109, "system__val_lliS");
   pragma Export (C, u00110, "system__val_lluB");
   pragma Export (C, u00111, "system__val_lluS");
   pragma Export (C, u00112, "binarytreeB");
   pragma Export (C, u00113, "binarytreeS");
   pragma Export (C, u00114, "ada__numericsS");
   pragma Export (C, u00115, "ada__numerics__elementary_functionsB");
   pragma Export (C, u00116, "ada__numerics__elementary_functionsS");
   pragma Export (C, u00117, "ada__numerics__auxB");
   pragma Export (C, u00118, "ada__numerics__auxS");
   pragma Export (C, u00119, "system__fat_llfS");
   pragma Export (C, u00120, "system__machine_codeS");
   pragma Export (C, u00121, "system__exn_llfB");
   pragma Export (C, u00122, "system__exn_llfS");
   pragma Export (C, u00123, "system__fat_fltS");
   pragma Export (C, u00124, "system__exp_intB");
   pragma Export (C, u00125, "system__exp_intS");
   pragma Export (C, u00126, "toolboxB");
   pragma Export (C, u00127, "toolboxS");
   pragma Export (C, u00128, "system__concat_2B");
   pragma Export (C, u00129, "system__concat_2S");
   pragma Export (C, u00130, "system__img_boolB");
   pragma Export (C, u00131, "system__img_boolS");
   pragma Export (C, u00132, "system__memoryB");
   pragma Export (C, u00133, "system__memoryS");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  interfaces%s
   --  system%s
   --  system.case_util%s
   --  system.case_util%b
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.exn_llf%s
   --  system.exn_llf%b
   --  system.exp_int%s
   --  system.exp_int%b
   --  system.htable%s
   --  system.img_bool%s
   --  system.img_bool%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.img_lli%s
   --  system.img_lli%b
   --  system.machine_code%s
   --  system.os_primitives%s
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.restrictions%s
   --  system.restrictions%b
   --  system.standard_library%s
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.secondary_stack%s
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.traceback%s
   --  system.traceback%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  ada.exceptions%s
   --  ada.exceptions.last_chance_handler%s
   --  system.soft_links%s
   --  system.soft_links%b
   --  ada.exceptions.last_chance_handler%b
   --  system.secondary_stack%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.calendar%s
   --  ada.calendar%b
   --  ada.calendar.delays%s
   --  ada.io_exceptions%s
   --  ada.numerics%s
   --  ada.numerics.aux%s
   --  ada.tags%s
   --  ada.streams%s
   --  interfaces.c%s
   --  interfaces.c%b
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  system.memory%s
   --  system.memory%b
   --  system.standard_library%b
   --  system.os_lib%s
   --  system.os_lib%b
   --  system.traces%s
   --  system.traces%b
   --  ada.calendar.delays%b
   --  system.unsigned_types%s
   --  system.fat_flt%s
   --  ada.numerics.elementary_functions%s
   --  ada.numerics.elementary_functions%b
   --  system.fat_llf%s
   --  ada.numerics.aux%b
   --  system.img_biu%s
   --  system.img_biu%b
   --  system.img_llb%s
   --  system.img_llb%b
   --  system.img_llw%s
   --  system.img_llw%b
   --  system.img_wiu%s
   --  system.img_wiu%b
   --  system.stream_attributes%s
   --  system.stream_attributes%b
   --  system.finalization_implementation%s
   --  system.finalization_implementation%b
   --  ada.finalization%s
   --  ada.finalization%b
   --  ada.finalization.list_controller%s
   --  ada.finalization.list_controller%b
   --  system.file_control_block%s
   --  system.file_io%s
   --  system.file_io%b
   --  system.val_int%s
   --  system.val_lli%s
   --  system.val_llu%s
   --  system.val_uns%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_uns%b
   --  system.val_llu%b
   --  system.val_lli%b
   --  system.val_int%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_cnv%s
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%b
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.tags%b
   --  ada.exceptions%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  ada.text_io.generic_aux%s
   --  ada.text_io.generic_aux%b
   --  ada.text_io.integer_aux%s
   --  ada.text_io.integer_aux%b
   --  ada.integer_text_io%s
   --  ada.integer_text_io%b
   --  system.win32%s
   --  system.win32.ext%s
   --  system.os_primitives%b
   --  binarytree%s
   --  toolbox%s
   --  toolbox%b
   --  binarytree%b
   --  main%b
   --  END ELABORATION ORDER

end ada_main;

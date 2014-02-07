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
                    "GNAT Version: GPL 2012 (20120509)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_main" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#695294a6#;
   pragma Export (C, u00001, "mainB");
   u00002 : constant Version_32 := 16#3935bd10#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#63cfd057#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#3ffc8e18#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#8ba0787e#;
   pragma Export (C, u00005, "ada__calendarB");
   u00006 : constant Version_32 := 16#e791e294#;
   pragma Export (C, u00006, "ada__calendarS");
   u00007 : constant Version_32 := 16#1ee4165a#;
   pragma Export (C, u00007, "ada__exceptionsB");
   u00008 : constant Version_32 := 16#ad007709#;
   pragma Export (C, u00008, "ada__exceptionsS");
   u00009 : constant Version_32 := 16#16173147#;
   pragma Export (C, u00009, "ada__exceptions__last_chance_handlerB");
   u00010 : constant Version_32 := 16#e3a511ca#;
   pragma Export (C, u00010, "ada__exceptions__last_chance_handlerS");
   u00011 : constant Version_32 := 16#6daf90c4#;
   pragma Export (C, u00011, "systemS");
   u00012 : constant Version_32 := 16#0071025c#;
   pragma Export (C, u00012, "system__soft_linksB");
   u00013 : constant Version_32 := 16#fc13008d#;
   pragma Export (C, u00013, "system__soft_linksS");
   u00014 : constant Version_32 := 16#27940d94#;
   pragma Export (C, u00014, "system__parametersB");
   u00015 : constant Version_32 := 16#db4d9c04#;
   pragma Export (C, u00015, "system__parametersS");
   u00016 : constant Version_32 := 16#17775d6d#;
   pragma Export (C, u00016, "system__secondary_stackB");
   u00017 : constant Version_32 := 16#79c1b76a#;
   pragma Export (C, u00017, "system__secondary_stackS");
   u00018 : constant Version_32 := 16#ace32e1e#;
   pragma Export (C, u00018, "system__storage_elementsB");
   u00019 : constant Version_32 := 16#9762ed5c#;
   pragma Export (C, u00019, "system__storage_elementsS");
   u00020 : constant Version_32 := 16#4f750b3b#;
   pragma Export (C, u00020, "system__stack_checkingB");
   u00021 : constant Version_32 := 16#ce0d2ce8#;
   pragma Export (C, u00021, "system__stack_checkingS");
   u00022 : constant Version_32 := 16#7b9f0bae#;
   pragma Export (C, u00022, "system__exception_tableB");
   u00023 : constant Version_32 := 16#fcc14c61#;
   pragma Export (C, u00023, "system__exception_tableS");
   u00024 : constant Version_32 := 16#84debe5c#;
   pragma Export (C, u00024, "system__htableB");
   u00025 : constant Version_32 := 16#ee07deca#;
   pragma Export (C, u00025, "system__htableS");
   u00026 : constant Version_32 := 16#8b7dad61#;
   pragma Export (C, u00026, "system__string_hashB");
   u00027 : constant Version_32 := 16#4b334850#;
   pragma Export (C, u00027, "system__string_hashS");
   u00028 : constant Version_32 := 16#aad75561#;
   pragma Export (C, u00028, "system__exceptionsB");
   u00029 : constant Version_32 := 16#61515873#;
   pragma Export (C, u00029, "system__exceptionsS");
   u00030 : constant Version_32 := 16#010db1dc#;
   pragma Export (C, u00030, "system__exceptions_debugB");
   u00031 : constant Version_32 := 16#55dfb510#;
   pragma Export (C, u00031, "system__exceptions_debugS");
   u00032 : constant Version_32 := 16#b012ff50#;
   pragma Export (C, u00032, "system__img_intB");
   u00033 : constant Version_32 := 16#6f747006#;
   pragma Export (C, u00033, "system__img_intS");
   u00034 : constant Version_32 := 16#dc8e33ed#;
   pragma Export (C, u00034, "system__tracebackB");
   u00035 : constant Version_32 := 16#0c2844b1#;
   pragma Export (C, u00035, "system__tracebackS");
   u00036 : constant Version_32 := 16#907d882f#;
   pragma Export (C, u00036, "system__wch_conB");
   u00037 : constant Version_32 := 16#d244bef9#;
   pragma Export (C, u00037, "system__wch_conS");
   u00038 : constant Version_32 := 16#22fed88a#;
   pragma Export (C, u00038, "system__wch_stwB");
   u00039 : constant Version_32 := 16#ff5592f8#;
   pragma Export (C, u00039, "system__wch_stwS");
   u00040 : constant Version_32 := 16#b8a9e30d#;
   pragma Export (C, u00040, "system__wch_cnvB");
   u00041 : constant Version_32 := 16#ccba382f#;
   pragma Export (C, u00041, "system__wch_cnvS");
   u00042 : constant Version_32 := 16#129923ea#;
   pragma Export (C, u00042, "interfacesS");
   u00043 : constant Version_32 := 16#75729fba#;
   pragma Export (C, u00043, "system__wch_jisB");
   u00044 : constant Version_32 := 16#98c8a33b#;
   pragma Export (C, u00044, "system__wch_jisS");
   u00045 : constant Version_32 := 16#ada34a87#;
   pragma Export (C, u00045, "system__traceback_entriesB");
   u00046 : constant Version_32 := 16#3f8e7e85#;
   pragma Export (C, u00046, "system__traceback_entriesS");
   u00047 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00047, "interfaces__cB");
   u00048 : constant Version_32 := 16#f05a3eb1#;
   pragma Export (C, u00048, "interfaces__cS");
   u00049 : constant Version_32 := 16#3fcdd715#;
   pragma Export (C, u00049, "system__os_primitivesB");
   u00050 : constant Version_32 := 16#dd7e1ced#;
   pragma Export (C, u00050, "system__os_primitivesS");
   u00051 : constant Version_32 := 16#3ead0efd#;
   pragma Export (C, u00051, "system__win32S");
   u00052 : constant Version_32 := 16#aa4baafd#;
   pragma Export (C, u00052, "system__win32__extS");
   u00053 : constant Version_32 := 16#45724809#;
   pragma Export (C, u00053, "ada__calendar__delaysB");
   u00054 : constant Version_32 := 16#474dd4b1#;
   pragma Export (C, u00054, "ada__calendar__delaysS");
   u00055 : constant Version_32 := 16#ee80728a#;
   pragma Export (C, u00055, "system__tracesB");
   u00056 : constant Version_32 := 16#9fb2f86e#;
   pragma Export (C, u00056, "system__tracesS");
   u00057 : constant Version_32 := 16#b46168d5#;
   pragma Export (C, u00057, "ada__io_exceptionsS");
   u00058 : constant Version_32 := 16#1358602f#;
   pragma Export (C, u00058, "ada__streamsS");
   u00059 : constant Version_32 := 16#5331c1d4#;
   pragma Export (C, u00059, "ada__tagsB");
   u00060 : constant Version_32 := 16#c49b6a94#;
   pragma Export (C, u00060, "ada__tagsS");
   u00061 : constant Version_32 := 16#074eccb2#;
   pragma Export (C, u00061, "system__unsigned_typesS");
   u00062 : constant Version_32 := 16#e6965fe6#;
   pragma Export (C, u00062, "system__val_unsB");
   u00063 : constant Version_32 := 16#17e62189#;
   pragma Export (C, u00063, "system__val_unsS");
   u00064 : constant Version_32 := 16#46a1f7a9#;
   pragma Export (C, u00064, "system__val_utilB");
   u00065 : constant Version_32 := 16#660205db#;
   pragma Export (C, u00065, "system__val_utilS");
   u00066 : constant Version_32 := 16#b7fa72e7#;
   pragma Export (C, u00066, "system__case_utilB");
   u00067 : constant Version_32 := 16#c0b3f04c#;
   pragma Export (C, u00067, "system__case_utilS");
   u00068 : constant Version_32 := 16#bc0fac87#;
   pragma Export (C, u00068, "ada__text_ioB");
   u00069 : constant Version_32 := 16#36d750a9#;
   pragma Export (C, u00069, "ada__text_ioS");
   u00070 : constant Version_32 := 16#7a48d8b1#;
   pragma Export (C, u00070, "interfaces__c_streamsB");
   u00071 : constant Version_32 := 16#a539be81#;
   pragma Export (C, u00071, "interfaces__c_streamsS");
   u00072 : constant Version_32 := 16#773a2d5d#;
   pragma Export (C, u00072, "system__crtlS");
   u00073 : constant Version_32 := 16#4a803ccf#;
   pragma Export (C, u00073, "system__file_ioB");
   u00074 : constant Version_32 := 16#60d89729#;
   pragma Export (C, u00074, "system__file_ioS");
   u00075 : constant Version_32 := 16#8cbe6205#;
   pragma Export (C, u00075, "ada__finalizationB");
   u00076 : constant Version_32 := 16#22e22193#;
   pragma Export (C, u00076, "ada__finalizationS");
   u00077 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00077, "system__finalization_rootB");
   u00078 : constant Version_32 := 16#225de354#;
   pragma Export (C, u00078, "system__finalization_rootS");
   u00079 : constant Version_32 := 16#62120d5e#;
   pragma Export (C, u00079, "interfaces__c__stringsB");
   u00080 : constant Version_32 := 16#603c1c44#;
   pragma Export (C, u00080, "interfaces__c__stringsS");
   u00081 : constant Version_32 := 16#a50435f4#;
   pragma Export (C, u00081, "system__crtl__runtimeS");
   u00082 : constant Version_32 := 16#721198aa#;
   pragma Export (C, u00082, "system__os_libB");
   u00083 : constant Version_32 := 16#a6d80a38#;
   pragma Export (C, u00083, "system__os_libS");
   u00084 : constant Version_32 := 16#4cd8aca0#;
   pragma Export (C, u00084, "system__stringsB");
   u00085 : constant Version_32 := 16#da45da00#;
   pragma Export (C, u00085, "system__stringsS");
   u00086 : constant Version_32 := 16#b2907efe#;
   pragma Export (C, u00086, "system__file_control_blockS");
   u00087 : constant Version_32 := 16#6d35da9a#;
   pragma Export (C, u00087, "system__finalization_mastersB");
   u00088 : constant Version_32 := 16#075a3ce8#;
   pragma Export (C, u00088, "system__finalization_mastersS");
   u00089 : constant Version_32 := 16#57a37a42#;
   pragma Export (C, u00089, "system__address_imageB");
   u00090 : constant Version_32 := 16#cc430dfe#;
   pragma Export (C, u00090, "system__address_imageS");
   u00091 : constant Version_32 := 16#7268f812#;
   pragma Export (C, u00091, "system__img_boolB");
   u00092 : constant Version_32 := 16#9876e12f#;
   pragma Export (C, u00092, "system__img_boolS");
   u00093 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00093, "system__ioB");
   u00094 : constant Version_32 := 16#f3ed678b#;
   pragma Export (C, u00094, "system__ioS");
   u00095 : constant Version_32 := 16#a7a37cb6#;
   pragma Export (C, u00095, "system__storage_poolsB");
   u00096 : constant Version_32 := 16#be018fa9#;
   pragma Export (C, u00096, "system__storage_poolsS");
   u00097 : constant Version_32 := 16#ba5d60c7#;
   pragma Export (C, u00097, "system__pool_globalB");
   u00098 : constant Version_32 := 16#d56df0a6#;
   pragma Export (C, u00098, "system__pool_globalS");
   u00099 : constant Version_32 := 16#88cd69c1#;
   pragma Export (C, u00099, "system__memoryB");
   u00100 : constant Version_32 := 16#a7242cd1#;
   pragma Export (C, u00100, "system__memoryS");
   u00101 : constant Version_32 := 16#17551a52#;
   pragma Export (C, u00101, "system__storage_pools__subpoolsB");
   u00102 : constant Version_32 := 16#738e4bc9#;
   pragma Export (C, u00102, "system__storage_pools__subpoolsS");
   u00103 : constant Version_32 := 16#fd2ad2f1#;
   pragma Export (C, u00103, "gnatS");
   u00104 : constant Version_32 := 16#b28d1da5#;
   pragma Export (C, u00104, "gnat__socketsB");
   u00105 : constant Version_32 := 16#04b0a450#;
   pragma Export (C, u00105, "gnat__socketsS");
   u00106 : constant Version_32 := 16#9f68662c#;
   pragma Export (C, u00106, "gnat__sockets__linker_optionsS");
   u00107 : constant Version_32 := 16#f002ec21#;
   pragma Export (C, u00107, "gnat__sockets__thinB");
   u00108 : constant Version_32 := 16#c52420ab#;
   pragma Export (C, u00108, "gnat__sockets__thinS");
   u00109 : constant Version_32 := 16#28ed06f8#;
   pragma Export (C, u00109, "gnat__sockets__thin_commonB");
   u00110 : constant Version_32 := 16#18f9d05e#;
   pragma Export (C, u00110, "gnat__sockets__thin_commonS");
   u00111 : constant Version_32 := 16#595ba38f#;
   pragma Export (C, u00111, "system__communicationB");
   u00112 : constant Version_32 := 16#ef813eee#;
   pragma Export (C, u00112, "system__communicationS");
   u00113 : constant Version_32 := 16#17f3840e#;
   pragma Export (C, u00113, "system__pool_sizeB");
   u00114 : constant Version_32 := 16#7161052d#;
   pragma Export (C, u00114, "system__pool_sizeS");
   u00115 : constant Version_32 := 16#c57e63fb#;
   pragma Export (C, u00115, "system__task_lockB");
   u00116 : constant Version_32 := 16#4f6451c7#;
   pragma Export (C, u00116, "system__task_lockS");
   u00117 : constant Version_32 := 16#7993dbbd#;
   pragma Export (C, u00117, "system__val_intB");
   u00118 : constant Version_32 := 16#250abafb#;
   pragma Export (C, u00118, "system__val_intS");
   u00119 : constant Version_32 := 16#534b5604#;
   pragma Export (C, u00119, "system__os_constantsS");
   u00120 : constant Version_32 := 16#39591e91#;
   pragma Export (C, u00120, "system__concat_2B");
   u00121 : constant Version_32 := 16#967f6238#;
   pragma Export (C, u00121, "system__concat_2S");
   u00122 : constant Version_32 := 16#3493e6c0#;
   pragma Export (C, u00122, "system__concat_4B");
   u00123 : constant Version_32 := 16#6ff0737a#;
   pragma Export (C, u00123, "system__concat_4S");
   u00124 : constant Version_32 := 16#ae97ef6c#;
   pragma Export (C, u00124, "system__concat_3B");
   u00125 : constant Version_32 := 16#1b8592ae#;
   pragma Export (C, u00125, "system__concat_3S");
   u00126 : constant Version_32 := 16#ec38a9a5#;
   pragma Export (C, u00126, "system__concat_7B");
   u00127 : constant Version_32 := 16#71f863de#;
   pragma Export (C, u00127, "system__concat_7S");
   u00128 : constant Version_32 := 16#c9fdc962#;
   pragma Export (C, u00128, "system__concat_6B");
   u00129 : constant Version_32 := 16#aa6565d0#;
   pragma Export (C, u00129, "system__concat_6S");
   u00130 : constant Version_32 := 16#def1dd00#;
   pragma Export (C, u00130, "system__concat_5B");
   u00131 : constant Version_32 := 16#7d965e65#;
   pragma Export (C, u00131, "system__concat_5S");
   u00132 : constant Version_32 := 16#276453b7#;
   pragma Export (C, u00132, "system__img_lldB");
   u00133 : constant Version_32 := 16#9e8d99ad#;
   pragma Export (C, u00133, "system__img_lldS");
   u00134 : constant Version_32 := 16#8da1623b#;
   pragma Export (C, u00134, "system__img_decB");
   u00135 : constant Version_32 := 16#c382991f#;
   pragma Export (C, u00135, "system__img_decS");
   u00136 : constant Version_32 := 16#9777733a#;
   pragma Export (C, u00136, "system__img_lliB");
   u00137 : constant Version_32 := 16#7ce0c515#;
   pragma Export (C, u00137, "system__img_lliS");
   u00138 : constant Version_32 := 16#1eadf3c6#;
   pragma Export (C, u00138, "system__strings__stream_opsB");
   u00139 : constant Version_32 := 16#8453d1c6#;
   pragma Export (C, u00139, "system__strings__stream_opsS");
   u00140 : constant Version_32 := 16#a1920867#;
   pragma Export (C, u00140, "ada__streams__stream_ioB");
   u00141 : constant Version_32 := 16#f0e417a0#;
   pragma Export (C, u00141, "ada__streams__stream_ioS");
   u00142 : constant Version_32 := 16#a6e358bc#;
   pragma Export (C, u00142, "system__stream_attributesB");
   u00143 : constant Version_32 := 16#e89b4b3f#;
   pragma Export (C, u00143, "system__stream_attributesS");
   u00144 : constant Version_32 := 16#919f12a3#;
   pragma Export (C, u00144, "tcpS");
   u00145 : constant Version_32 := 16#de102762#;
   pragma Export (C, u00145, "tcp__serverB");
   u00146 : constant Version_32 := 16#345c5b45#;
   pragma Export (C, u00146, "tcp__serverS");
   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  gnat%s
   --  interfaces%s
   --  system%s
   --  system.case_util%s
   --  system.case_util%b
   --  system.htable%s
   --  system.img_bool%s
   --  system.img_bool%b
   --  system.img_dec%s
   --  system.img_int%s
   --  system.img_int%b
   --  system.img_dec%b
   --  system.img_lld%s
   --  system.img_lli%s
   --  system.img_lli%b
   --  system.img_lld%b
   --  system.io%s
   --  system.io%b
   --  system.os_primitives%s
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.standard_library%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  ada.exceptions%s
   --  system.soft_links%s
   --  system.traces%s
   --  system.traces%b
   --  system.unsigned_types%s
   --  system.val_int%s
   --  system.val_uns%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_uns%b
   --  system.val_int%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_cnv%s
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%b
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  system.address_image%s
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.concat_3%s
   --  system.concat_3%b
   --  system.concat_4%s
   --  system.concat_4%b
   --  system.concat_5%s
   --  system.concat_5%b
   --  system.concat_6%s
   --  system.concat_6%b
   --  system.concat_7%s
   --  system.concat_7%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.io_exceptions%s
   --  ada.tags%s
   --  ada.streams%s
   --  interfaces.c%s
   --  interfaces.c.strings%s
   --  system.crtl.runtime%s
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  ada.finalization%b
   --  system.os_constants%s
   --  system.storage_pools%s
   --  system.storage_pools%b
   --  system.finalization_masters%s
   --  system.storage_pools.subpools%s
   --  system.stream_attributes%s
   --  system.stream_attributes%b
   --  system.win32%s
   --  system.win32.ext%s
   --  system.os_primitives%b
   --  ada.calendar%s
   --  ada.calendar%b
   --  ada.calendar.delays%s
   --  ada.calendar.delays%b
   --  system.communication%s
   --  system.communication%b
   --  system.memory%s
   --  system.memory%b
   --  system.standard_library%b
   --  system.pool_global%s
   --  system.pool_global%b
   --  gnat.sockets%s
   --  gnat.sockets.linker_options%s
   --  system.file_control_block%s
   --  ada.streams.stream_io%s
   --  system.file_io%s
   --  ada.streams.stream_io%b
   --  system.pool_size%s
   --  system.pool_size%b
   --  system.secondary_stack%s
   --  system.storage_pools.subpools%b
   --  system.finalization_masters%b
   --  interfaces.c.strings%b
   --  interfaces.c%b
   --  ada.tags%b
   --  system.soft_links%b
   --  system.secondary_stack%b
   --  system.address_image%b
   --  gnat.sockets.thin_common%s
   --  gnat.sockets.thin_common%b
   --  gnat.sockets.thin%s
   --  gnat.sockets.thin%b
   --  system.os_lib%s
   --  system.os_lib%b
   --  system.file_io%b
   --  system.strings.stream_ops%s
   --  system.strings.stream_ops%b
   --  system.task_lock%s
   --  system.task_lock%b
   --  gnat.sockets%b
   --  system.traceback%s
   --  ada.exceptions%b
   --  system.traceback%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  tcp%s
   --  tcp.server%s
   --  tcp.server%b
   --  main%b
   --  END ELABORATION ORDER


end ada_main;

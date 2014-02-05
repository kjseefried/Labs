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
                    "GNAT Version: GPL 2013 (20130314)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_client" & ASCII.NUL;
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
   u00001 : constant Version_32 := 16#801fc12c#;
   pragma Export (C, u00001, "clientB");
   u00002 : constant Version_32 := 16#3935bd10#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#fc92981a#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#3ffc8e18#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#8ba0787e#;
   pragma Export (C, u00005, "ada__calendarB");
   u00006 : constant Version_32 := 16#e791e294#;
   pragma Export (C, u00006, "ada__calendarS");
   u00007 : constant Version_32 := 16#8077fe33#;
   pragma Export (C, u00007, "ada__exceptionsB");
   u00008 : constant Version_32 := 16#cebad5d0#;
   pragma Export (C, u00008, "ada__exceptionsS");
   u00009 : constant Version_32 := 16#16173147#;
   pragma Export (C, u00009, "ada__exceptions__last_chance_handlerB");
   u00010 : constant Version_32 := 16#1f42fb5e#;
   pragma Export (C, u00010, "ada__exceptions__last_chance_handlerS");
   u00011 : constant Version_32 := 16#f2f2d889#;
   pragma Export (C, u00011, "systemS");
   u00012 : constant Version_32 := 16#0071025c#;
   pragma Export (C, u00012, "system__soft_linksB");
   u00013 : constant Version_32 := 16#9fa9a254#;
   pragma Export (C, u00013, "system__soft_linksS");
   u00014 : constant Version_32 := 16#27940d94#;
   pragma Export (C, u00014, "system__parametersB");
   u00015 : constant Version_32 := 16#4410d449#;
   pragma Export (C, u00015, "system__parametersS");
   u00016 : constant Version_32 := 16#17775d6d#;
   pragma Export (C, u00016, "system__secondary_stackB");
   u00017 : constant Version_32 := 16#e69cff27#;
   pragma Export (C, u00017, "system__secondary_stackS");
   u00018 : constant Version_32 := 16#ace32e1e#;
   pragma Export (C, u00018, "system__storage_elementsB");
   u00019 : constant Version_32 := 16#083fa511#;
   pragma Export (C, u00019, "system__storage_elementsS");
   u00020 : constant Version_32 := 16#4f750b3b#;
   pragma Export (C, u00020, "system__stack_checkingB");
   u00021 : constant Version_32 := 16#515064a5#;
   pragma Export (C, u00021, "system__stack_checkingS");
   u00022 : constant Version_32 := 16#7b9f0bae#;
   pragma Export (C, u00022, "system__exception_tableB");
   u00023 : constant Version_32 := 16#639c042c#;
   pragma Export (C, u00023, "system__exception_tableS");
   u00024 : constant Version_32 := 16#5665ab64#;
   pragma Export (C, u00024, "system__htableB");
   u00025 : constant Version_32 := 16#715a9687#;
   pragma Export (C, u00025, "system__htableS");
   u00026 : constant Version_32 := 16#8b7dad61#;
   pragma Export (C, u00026, "system__string_hashB");
   u00027 : constant Version_32 := 16#d46e001d#;
   pragma Export (C, u00027, "system__string_hashS");
   u00028 : constant Version_32 := 16#aad75561#;
   pragma Export (C, u00028, "system__exceptionsB");
   u00029 : constant Version_32 := 16#fe0c103e#;
   pragma Export (C, u00029, "system__exceptionsS");
   u00030 : constant Version_32 := 16#010db1dc#;
   pragma Export (C, u00030, "system__exceptions_debugB");
   u00031 : constant Version_32 := 16#ca82fd5d#;
   pragma Export (C, u00031, "system__exceptions_debugS");
   u00032 : constant Version_32 := 16#b012ff50#;
   pragma Export (C, u00032, "system__img_intB");
   u00033 : constant Version_32 := 16#f029384b#;
   pragma Export (C, u00033, "system__img_intS");
   u00034 : constant Version_32 := 16#dc8e33ed#;
   pragma Export (C, u00034, "system__tracebackB");
   u00035 : constant Version_32 := 16#93750cfc#;
   pragma Export (C, u00035, "system__tracebackS");
   u00036 : constant Version_32 := 16#907d882f#;
   pragma Export (C, u00036, "system__wch_conB");
   u00037 : constant Version_32 := 16#4d19f6b4#;
   pragma Export (C, u00037, "system__wch_conS");
   u00038 : constant Version_32 := 16#22fed88a#;
   pragma Export (C, u00038, "system__wch_stwB");
   u00039 : constant Version_32 := 16#6008dab5#;
   pragma Export (C, u00039, "system__wch_stwS");
   u00040 : constant Version_32 := 16#617a40f2#;
   pragma Export (C, u00040, "system__wch_cnvB");
   u00041 : constant Version_32 := 16#53e77062#;
   pragma Export (C, u00041, "system__wch_cnvS");
   u00042 : constant Version_32 := 16#cb4a8015#;
   pragma Export (C, u00042, "interfacesS");
   u00043 : constant Version_32 := 16#75729fba#;
   pragma Export (C, u00043, "system__wch_jisB");
   u00044 : constant Version_32 := 16#0795eb76#;
   pragma Export (C, u00044, "system__wch_jisS");
   u00045 : constant Version_32 := 16#ada34a87#;
   pragma Export (C, u00045, "system__traceback_entriesB");
   u00046 : constant Version_32 := 16#a0d336c8#;
   pragma Export (C, u00046, "system__traceback_entriesS");
   u00047 : constant Version_32 := 16#769e25e6#;
   pragma Export (C, u00047, "interfaces__cB");
   u00048 : constant Version_32 := 16#29899d4e#;
   pragma Export (C, u00048, "interfaces__cS");
   u00049 : constant Version_32 := 16#820eb304#;
   pragma Export (C, u00049, "system__os_primitivesB");
   u00050 : constant Version_32 := 16#422354a0#;
   pragma Export (C, u00050, "system__os_primitivesS");
   u00051 : constant Version_32 := 16#45724809#;
   pragma Export (C, u00051, "ada__calendar__delaysB");
   u00052 : constant Version_32 := 16#474dd4b1#;
   pragma Export (C, u00052, "ada__calendar__delaysS");
   u00053 : constant Version_32 := 16#ee80728a#;
   pragma Export (C, u00053, "system__tracesB");
   u00054 : constant Version_32 := 16#00efb023#;
   pragma Export (C, u00054, "system__tracesS");
   u00055 : constant Version_32 := 16#b46168d5#;
   pragma Export (C, u00055, "ada__io_exceptionsS");
   u00056 : constant Version_32 := 16#89ce8ea0#;
   pragma Export (C, u00056, "ada__real_timeB");
   u00057 : constant Version_32 := 16#41de19c7#;
   pragma Export (C, u00057, "ada__real_timeS");
   u00058 : constant Version_32 := 16#aa574b29#;
   pragma Export (C, u00058, "system__arith_64B");
   u00059 : constant Version_32 := 16#79f5fd6e#;
   pragma Export (C, u00059, "system__arith_64S");
   u00060 : constant Version_32 := 16#30d5baea#;
   pragma Export (C, u00060, "system__taskingB");
   u00061 : constant Version_32 := 16#1d26d294#;
   pragma Export (C, u00061, "system__taskingS");
   u00062 : constant Version_32 := 16#41756927#;
   pragma Export (C, u00062, "system__task_primitivesS");
   u00063 : constant Version_32 := 16#bb68f74c#;
   pragma Export (C, u00063, "system__os_interfaceB");
   u00064 : constant Version_32 := 16#d21127de#;
   pragma Export (C, u00064, "system__os_interfaceS");
   u00065 : constant Version_32 := 16#746081d8#;
   pragma Export (C, u00065, "system__os_constantsS");
   u00066 : constant Version_32 := 16#748c196a#;
   pragma Export (C, u00066, "system__task_primitives__operationsB");
   u00067 : constant Version_32 := 16#415e0e8e#;
   pragma Export (C, u00067, "system__task_primitives__operationsS");
   u00068 : constant Version_32 := 16#89b55e64#;
   pragma Export (C, u00068, "system__interrupt_managementB");
   u00069 : constant Version_32 := 16#47187112#;
   pragma Export (C, u00069, "system__interrupt_managementS");
   u00070 : constant Version_32 := 16#f65595cf#;
   pragma Export (C, u00070, "system__multiprocessorsB");
   u00071 : constant Version_32 := 16#ca5e47fa#;
   pragma Export (C, u00071, "system__multiprocessorsS");
   u00072 : constant Version_32 := 16#81c6b8c3#;
   pragma Export (C, u00072, "system__task_infoB");
   u00073 : constant Version_32 := 16#13d23ab3#;
   pragma Export (C, u00073, "system__task_infoS");
   u00074 : constant Version_32 := 16#bb0825a9#;
   pragma Export (C, u00074, "system__tasking__debugB");
   u00075 : constant Version_32 := 16#b9ace83d#;
   pragma Export (C, u00075, "system__tasking__debugS");
   u00076 : constant Version_32 := 16#39591e91#;
   pragma Export (C, u00076, "system__concat_2B");
   u00077 : constant Version_32 := 16#09222a75#;
   pragma Export (C, u00077, "system__concat_2S");
   u00078 : constant Version_32 := 16#ae97ef6c#;
   pragma Export (C, u00078, "system__concat_3B");
   u00079 : constant Version_32 := 16#84d8dae3#;
   pragma Export (C, u00079, "system__concat_3S");
   u00080 : constant Version_32 := 16#c9fdc962#;
   pragma Export (C, u00080, "system__concat_6B");
   u00081 : constant Version_32 := 16#35382d9d#;
   pragma Export (C, u00081, "system__concat_6S");
   u00082 : constant Version_32 := 16#def1dd00#;
   pragma Export (C, u00082, "system__concat_5B");
   u00083 : constant Version_32 := 16#e2cb1628#;
   pragma Export (C, u00083, "system__concat_5S");
   u00084 : constant Version_32 := 16#3493e6c0#;
   pragma Export (C, u00084, "system__concat_4B");
   u00085 : constant Version_32 := 16#f0ad3b37#;
   pragma Export (C, u00085, "system__concat_4S");
   u00086 : constant Version_32 := 16#9bdf1e28#;
   pragma Export (C, u00086, "system__crtlS");
   u00087 : constant Version_32 := 16#1eab0e09#;
   pragma Export (C, u00087, "system__img_enum_newB");
   u00088 : constant Version_32 := 16#75f51379#;
   pragma Export (C, u00088, "system__img_enum_newS");
   u00089 : constant Version_32 := 16#9777733a#;
   pragma Export (C, u00089, "system__img_lliB");
   u00090 : constant Version_32 := 16#e3bd8d58#;
   pragma Export (C, u00090, "system__img_lliS");
   u00091 : constant Version_32 := 16#06417083#;
   pragma Export (C, u00091, "system__img_lluB");
   u00092 : constant Version_32 := 16#d1da843c#;
   pragma Export (C, u00092, "system__img_lluS");
   u00093 : constant Version_32 := 16#981384ff#;
   pragma Export (C, u00093, "system__unsigned_typesS");
   u00094 : constant Version_32 := 16#083296f2#;
   pragma Export (C, u00094, "system__stack_usageB");
   u00095 : constant Version_32 := 16#7ccb26a7#;
   pragma Export (C, u00095, "system__stack_usageS");
   u00096 : constant Version_32 := 16#d7aac20c#;
   pragma Export (C, u00096, "system__ioB");
   u00097 : constant Version_32 := 16#6cb02fc6#;
   pragma Export (C, u00097, "system__ioS");
   u00098 : constant Version_32 := 16#1358602f#;
   pragma Export (C, u00098, "ada__streamsS");
   u00099 : constant Version_32 := 16#afd62b40#;
   pragma Export (C, u00099, "ada__tagsB");
   u00100 : constant Version_32 := 16#5bc622d9#;
   pragma Export (C, u00100, "ada__tagsS");
   u00101 : constant Version_32 := 16#25c21d28#;
   pragma Export (C, u00101, "system__val_lluB");
   u00102 : constant Version_32 := 16#e2e1d38d#;
   pragma Export (C, u00102, "system__val_lluS");
   u00103 : constant Version_32 := 16#aea309ed#;
   pragma Export (C, u00103, "system__val_utilB");
   u00104 : constant Version_32 := 16#5e526e77#;
   pragma Export (C, u00104, "system__val_utilS");
   u00105 : constant Version_32 := 16#b7fa72e7#;
   pragma Export (C, u00105, "system__case_utilB");
   u00106 : constant Version_32 := 16#5feeb801#;
   pragma Export (C, u00106, "system__case_utilS");
   u00107 : constant Version_32 := 16#421d3150#;
   pragma Export (C, u00107, "ada__text_ioB");
   u00108 : constant Version_32 := 16#b81698c1#;
   pragma Export (C, u00108, "ada__text_ioS");
   u00109 : constant Version_32 := 16#e0b7a7e8#;
   pragma Export (C, u00109, "interfaces__c_streamsB");
   u00110 : constant Version_32 := 16#95ad191f#;
   pragma Export (C, u00110, "interfaces__c_streamsS");
   u00111 : constant Version_32 := 16#228a5436#;
   pragma Export (C, u00111, "system__file_ioB");
   u00112 : constant Version_32 := 16#63b3b9ae#;
   pragma Export (C, u00112, "system__file_ioS");
   u00113 : constant Version_32 := 16#8cbe6205#;
   pragma Export (C, u00113, "ada__finalizationB");
   u00114 : constant Version_32 := 16#22e22193#;
   pragma Export (C, u00114, "ada__finalizationS");
   u00115 : constant Version_32 := 16#95817ed8#;
   pragma Export (C, u00115, "system__finalization_rootB");
   u00116 : constant Version_32 := 16#bd00ab19#;
   pragma Export (C, u00116, "system__finalization_rootS");
   u00117 : constant Version_32 := 16#fd4f4513#;
   pragma Export (C, u00117, "interfaces__c__stringsB");
   u00118 : constant Version_32 := 16#603c1c44#;
   pragma Export (C, u00118, "interfaces__c__stringsS");
   u00119 : constant Version_32 := 16#d6bc4ecc#;
   pragma Export (C, u00119, "system__crtl__runtimeS");
   u00120 : constant Version_32 := 16#5bd4f336#;
   pragma Export (C, u00120, "system__os_libB");
   u00121 : constant Version_32 := 16#89dce9aa#;
   pragma Export (C, u00121, "system__os_libS");
   u00122 : constant Version_32 := 16#4cd8aca0#;
   pragma Export (C, u00122, "system__stringsB");
   u00123 : constant Version_32 := 16#4518924d#;
   pragma Export (C, u00123, "system__stringsS");
   u00124 : constant Version_32 := 16#d516b2f7#;
   pragma Export (C, u00124, "system__file_control_blockS");
   u00125 : constant Version_32 := 16#91d2300e#;
   pragma Export (C, u00125, "system__finalization_mastersB");
   u00126 : constant Version_32 := 16#980774a5#;
   pragma Export (C, u00126, "system__finalization_mastersS");
   u00127 : constant Version_32 := 16#57a37a42#;
   pragma Export (C, u00127, "system__address_imageB");
   u00128 : constant Version_32 := 16#531e45b3#;
   pragma Export (C, u00128, "system__address_imageS");
   u00129 : constant Version_32 := 16#7268f812#;
   pragma Export (C, u00129, "system__img_boolB");
   u00130 : constant Version_32 := 16#072ba962#;
   pragma Export (C, u00130, "system__img_boolS");
   u00131 : constant Version_32 := 16#a7a37cb6#;
   pragma Export (C, u00131, "system__storage_poolsB");
   u00132 : constant Version_32 := 16#215cc7e4#;
   pragma Export (C, u00132, "system__storage_poolsS");
   u00133 : constant Version_32 := 16#ba5d60c7#;
   pragma Export (C, u00133, "system__pool_globalB");
   u00134 : constant Version_32 := 16#d56df0a6#;
   pragma Export (C, u00134, "system__pool_globalS");
   u00135 : constant Version_32 := 16#fc605663#;
   pragma Export (C, u00135, "system__memoryB");
   u00136 : constant Version_32 := 16#3879649c#;
   pragma Export (C, u00136, "system__memoryS");
   u00137 : constant Version_32 := 16#1fd820b1#;
   pragma Export (C, u00137, "system__storage_pools__subpoolsB");
   u00138 : constant Version_32 := 16#951e0de9#;
   pragma Export (C, u00138, "system__storage_pools__subpoolsS");
   u00139 : constant Version_32 := 16#1777d351#;
   pragma Export (C, u00139, "system__storage_pools__subpools__finalizationB");
   u00140 : constant Version_32 := 16#12aaf1de#;
   pragma Export (C, u00140, "system__storage_pools__subpools__finalizationS");
   u00141 : constant Version_32 := 16#fd2ad2f1#;
   pragma Export (C, u00141, "gnatS");
   u00142 : constant Version_32 := 16#43279cf6#;
   pragma Export (C, u00142, "gnat__socketsB");
   u00143 : constant Version_32 := 16#de4bcbc1#;
   pragma Export (C, u00143, "gnat__socketsS");
   u00144 : constant Version_32 := 16#ef852e11#;
   pragma Export (C, u00144, "gnat__sockets__linker_optionsS");
   u00145 : constant Version_32 := 16#8aae00cc#;
   pragma Export (C, u00145, "gnat__sockets__thinB");
   u00146 : constant Version_32 := 16#fc71c488#;
   pragma Export (C, u00146, "gnat__sockets__thinS");
   u00147 : constant Version_32 := 16#3ff16a6d#;
   pragma Export (C, u00147, "gnat__os_libS");
   u00148 : constant Version_32 := 16#00e9dcb1#;
   pragma Export (C, u00148, "gnat__task_lockS");
   u00149 : constant Version_32 := 16#863f9596#;
   pragma Export (C, u00149, "system__task_lockB");
   u00150 : constant Version_32 := 16#9378efe7#;
   pragma Export (C, u00150, "system__task_lockS");
   u00151 : constant Version_32 := 16#0a2632e6#;
   pragma Export (C, u00151, "gnat__sockets__thin_commonB");
   u00152 : constant Version_32 := 16#a458fed4#;
   pragma Export (C, u00152, "gnat__sockets__thin_commonS");
   u00153 : constant Version_32 := 16#5de653db#;
   pragma Export (C, u00153, "system__communicationB");
   u00154 : constant Version_32 := 16#07d9fdcf#;
   pragma Export (C, u00154, "system__communicationS");
   u00155 : constant Version_32 := 16#17f3840e#;
   pragma Export (C, u00155, "system__pool_sizeB");
   u00156 : constant Version_32 := 16#ee3c4d60#;
   pragma Export (C, u00156, "system__pool_sizeS");
   u00157 : constant Version_32 := 16#c31442ce#;
   pragma Export (C, u00157, "system__val_intB");
   u00158 : constant Version_32 := 16#ba57f2b6#;
   pragma Export (C, u00158, "system__val_intS");
   u00159 : constant Version_32 := 16#79817c71#;
   pragma Export (C, u00159, "system__val_unsB");
   u00160 : constant Version_32 := 16#88bb69c4#;
   pragma Export (C, u00160, "system__val_unsS");
   u00161 : constant Version_32 := 16#ce0e2acb#;
   pragma Export (C, u00161, "system__strings__stream_opsB");
   u00162 : constant Version_32 := 16#8453d1c6#;
   pragma Export (C, u00162, "system__strings__stream_opsS");
   u00163 : constant Version_32 := 16#30befd3b#;
   pragma Export (C, u00163, "ada__streams__stream_ioB");
   u00164 : constant Version_32 := 16#31db4e88#;
   pragma Export (C, u00164, "ada__streams__stream_ioS");
   u00165 : constant Version_32 := 16#a6e358bc#;
   pragma Export (C, u00165, "system__stream_attributesB");
   u00166 : constant Version_32 := 16#e89b4b3f#;
   pragma Export (C, u00166, "system__stream_attributesS");
   u00167 : constant Version_32 := 16#1e361601#;
   pragma Export (C, u00167, "system__tasking__stagesB");
   u00168 : constant Version_32 := 16#1d5aeac6#;
   pragma Export (C, u00168, "system__tasking__stagesS");
   u00169 : constant Version_32 := 16#386436bc#;
   pragma Export (C, u00169, "system__restrictionsB");
   u00170 : constant Version_32 := 16#501e4dcc#;
   pragma Export (C, u00170, "system__restrictionsS");
   u00171 : constant Version_32 := 16#095681d6#;
   pragma Export (C, u00171, "system__tasking__initializationB");
   u00172 : constant Version_32 := 16#9468d5af#;
   pragma Export (C, u00172, "system__tasking__initializationS");
   u00173 : constant Version_32 := 16#b05bb4bd#;
   pragma Export (C, u00173, "system__soft_links__taskingB");
   u00174 : constant Version_32 := 16#6ac0d6d0#;
   pragma Export (C, u00174, "system__soft_links__taskingS");
   u00175 : constant Version_32 := 16#17d21067#;
   pragma Export (C, u00175, "ada__exceptions__is_null_occurrenceB");
   u00176 : constant Version_32 := 16#d832eaef#;
   pragma Export (C, u00176, "ada__exceptions__is_null_occurrenceS");
   u00177 : constant Version_32 := 16#da83430a#;
   pragma Export (C, u00177, "system__tasking__queuingB");
   u00178 : constant Version_32 := 16#5b69ac57#;
   pragma Export (C, u00178, "system__tasking__queuingS");
   u00179 : constant Version_32 := 16#1a832812#;
   pragma Export (C, u00179, "system__tasking__protected_objectsB");
   u00180 : constant Version_32 := 16#09cb1bb5#;
   pragma Export (C, u00180, "system__tasking__protected_objectsS");
   u00181 : constant Version_32 := 16#2a70e59d#;
   pragma Export (C, u00181, "system__tasking__protected_objects__entriesB");
   u00182 : constant Version_32 := 16#4d64e3b6#;
   pragma Export (C, u00182, "system__tasking__protected_objects__entriesS");
   u00183 : constant Version_32 := 16#b856a6cd#;
   pragma Export (C, u00183, "system__tasking__rendezvousB");
   u00184 : constant Version_32 := 16#592e9c02#;
   pragma Export (C, u00184, "system__tasking__rendezvousS");
   u00185 : constant Version_32 := 16#9a033547#;
   pragma Export (C, u00185, "system__tasking__entry_callsB");
   u00186 : constant Version_32 := 16#837d42fa#;
   pragma Export (C, u00186, "system__tasking__entry_callsS");
   u00187 : constant Version_32 := 16#e6d0053a#;
   pragma Export (C, u00187, "system__tasking__protected_objects__operationsB");
   u00188 : constant Version_32 := 16#a9cb954d#;
   pragma Export (C, u00188, "system__tasking__protected_objects__operationsS");
   u00189 : constant Version_32 := 16#b0ad46f5#;
   pragma Export (C, u00189, "system__tasking__utilitiesB");
   u00190 : constant Version_32 := 16#5f437348#;
   pragma Export (C, u00190, "system__tasking__utilitiesS");
   u00191 : constant Version_32 := 16#bd6fc52e#;
   pragma Export (C, u00191, "system__traces__taskingB");
   u00192 : constant Version_32 := 16#55cf3c43#;
   pragma Export (C, u00192, "system__traces__taskingS");
   u00193 : constant Version_32 := 16#919f12a3#;
   pragma Export (C, u00193, "tcpS");
   u00194 : constant Version_32 := 16#a1fbe5d5#;
   pragma Export (C, u00194, "tcp__clientB");
   u00195 : constant Version_32 := 16#31a9069c#;
   pragma Export (C, u00195, "tcp__clientS");
   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  gnat%s
   --  interfaces%s
   --  system%s
   --  system.arith_64%s
   --  system.case_util%s
   --  system.case_util%b
   --  system.htable%s
   --  system.img_bool%s
   --  system.img_bool%b
   --  system.img_enum_new%s
   --  system.img_enum_new%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.img_lli%s
   --  system.img_lli%b
   --  system.io%s
   --  system.io%b
   --  system.multiprocessors%s
   --  system.os_primitives%s
   --  system.os_primitives%b
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.restrictions%s
   --  system.restrictions%b
   --  system.standard_library%s
   --  system.exceptions_debug%s
   --  system.exceptions_debug%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.stack_usage%s
   --  system.stack_usage%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.os_lib%s
   --  gnat.os_lib%s
   --  system.task_info%s
   --  system.task_info%b
   --  system.task_lock%s
   --  gnat.task_lock%s
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  ada.exceptions%s
   --  system.arith_64%b
   --  ada.exceptions.is_null_occurrence%s
   --  ada.exceptions.is_null_occurrence%b
   --  system.soft_links%s
   --  system.task_lock%b
   --  system.traces%s
   --  system.traces%b
   --  system.unsigned_types%s
   --  system.img_llu%s
   --  system.img_llu%b
   --  system.val_int%s
   --  system.val_llu%s
   --  system.val_uns%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_uns%b
   --  system.val_llu%b
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
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.io_exceptions%s
   --  ada.tags%s
   --  ada.streams%s
   --  interfaces.c%s
   --  system.multiprocessors%b
   --  interfaces.c.strings%s
   --  system.communication%s
   --  system.communication%b
   --  system.crtl.runtime%s
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  ada.finalization%s
   --  ada.finalization%b
   --  system.os_constants%s
   --  system.os_interface%s
   --  system.os_interface%b
   --  system.interrupt_management%s
   --  system.interrupt_management%b
   --  system.storage_pools%s
   --  system.storage_pools%b
   --  system.finalization_masters%s
   --  system.storage_pools.subpools%s
   --  system.storage_pools.subpools.finalization%s
   --  system.storage_pools.subpools.finalization%b
   --  system.stream_attributes%s
   --  system.stream_attributes%b
   --  system.task_primitives%s
   --  system.tasking%s
   --  system.task_primitives.operations%s
   --  system.tasking%b
   --  system.tasking.debug%s
   --  system.tasking.debug%b
   --  system.task_primitives.operations%b
   --  system.traces.tasking%s
   --  system.traces.tasking%b
   --  ada.calendar%s
   --  ada.calendar%b
   --  ada.calendar.delays%s
   --  ada.calendar.delays%b
   --  system.memory%s
   --  system.memory%b
   --  system.standard_library%b
   --  system.pool_global%s
   --  system.pool_global%b
   --  system.file_control_block%s
   --  ada.streams.stream_io%s
   --  system.file_io%s
   --  ada.streams.stream_io%b
   --  gnat.sockets%s
   --  gnat.sockets.linker_options%s
   --  system.pool_size%s
   --  system.pool_size%b
   --  system.secondary_stack%s
   --  system.file_io%b
   --  system.storage_pools.subpools%b
   --  system.finalization_masters%b
   --  interfaces.c.strings%b
   --  interfaces.c%b
   --  ada.tags%b
   --  system.soft_links%b
   --  system.os_lib%b
   --  system.secondary_stack%b
   --  system.address_image%b
   --  gnat.sockets.thin_common%s
   --  gnat.sockets.thin_common%b
   --  gnat.sockets.thin%s
   --  gnat.sockets.thin%b
   --  gnat.sockets%b
   --  system.soft_links.tasking%s
   --  system.soft_links.tasking%b
   --  system.strings.stream_ops%s
   --  system.strings.stream_ops%b
   --  system.tasking.entry_calls%s
   --  system.tasking.initialization%s
   --  system.tasking.initialization%b
   --  system.tasking.protected_objects%s
   --  system.tasking.protected_objects%b
   --  system.tasking.utilities%s
   --  system.traceback%s
   --  ada.exceptions%b
   --  system.traceback%b
   --  ada.real_time%s
   --  ada.real_time%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  system.tasking.protected_objects.entries%s
   --  system.tasking.protected_objects.entries%b
   --  system.tasking.queuing%s
   --  system.tasking.queuing%b
   --  system.tasking.utilities%b
   --  system.tasking.rendezvous%s
   --  system.tasking.protected_objects.operations%s
   --  system.tasking.protected_objects.operations%b
   --  system.tasking.rendezvous%b
   --  system.tasking.entry_calls%b
   --  system.tasking.stages%s
   --  system.tasking.stages%b
   --  tcp%s
   --  tcp.client%s
   --  tcp.client%b
   --  client%b
   --  END ELABORATION ORDER


end ada_main;

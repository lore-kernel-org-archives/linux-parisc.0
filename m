Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel3.hp.com (palrel3.hp.com [156.153.255.226])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5C74B4A18
	for <parisc-linux@lists.parisc-linux.org>; Fri,  2 Feb 2001 01:25:40 -0700 (MST)
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel3.hp.com (Postfix) with ESMTP id B90E750
	for <parisc-linux@lists.parisc-linux.org>; Fri,  2 Feb 2001 00:25:39 -0800 (PST)
Received: (from grundler@localhost)
	by milano.cup.hp.com (8.9.3 (PHNE_18546)/8.9.3 SMKit7.02) id AAA02312
	for parisc-linux@lists.parisc-linux.org; Fri, 2 Feb 2001 00:27:59 -0800 (PST)
Date: Fri, 2 Feb 2001 00:27:59 -0800 (PST)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200102020827.AAA02312@milano.cup.hp.com>
To: parisc-linux@lists.parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] calling PDC_PSW from head.S on A500
List-ID: <linux-parisc.vger.kernel.org>

To enable slave's properly, I need to call PDC to set the wide
mode as default (for trap handling). Thanks to jsm for getting
me this far. But it HPMC's in A500 PDC.
Any ideas what else I need to do?


"ser pim 0 HPMC" output is appended.
The CPU is clearly excuting PDC.
%r2 correctly contains the return ptr.
%r3 contains the PDC address called.
%sp points to a valid stack area. (virtual vs physical?)

To build, just need the two appended patches and a spanking new
XC (20010201) that Matt Taggart just posted (and will announce).

thanks,
grant


Index: include/asm-parisc/pdc.h
===================================================================
RCS file: /home/cvs/parisc/linux/include/asm-parisc/pdc.h,v
retrieving revision 1.23
diff -u -p -r1.23 pdc.h
--- pdc.h       2001/01/29 21:49:23     1.23
+++ pdc.h       2001/02/02 08:09:05
@@ -86,9 +86,9 @@
 #define PDC_TLB_SETUP          1       /* set up miss handling         */
  
 #define PDC_PSW                21              /* Get/Set default System Mask  */
-#define PDC_PSW_MASK            0L     /* Return mask                  */
-#define PDC_PSW_GET_DEFAULTS    1L     /* Return defaults              */
-#define PDC_PSW_SET_DEFAULTS    2L     /* Set default                  */
+#define PDC_PSW_MASK            0      /* Return mask                  */
+#define PDC_PSW_GET_DEFAULTS    1      /* Return defaults              */
+#define PDC_PSW_SET_DEFAULTS    2      /* Set default                  */
 #define PDC_PSW_ENDIAN_BIT     1       /* set for big endian           */
 #define PDC_PSW_WIDE_BIT       2       /* set for wide mode            */ 

Index: arch/parisc64/kernel/head.S
===================================================================
RCS file: /home/cvs/parisc/linux/arch/parisc64/kernel/head.S,v
retrieving revision 1.4
diff -u -p -r1.4 head.S
--- head.S	2001/01/28 13:39:15	1.4
+++ head.S	2001/02/02 08:03:55
@@ -21,6 +21,7 @@
 
 #include <asm/assembly.h>
 #include <asm/pgtable.h>
+#include <asm/pdc.h>		/* for PDC_PSW defines */
 
 
 	.level 2.0
@@ -97,6 +98,14 @@ $pgt_fill_loop:
 	/* And the stack pointer too */
 	load32		init_task_union+TASK_SZ_ALGN,%sp
 
+	/* Act like PDC just called us - that's how slave CPUs enter */
+#define MEM_PDC_LO 0x388
+#define MEM_PDC_HI 0x35C
+	ldw		MEM_PDC_LO(%r0),%arg0
+	ldw		MEM_PDC_HI(%r0),%arg1
+	depd,z		%arg1, 31, 32, %arg2	/* move to upper word */
+	or		%arg2, %arg0, %arg0	/* combine both parts */
+
 #ifdef CONFIG_SMP
 	/* Set the smp rendevous address into page zero.
 	** It would be safer to do this in init_smp_config() but
@@ -128,6 +137,22 @@ common_stext:
 	stw		%r0,0x10(%r0)	/* MEM_RENDEZ */
 	stw		%r0,0x28(%r0)	/* MEM_RENDEZ_HI */
 #endif
+
+	/* Set Wide mode as the "Default" (eg for traps)
+	** First trap occurs *right* after (or part of) rfi for slave CPUs
+	*/
+	copy		%arg0,%r3	/* save PDCE_PROC entry */
+
+	ldo		PDC_PSW(%r0),%arg0		/* 21 */
+	ldo		PDC_PSW_SET_DEFAULTS(%r0),%arg1	/* 2 */
+	ldo		PDC_PSW_WIDE_BIT(%r0),%arg2	/* 2 */
+
+	load32		stext_pdc_ret, %rp
+
+	bv		(%r3)
+	copy		%r0,%arg3
+
+stext_pdc_ret:
 
 	/* PARANOID: clear user scratch/user space SR's */
 	mtsp	%r0,%sr0




Firmware Version  40.50

Duplex Console IO Dependent Code (IODC) revision 1

------------------------------------------------------------------------------
   (c) Copyright 1995-2000, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

  Processor   Speed            State           CoProcessor State  Cache Size
  Number                                       State              Inst    Data
  ---------  --------   ---------------------  -----------------  ------------
      0      440  MHz   Active                 Functional         512 KB   1 MB
      1      440  MHz   Idle                   Functional         512 KB   1 MB

  Central Bus Speed (in MHz)  :        111
  Available Memory            :     262144  KB
  Good Memory Required        :      11468  KB

   Primary boot path:    0/0/1/1.15
   Alternate boot path:  0/0/2/1.15
   Console path:         0/0/4/0.0
   Keyboard path:        0/0/4/0.0

 WARNING:  The non-destructive test bit was set, so memory was not tested
            destructively.  Information only, no action required.


---- Main Menu ---------------------------------------------------------------

     Command                           Description
     -------                           -----------
     BOot [PRI|ALT|<path>]             Boot from specified path
     PAth [PRI|ALT] [<path>]           Display or modify a path
     SEArch [DIsplay|IPL] [<path>]     Search for boot devices

     COnfiguration menu                Displays or sets boot values
     INformation menu                  Displays hardware information
     SERvice menu                      Displays service commands

     DIsplay                           Redisplay the current menu
     HElp [<menu>|<command>]           Display help for menu or command
     RESET                             Restart the system
----
Main Menu: Enter command or menu > ser pim 0 hpmc

FIRMWARE INFORMATION

   Firmware Version:          40.50


PROCESSOR PIM INFORMATION


-----------------  Processor 0 HPMC Information - PDC Version: 40.50  ------

Timestamp =    Fri Feb  2 07:58:16 GMT 2001    (20:01:02:02:07:58:16)

HPMC Chassis Codes

       Chassis Code        Extension
       ------------        ---------
       0x0000082000ff6242  0x0000000000000000
       0x1800082011006312  0xcb81000000000000
       0x0000087000ff6292  0x0000000000000000
       0x6000082070006062  0x0000000000000010
       0x7000082070006082  0x0000000000392400
       0x7000082379006133  0xc1bff0fffed08040
       0x0000080080006310  0x0000000000000001
       0x000008008000631f  0x0000000000000000
       0x0000082000ff6442  0x0000000000000000
       0x0000082000ff6402  0x0000000000000000
       0x0000080080006300  0x0000000000000001
       0x7000082382006343  0x0000000000070200
       0x7000082382026343  0x0000000000070200
       0x7000082382046343  0x0000000000070200
       0x7000082382066343  0x0000000000070200
       0x0000080089006200  0x0000000000000000
       0x0000080086006200  0x0000000000000000
       0x000008008000630f  0x0000000000000000


General Registers 0 - 31
00-03  0000000000000000  000000f0f0043e88  00000000c01000d0  000000f0f0043c90
04-07  00000000002e6000  00000000002e7000  00000000069db9c0  0000000000000000
08-11  00000000c034c780  00000000c034c780  000000000050b500  00000000c032d940
12-15  00000000000000f2  00000000000000fa  00000000000000f0  00000000000000ff
16-19  0000000000504d6c  00000000c034c780  000000f0f0002aa4  0000000000000060
20-23  0000000000000060  0000000000000060  fffffffff8000005  0000000000000000
24-27  0000000000000002  00000000000000b0  0000000000000015  0000000000504d6c
28-31  0000000000000018  00000000c034c770  00000000c034c780  0300000000002204


Control Registers 0 - 31
00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000
08-11  0000000000000000  0000000000000000  0000000000000000  000000000000003f
12-15  0000000000000000  0000000000000000  0000000000000000  0000000000000000
16-19  000000108f74c3c7  00000000000000f0  000000f0f0044604  000000000d0012f0
20-23  0000000014340300  00000000d334c780  0000000008000008  0000000000000000
24-27  00000000002e6000  00000000002e6000  bffdfffffffffff7  0000000000000000
28-31  00000000c03212f0  0000000000000006  0000000000000000  0000000000000037

Space Registers 0 - 7
00-03  00000000          00000000          00000000          00000000
04-07  00000000          00000000          00000000          00000000


IIA Space (back entry)       = 0x00000000000000f0
IIA Offset (back entry)      = 0x000000f0f0044608
Check Type                   = 0x20000000
CPU State                    = 0x9e000004
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x0030103b
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0xfffffffffed00000
System Requestor Address     = 0xfffffffffffa0000


Floating Point Registers 0 - 31
00-03  0010080000000000  0000000000000000  0000000000000000  0000000000000000
04-07  0000000000000000  00000000c031aaf0  00000000cfc76080  00000000c031aaf0
08-11  0000000000000802  0000000000000060  00000000c037a040  00000000c032d944
12-15  000000000804000a  0000000000000001  00000000c0168d04  00000000cfff0000
16-19  00000000c02e5a00  00000000cfc76080  00000000cfff0000  0000000000000000
20-23  00000000c031aaf0  00000000c02e50c0  cccccccd00000094  00000000cccccccd
24-27  0000002f00000200  00000000cfcc1140  0000000000000034  0000000000000001
28-31  0000000000000010  0000000000000001  00000000c0145ef4  00000000c0373cb8


Check Summary                = 0xcb81000000000000
Available Memory             = 0x0000000010000000
CPU Diagnose Register 2      = 0x0300000000002204
CPU Status Register 0        = 0x2440c20000000000
CPU Status Register 1        = 0x8080000000000000
SADD LOG                     = 0x0320f9000d1112f0
Read Short LOG               = 0xc13ff0f0f0044678


--------------  Memory Error Log Information  --------------

Bus 0 Log Information

Timestamp =    Fri Feb  2 07:58:17 GMT 2001    (20:01:02:02:07:58:17)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
          X     ERR_ERROR       X            X

Bus Requestor Address      = 0xfffffffffffa0000
Bus Target Address         = 0x0000000000000000
Bus Responder Address      = 0xfffffffffed00000

Error Status Reg           = 0x0000000000000010
Runway Control Reg         = 0x0000021c00002818
Runway Address Reg         = 0xc1bff0fffed08040
Runway Data High Reg       = 0xf8018a1ff820ca01
Runway Data Low Reg        = 0xf8018a1ff820ca01
Memory Address Reg         = 0x000001ff3fffffff
Memory Address Corr Reg    = 0x000001ff3fffffff
Memory Syndrome Reg        = 0x0000000000000000
Memory Syndrome Corr Reg   = 0x0000000000000000



 Address/Control Parity Error Registers

   Address/Control Parity Error Bit (mem_addr_par_stat) Not Set



------------  I/O Module Error Log Information  ------------

Summary of IO subsystem log entries
-----------------------------------
                        Phys Loc             Vendor  Device   Severity
Description             (hex)                 Id      Id      CORR UNC FE  CW
-----------             -----                ------  ------   ----------------
System Bus Adapter RP  0x000000ffff04ff83   0x103c  0x1051              X
System Bus Adapter RP  0x000000ffff01ff83   0x103c  0x1051              X
System Bus Adapter RP  0x000000ffff02ff83   0x103c  0x1051              X
System Bus Adapter RP  0x000000ffff03ff83   0x103c  0x1051              X


Detail display of IO subsystem log entries
------------------------------------------

System Bus Adapter --       Rope Interface
------------------------------------------

Timestamp =    Fri Feb  2 07:58:17 GMT 2001    (20:01:02:02:07:58:17)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
               ERR_FUNCTION                      X

IO Requestor Address    = 0x0000000000000000
IO Target Address       = 0x0000000000000000
IO Responder Address    = 0x0000000000000000
IO Physical Location    = 0x000000ffffffff82
IO Hardware Path        = 0x00ffffffffffff00

Module Error Register   = 0x0000000000000000
Rope Physical Location  = 0x000000ffff04ff83

System Bus Adapter --       Rope Interface
------------------------------------------

Timestamp =    Fri Feb  2 07:58:17 GMT 2001    (20:01:02:02:07:58:17)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
               ERR_FUNCTION                      X

IO Requestor Address    = 0x0000000000000000
IO Target Address       = 0x0000000000000000
IO Responder Address    = 0x0000000000000000
IO Physical Location    = 0x000000ffffffff82
IO Hardware Path        = 0x00ffffffffffff00

Module Error Register   = 0x0000000000000000
Rope Physical Location  = 0x000000ffff01ff83

System Bus Adapter --       Rope Interface
------------------------------------------

Timestamp =    Fri Feb  2 07:58:17 GMT 2001    (20:01:02:02:07:58:17)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
               ERR_FUNCTION                      X

IO Requestor Address    = 0x0000000000000000
IO Target Address       = 0x0000000000000000
IO Responder Address    = 0x0000000000000000
IO Physical Location    = 0x000000ffffffff82
IO Hardware Path        = 0x00ffffffffffff00

Module Error Register   = 0x0000000000000000
Rope Physical Location  = 0x000000ffff02ff83

System Bus Adapter --       Rope Interface
------------------------------------------

Timestamp =    Fri Feb  2 07:58:17 GMT 2001    (20:01:02:02:07:58:17)

  OV  RQ  RS      ESTAT      A  C  D  corr  unc  fe  cw  pf
  --  --  --      -----      -  -  -  ----  ---  --  --  --
               ERR_FUNCTION                      X

IO Requestor Address    = 0x0000000000000000
IO Target Address       = 0x0000000000000000
IO Responder Address    = 0x0000000000000000
IO Physical Location    = 0x000000ffffffff82
IO Hardware Path        = 0x00ffffffffffff00

Module Error Register   = 0x0000000000000000
Rope Physical Location  = 0x000000ffff03ff83

Main Menu: Enter command or menu >

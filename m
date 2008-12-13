From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Fwd: [PATCH] fix mapping_writably_mapped()
Date: Sat, 13 Dec 2008 11:36:23 -0500 (EST)
Message-ID: <20081213163623.F1E694EA0@hiauly1.hia.nrc.ca>
References: <20081210214638.GA28696@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: kyle@infradead.org (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081210214638.GA28696@bombadil.infradead.org> from "Kyle McMartin" at Dec 10, 2008 04:46:38 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> This may explain some of the userspace issues we've been seeing.

There are still problems.  I built 2.6.28-rc8 using James' config for ion.
In my first attempt at building GCC, sh segfaulted in copy_word_list.
The kernel and sh then got into a continuous loop of SIGSEGVs filling
the file system with log messages.

  PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND           
27608 dave      20   0  3484 1304  512 R  100  0.0 519:33.44 sh                 

dave@mx3210:~$ strace -p 27608
Process 27608 attached - interrupt to quit
--- SIGSEGV (Segmentation fault) @ 0 (0) ---
rt_sigreturn()                          = 1746504
--- SIGSEGV (Segmentation fault) @ 0 (0) ---
rt_sigreturn()                          = 1746504
...

dave@mx3210:~$ gdb /bin/sh 27608
GNU gdb (GDB) 6.8.50.20080915-cvs
Copyright (C) 2008 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
and "show warranty" for details.
This GDB was configured as "hppa-unknown-linux-gnu".
For bug reporting instructions, please see:
<http://www.gnu.org/software/gdb/bugs/>...
(no debugging symbols found)
Attaching to program: /bin/sh, process 27608

Program received signal SIGSEGV, Segmentation fault.
Reading symbols from /lib/libncurses.so.5...(no debugging symbols found)...done.
Loaded symbols for /lib/libncurses.so.5
Reading symbols from /lib/libdl.so.2...(no debugging symbols found)...done.
Loaded symbols for /lib/libdl.so.2
Reading symbols from /lib/libc.so.6...
(no debugging symbols found)...done.
Loaded symbols for /lib/libc.so.6
Reading symbols from /lib/ld.so.1...(no debugging symbols found)...done.
Loaded symbols for /lib/ld.so.1

0x0004110c in copy_word_list ()
(gdb) bt
#0  0x0004110c in copy_word_list ()
#1  0x00052a5c in ?? ()
#2  0x0003a06c in ?? ()
#3  0x00037398 in execute_command_internal ()
#4  0x00036d24 in ?? ()
#5  0x00038284 in execute_command_internal ()
#6  0x00073994 in parse_and_execute ()
#7  0x0004d810 in command_substitute ()
#8  0x00051db0 in ?? ()
#9  0x000532c8 in ?? ()
#10 0x00056f18 in expand_string_assignment ()
#11 0x00050f14 in ?? ()
#12 0x000512cc in ?? ()
#13 0x00053220 in ?? ()
#14 0x0003a06c in ?? ()
#15 0x00037398 in execute_command_internal ()
#16 0x00038608 in execute_command ()
#17 0x000382f0 in execute_command_internal ()
#18 0x00038608 in execute_command ()
#19 0x000382f0 in execute_command_internal ()
#20 0x00038608 in execute_command ()
#21 0x000382f0 in execute_command_internal ()
#22 0x00038608 in execute_command ()
---Type <return> to continue, or q <return> to quit---
#23 0x000382f0 in execute_command_internal ()
#24 0x00038608 in execute_command ()
#25 0x00037f90 in execute_command_internal ()
#26 0x00038608 in execute_command ()
#27 0x000279a8 in reader_loop ()
#28 0x000274fc in main ()
(gdb) c
Continuing.

Program received signal SIGSEGV, Segmentation fault.
0x0004110c in copy_word_list ()
(gdb) c
Continuing.

Program received signal SIGSEGV, Segmentation fault.
0x0004110c in copy_word_list ()
(gdb) p/x $pc
$1 = 0x4110c
(gdb) disass 0x410fc 0x4111c
Dump of assembler code from 0x410fc to 0x4111c:
0x000410fc <copy_word_list+20>:	movb,= r26,r3,0x41158 <copy_word_list+112>
0x00041100 <copy_word_list+24>:	ldi 0,r5
0x00041104 <copy_word_list+28>:	ldw 4(r3),r4
0x00041108 <copy_word_list+32>:	b,l 0x32be4 <make_bare_word>,rp
0x0004110c <copy_word_list+36>:	ldw 0(r4),r26
0x00041110 <copy_word_list+40>:	ldw 4(r4),r19
0x00041114 <copy_word_list+44>:	copy r5,r25
0x00041118 <copy_word_list+48>:	stw r19,4(ret0)
End of assembler dump.
(gdb) p/x $r4
$2 = 0x0
(gdb) disass
Dump of assembler code for function copy_word_list:
0x000410e8 <copy_word_list+0>:	stw rp,-14(sp)
0x000410ec <copy_word_list+4>:	ldi 0,r19
0x000410f0 <copy_word_list+8>:	stw,ma r5,40(sp)
0x000410f4 <copy_word_list+12>:	stw r4,-3c(sp)
0x000410f8 <copy_word_list+16>:	stw r3,-38(sp)
0x000410fc <copy_word_list+20>:	movb,= r26,r3,0x41158 <copy_word_list+112>
0x00041100 <copy_word_list+24>:	ldi 0,r5
0x00041104 <copy_word_list+28>:	ldw 4(r3),r4
0x00041108 <copy_word_list+32>:	b,l 0x32be4 <make_bare_word>,rp
0x0004110c <copy_word_list+36>:	ldw 0(r4),r26
0x00041110 <copy_word_list+40>:	ldw 4(r4),r19
0x00041114 <copy_word_list+44>:	copy r5,r25
0x00041118 <copy_word_list+48>:	stw r19,4(ret0)
0x0004111c <copy_word_list+52>:	b,l 0x32278 <make_word_list>,rp
0x00041120 <copy_word_list+56>:	copy ret0,r26
0x00041124 <copy_word_list+60>:	ldw 0(r3),r3
0x00041128 <copy_word_list+64>:	cmpib,<> 0,r3,0x41104 <copy_word_list+28>
0x0004112c <copy_word_list+68>:	copy ret0,r5
0x00041130 <copy_word_list+72>:	cmpib,= 0,ret0,0x41158 <copy_word_list+112>
0x00041134 <copy_word_list+76>:	copy ret0,r19
0x00041138 <copy_word_list+80>:	ldw 0(ret0),ret0
0x0004113c <copy_word_list+84>:	cmpib,= 0,ret0,0x41158 <copy_word_list+112>
---Type <return> to continue, or q <return> to quit---q
Quit
(gdb) p/x $r3
$3 = 0xd0e3c
(gdb) x/4x 0xd0e3c
0xd0e3c <error_trace_mode>:	0x00000000	0x00000000	0x000e1928	0x0019b2c8

Dec 13 01:32:21 mx3210 kernel: 
Dec 13 01:32:21 mx3210 kernel: do_page_fault() pid=27608 command='sh' type=15 address=0x00000000
Dec 13 01:32:21 mx3210 kernel: 
Dec 13 01:32:21 mx3210 kernel:      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
Dec 13 01:32:21 mx3210 kernel: PSW: 00000000000011100000000000001111 Tainted: G        W 
Dec 13 01:32:21 mx3210 kernel: r00-03  00000000000e000f 00000000000d06a0 0000000000041113 00000000000d0e3c
Dec 13 01:32:21 mx3210 kernel: r04-07  0000000000000000 00000000001aa648 00000000000200b0 000000000019a508
Dec 13 01:32:21 mx3210 kernel: r08-11  00000000000d06a0 0000000000000001 00000000000c9ea0 00000000000d3b60
Dec 13 01:32:21 mx3210 kernel: r12-15  0000000000000000 0000000000000000 00000000000c9ea0 000000000000001f
Dec 13 01:32:21 mx3210 kernel: r16-19  00000000000d06a0 0000000000000001 0000000000000003 00000000001aa648
Dec 13 01:32:21 mx3210 kernel: r20-23  000000000019a1d2 0000000040762614 000000000019a1d2 0000000000000001
Dec 13 01:32:21 mx3210 kernel: r24-27  000000000000000b 0000000000000000 000000000019a588 00000000000c9ea0
Dec 13 01:32:21 mx3210 kernel: r28-31  00000000001aa648 0000000000000040 00000000faff4800 0000000000000003
Dec 13 01:32:21 mx3210 kernel: sr00-03  0000000001b4e800 0000000000000000 0000000000000000 0000000001b4e800
Dec 13 01:32:21 mx3210 kernel: sr04-07  0000000001b4e800 0000000001b4e800 0000000001b4e800 0000000001b4e800
Dec 13 01:32:21 mx3210 kernel: 
Dec 13 01:32:21 mx3210 kernel:       VZOUICununcqcqcqcqcqcrmunTDVZOUI
Dec 13 01:32:21 mx3210 kernel: FPSR: 00000000000000000000000000000000
Dec 13 01:32:21 mx3210 kernel: FPER1: 00000000
Dec 13 01:32:21 mx3210 kernel: fr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
Dec 13 01:32:21 mx3210 kernel: fr04-07  fffffffffffff000 0000000000000000 ffffffffffffff9c bff0000000000000
Dec 13 01:32:21 mx3210 kernel: fr08-11  0000000000000000 00000000405b4760 000000Dec 12 23:11:11 mx3210 kernel: sd 1:0:2:0: [sdb] Mode Sense: ab 00 10 08
Dec 12 23:11:11 mx3210 kernel: sd 1:0:2:0: [sdb] Mode Sense: ab 00 10 08Dec 13 01:32:21 mx3210 kernel: 
Dec 13 01:32:21 mx3210 kernel: do_page_fault() pid=27608 command='sh' type=15 address=0x00000000
Dec 13 01:32:21 mx3210 kernel: Dec 13 01:32:21 mx3210 kernel:      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
Dec 13 01:32:21 mx3210 kernel: PSW: 00000000000011100000000000001111 Tainted: G        W 
Dec 13 01:32:21 mx3210 kernel: r00-03  00000000000e000f 00000000000d06a0 0000000000041113 00000000000d0e3c
Dec 13 01:32:21 mx3210 kernel: r04-07  0000000000000000 00000000001aa648 0000000
0000200b0 000000000019a508Dec 13 01:32:21 mx3210 kernel: r08-11  00000000000d06a0 0000000000000001 0000000
0000c9ea0 00000000000d3b60Dec 13 01:32:21 mx3210 kernel: r12-15  0000000000000000 0000000000000000 0000000
0000c9ea0 000000000000001fDec 13 01:32:21 mx3210 kernel: r16-19  00000000000d06a0 0000000000000001 0000000
000000003 00000000001aa648
Dec 13 01:32:21 mx3210 kernel: r20-23  000000000019a1d2 0000000040762614 0000000
00019a1d2 0000000000000001
Dec 13 01:32:21 mx3210 kernel: r24-27  000000000000000b 0000000000000000 0000000
00019a588 00000000000c9ea0
Dec 13 01:32:21 mx3210 kernel: r28-31  00000000001aa648 0000000000000040 00000000faff4800 0000000000000003
Dec 13 01:32:21 mx3210 kernel: sr00-03  0000000001b4e800 0000000000000000 0000000000000000 0000000001b4e800
Dec 13 01:32:21 mx3210 kernel: sr04-07  0000000001b4e800 0000000001b4e800 0000000001b4e800 0000000001b4e800
Dec 13 01:32:21 mx3210 kernel: 
Dec 13 01:32:21 mx3210 kernel:       VZOUICununcqcqcqcqcqcrmunTDVZOUI
Dec 13 01:32:21 mx3210 kernel: FPSR: 00000000000000000000000000000000
Dec 13 01:32:21 mx3210 kernel: FPER1: 00000000
Dec 13 01:32:21 mx3210 kernel: fr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
Dec 13 01:32:21 mx3210 kernel: fr04-07  fffffffffffff000 0000000000000000 ffffffffffffff9c bff0000000000000
Dec 13 01:32:21 mx3210 kernel: fr08-11  0000000000000000 00000000405b4760 0000000000000802 00000000405f2000
Dec 13 01:32:21 mx3210 kernel: fr12-15  00000000401c61b8 00000000405b4760 00000000401c4114 000000007f410d00
Dec 13 01:32:21 mx3210 kernel: fr16-19  000000007f4acb90 000000007f410d00 000000007f54c000 000000007f54c000
Dec 13 01:32:21 mx3210 kernel: fr20-23  00000000405b4760 00000000404a91d8 0000000000000040 0000000000000000
Dec 13 01:32:21 mx3210 kernel: fr24-27  0000000000000000 00000000405b4760 00000000405b4760 0000000000000000
Dec 13 01:32:21 mx3210 kernel: fr28-31  0000000000000803 0000000000000000 00000000405b4760 0000000000000803
Dec 13 01:32:21 mx3210 kernel: 
Dec 13 01:32:21 mx3210 kernel: IASQ: 0000000001b4e800 0000000001b4e800 IAOQ: 000000000004110f 0000000000032be7
Dec 13 01:32:21 mx3210 kernel:  IIR: 0c80109a    ISR: 0000000001b4e800  IOR: 0000000000000000
Dec 13 01:32:21 mx3210 kernel:  CPU:        1   CR30: 0000000044494000 CR31: ffffffffffffffff
Dec 13 01:32:21 mx3210 kernel:  ORIG_R28: 0000000000000000
Dec 13 01:32:21 mx3210 kernel:  IAOQ[0]: 000000000004110f
Dec 13 01:32:21 mx3210 kernel:  IAOQ[1]: 0000000000032be7
Dec 13 01:32:21 mx3210 kernel:  RP(r2): 0000000000041113
Dec 13 01:32:21 mx3210 kernel: 
Dec 13 01:32:21 mx3210 kernel: do_page_fault() pid=27608 command='sh' type=15 address=0x00000000
...

This might be a bash bug.

WORD_DESC *
copy_word (w)
     WORD_DESC *w;
{
  WORD_DESC *new_word;

  new_word = make_bare_word (w->word);
  new_word->flags = w->flags;
  return (new_word);
}

/* Copy the chain of words in LIST.  Return a pointer to
   the new chain. */
WORD_LIST *
copy_word_list (list)
     WORD_LIST *list;
{
  WORD_LIST *new_list;

  for (new_list = (WORD_LIST *)NULL; list; list = list->next)
    new_list = make_word_list (copy_word (list->word), new_list);

  return (REVERSE_LIST (new_list, WORD_LIST *));
}

There's no check that list->word isn't NULL.  However, allocation failures
are supposed to be caught by xmalloc.  So, it's not obvious how a NULL
pointer actually arises.

There's also a puzzle as to why bash tries to continue after the segv,
possibly at the faulting insn.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0729F482A
	for <parisc-linux@parisc-linux.org>; Sat, 28 Apr 2001 14:50:10 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14tbf8-000548-00
	for parisc-linux@parisc-linux.org; Sat, 28 Apr 2001 21:49:54 +0100
Date: Sat, 28 Apr 2001 21:49:54 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@parisc-linux.org
Message-ID: <20010428214954.B15328@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] gdb segfault
List-ID: <linux-parisc.vger.kernel.org>

compiled gdb myself out of current cvs tree.

(gdb) break gen_steps
Breakpoint 2 at 0x11744: file gconv_db.c, line 210.
(gdb) run
The program being debugged has been started already.
Start it from the beginning? (y or n) n
Program not restarted.
Segmentation fault


do_page_fault() pid=4246 command='gdb' type=15 address=0x000000a8               
                                                                                
     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI                                           
PSW: 00000000000001000000001100001111                                           
r0-3     0000000000000000 00000000001d23f8 00000000400e4a0f 0000000000000000    
r4-7     00000000401d761c 00000000401d761c 00000000001d2d8e 0000000000000002    
r8-11    00000000001d339e 0000000000093210 0000000000099e50 000000000008a7b0    
r12-15   0000000000000000 0000000000000000 00000000000a87f0 0000000000000000    
r16-19   0000000000000000 0000000000038f00 0000000000000004 00000000401d761c    
r20-23   ffffffffbfe28a03 00000000400e49e8 0000000000072254 00000000401d2a18    
r24-27   0000000000000003 00000000401d761c 0000000000000000 00000000001cbbf8    
r28-31   0000000000000000 00000000002ecbb0 000000007ff005c0 000000000008e00f    
sr0-3    000000000000b780 000000000000b780 0000000000000000 0000000000300e00    
sr4-7    0000000000300e00 0000000000300e00 0000000000300e00 0000000000300e00    
                                                                                
IASQ: 0000000000300e00 0000000000300e00 IAOQ: 00000000400e4a0f 00000000400e4a13 
 IIR: 48740150    ISR: 0000000000300e00  IOR: 00000000000000a8                  
ORIG_R28: 0000000000000000                                                      


-- 
Revolutions do not require corporate support.

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hauptpostamt.charite.de (hauptpostamt.charite.de [193.175.73.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 88302485B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Feb 2002 10:21:40 -0700 (MST)
Received: from localhost (localhost [127.0.0.1])
	by hauptpostamt.charite.de (Postfix) with ESMTP id BFA6315C00C
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Feb 2002 18:21:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hauptpostamt.charite.de (Postfix) with SMTP id 6802815C00E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Feb 2002 18:21:38 +0100 (CET)
Received: from postamt1.charite.de (postamt1.charite.de [193.175.66.246])
	by hauptpostamt.charite.de (Postfix) with ESMTP id 5D00E15C00C
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Feb 2002 18:21:38 +0100 (CET)
Date: Fri, 22 Feb 2002 18:21:37 +0100
From: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20020222172137.GC25954@charite.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Strange Kernel messages in kern.log
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

What is the meaning of these?
At the time this happened, the machine was not used. The Apache
error.log says:

[Fri Feb 22 06:27:12 2002] [notice] SIGUSR1 received.  Doing graceful restart
[Fri Feb 22 06:27:15 2002] [notice] Apache/1.3.22 (Unix) Debian GNU/Linux configured -- resuming normal operations
[Fri Feb 22 06:27:15 2002] [notice] Accept mutex: sysvsem (Default: sysvsem)
[Fri Feb 22 06:27:15 2002] [notice] child pid 303 exit signal Segmentation fault (11)
[Fri Feb 22 06:27:15 2002] [notice] child pid 302 exit signal Segmentation fault (11)
[Fri Feb 22 06:27:15 2002] [notice] child pid 300 exit signal Segmentation fault (11)
[Fri Feb 22 06:27:15 2002] [notice] child pid 299 exit signal Segmentation fault (11)
[Fri Feb 22 06:27:15 2002] [notice] child pid 298 exit signal Segmentation fault (11)

I guess cron.daily must have kicked in, but why would apache crash on
a restart?

Feb 22 06:27:14 gecko kernel: 
Feb 22 06:27:14 gecko kernel: do_page_fault() pid=298 command='apache' type=7 address=0x40380ad3
Feb 22 06:27:14 gecko kernel: vm_start = 0x40380000, vm_end = 0x40382000
Feb 22 06:27:14 gecko kernel: 
Feb 22 06:27:14 gecko kernel:      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
Feb 22 06:27:14 gecko kernel: PSW: 00000000000001000000000000001111 Not tainted
Feb 22 06:27:14 gecko kernel: r00-03  00000000 400263e0 4038119f faf00600
Feb 22 06:27:14 gecko kernel: r04-07  40391588 faf0068c 00079ec0 0000006c
Feb 22 06:27:14 gecko kernel: r08-11  00000006 faf0066c 00000002 0000000f
Feb 22 06:27:14 gecko kernel: r12-15  faf0068c ffffffc4 40026604 00061700
Feb 22 06:27:14 gecko kernel: r16-19  00066700 00049000 00066700 40391588
Feb 22 06:27:14 gecko kernel: r20-23  00000001 40391588 40381184 400263f4
Feb 22 06:27:14 gecko kernel: r24-27  40026604 40381184 00079ec0 00061700
Feb 22 06:27:14 gecko kernel: r28-31  40027902 000003b5 faf00740 4000d2bb
Feb 22 06:27:14 gecko kernel: sr0-3   0000043b 0000043b 00000000 0000043b
Feb 22 06:27:14 gecko kernel: sr4-7   0000043b 0000043b 0000043b 0000043b
Feb 22 06:27:14 gecko kernel: 
Feb 22 06:27:14 gecko kernel: IASQ: 0000043b 0000043b IAOQ: 40380ad3 40380ad7
Feb 22 06:27:14 gecko kernel:  IIR: 08000240    ISR: 0000043b  IOR: 40380adc
Feb 22 06:27:14 gecko kernel:  CPU:        0   CR30: 10bd0000 CR31: 10330000
Feb 22 06:27:14 gecko kernel:  ORIG_R28: faf00798
Feb 22 06:27:14 gecko kernel: 
Feb 22 06:27:14 gecko kernel: do_page_fault() pid=299 command='apache' type=7 address=0x40380ad3
Feb 22 06:27:14 gecko kernel: vm_start = 0x40380000, vm_end = 0x40382000
Feb 22 06:27:14 gecko kernel: 
Feb 22 06:27:14 gecko kernel:      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
Feb 22 06:27:14 gecko kernel: PSW: 00000000000001000000000000001111 Not tainted
Feb 22 06:27:14 gecko kernel: r00-03  00000000 400263e0 4038119f faf00600
Feb 22 06:27:15 gecko kernel: r04-07  40391588 faf0068c 00079ec0 0000006c
Feb 22 06:27:15 gecko kernel: r08-11  00000006 faf0066c 00000002 0000000f
Feb 22 06:27:15 gecko kernel: r12-15  faf0068c ffffffc4 40026604 00061700
Feb 22 06:27:15 gecko kernel: r16-19  00066700 00049000 00066700 40391588
Feb 22 06:27:15 gecko kernel: r20-23  00000001 40391588 40381184 400263f4
Feb 22 06:27:15 gecko kernel: r24-27  40026604 40381184 00079ec0 00061700
Feb 22 06:27:15 gecko kernel: r28-31  40027902 000003b5 faf00740 4000d2bb
Feb 22 06:27:15 gecko kernel: sr0-3   0000043d 0000043d 00000000 0000043d
Feb 22 06:27:15 gecko kernel: sr4-7   0000043d 0000043d 0000043d 0000043d
Feb 22 06:27:15 gecko kernel: 
Feb 22 06:27:15 gecko kernel: IASQ: 0000043d 0000043d IAOQ: 40380ad3 40380ad7
Feb 22 06:27:15 gecko kernel:  IIR: 08000240    ISR: 0000043d  IOR: 40380adc
Feb 22 06:27:15 gecko kernel:  CPU:        0   CR30: 10b8c000 CR31: 10330000
Feb 22 06:27:15 gecko kernel:  ORIG_R28: faf00798
Feb 22 06:27:15 gecko kernel: 
Feb 22 06:27:15 gecko kernel: do_page_fault() pid=303 command='apache' type=7 address=0x40380ad3
Feb 22 06:27:15 gecko kernel: vm_start = 0x40380000, vm_end = 0x40382000
Feb 22 06:27:15 gecko kernel: 
Feb 22 06:27:15 gecko kernel:      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
Feb 22 06:27:15 gecko kernel: PSW: 00000000000001000000000000001111 Not tainted
Feb 22 06:27:15 gecko kernel: r00-03  00000000 400263e0 4038119f faf00600
Feb 22 06:27:15 gecko kernel: r04-07  40391588 faf0068c 00079ec0 0000006c
Feb 22 06:27:15 gecko kernel: r08-11  00000006 faf0066c 00000002 0000000f
Feb 22 06:27:15 gecko kernel: r12-15  faf0068c ffffffc4 40026604 00061700
Feb 22 06:27:15 gecko kernel: r16-19  00066700 00049000 00066700 40391588
Feb 22 06:27:15 gecko kernel: r20-23  00000001 40391588 40381184 400263f4
Feb 22 06:27:15 gecko kernel: r24-27  40026604 40381184 00079ec0 00061700
Feb 22 06:27:15 gecko kernel: r28-31  40027902 000003b5 faf00740 4000d2bb
Feb 22 06:27:15 gecko kernel: sr0-3   00000446 00000446 00000000 00000446
Feb 22 06:27:15 gecko kernel: sr4-7   00000446 00000446 00000446 00000446
Feb 22 06:27:15 gecko kernel: 
Feb 22 06:27:15 gecko kernel: IASQ: 00000446 00000446 IAOQ: 40380ad3 40380ad7
Feb 22 06:27:15 gecko kernel:  IIR: 08000240    ISR: 00000446  IOR: 40380adc
Feb 22 06:27:15 gecko kernel:  CPU:        0   CR30: 10b44000 CR31: 10330000
Feb 22 06:27:15 gecko kernel:  ORIG_R28: faf00798
Feb 22 06:27:15 gecko kernel: 
Feb 22 06:27:15 gecko kernel: do_page_fault() pid=302 command='apache' type=7 address=0x40380ad3
Feb 22 06:27:15 gecko kernel: vm_start = 0x40380000, vm_end = 0x40382000
Feb 22 06:27:15 gecko kernel: 
Feb 22 06:27:15 gecko kernel:      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
Feb 22 06:27:15 gecko kernel: PSW: 00000000000001000000000000001111 Not tainted
Feb 22 06:27:15 gecko kernel: r00-03  00000000 400263e0 4038119f faf00600
Feb 22 06:27:15 gecko kernel: r04-07  40391588 faf0068c 00079ec0 0000006c
Feb 22 06:27:15 gecko kernel: r08-11  00000006 faf0066c 00000002 0000000f
Feb 22 06:27:15 gecko kernel: r12-15  faf0068c ffffffc4 40026604 00061700
Feb 22 06:27:15 gecko kernel: r16-19  00066700 00049000 00066700 40391588
Feb 22 06:27:15 gecko kernel: r20-23  00000001 40391588 40381184 400263f4
Feb 22 06:27:15 gecko kernel: r24-27  40026604 40381184 00079ec0 00061700
Feb 22 06:27:15 gecko kernel: r28-31  40027902 000003b5 faf00740 4000d2bb
Feb 22 06:27:15 gecko kernel: sr0-3   00000444 00000444 00000000 00000444
Feb 22 06:27:15 gecko kernel: sr4-7   00000444 00000444 00000444 00000444
Feb 22 06:27:15 gecko kernel: 
Feb 22 06:27:15 gecko kernel: IASQ: 00000444 00000444 IAOQ: 40380ad3 40380ad7
Feb 22 06:27:15 gecko kernel:  IIR: 08000240    ISR: 00000444  IOR: 40380adc
Feb 22 06:27:15 gecko kernel:  CPU:        0   CR30: 10b0c000 CR31: 10330000
Feb 22 06:27:15 gecko kernel:  ORIG_R28: faf00798
Feb 22 06:27:15 gecko kernel: 
Feb 22 06:27:15 gecko kernel: do_page_fault() pid=300 command='apache' type=7 address=0x40380ad3
Feb 22 06:27:15 gecko kernel: vm_start = 0x40380000, vm_end = 0x40382000
Feb 22 06:27:15 gecko kernel: 
Feb 22 06:27:15 gecko kernel:      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
Feb 22 06:27:15 gecko kernel: PSW: 00000000000001000000000000001111 Not tainted
Feb 22 06:27:15 gecko kernel: r00-03  00000000 400263e0 4038119f faf00600
Feb 22 06:27:15 gecko kernel: r04-07  40391588 faf0068c 00079ec0 0000006c
Feb 22 06:27:15 gecko kernel: r08-11  00000006 faf0066c 00000002 0000000f
Feb 22 06:27:15 gecko kernel: r12-15  faf0068c ffffffc4 40026604 00061700
Feb 22 06:27:15 gecko kernel: r16-19  00066700 00049000 00066700 40391588
Feb 22 06:27:15 gecko kernel: r20-23  00000001 40391588 40381184 400263f4
Feb 22 06:27:15 gecko kernel: r24-27  40026604 40381184 00079ec0 00061700
Feb 22 06:27:15 gecko kernel: r28-31  40027902 000003b5 faf00740 4000d2bb
Feb 22 06:27:15 gecko kernel: sr0-3   0000043f 0000043f 00000000 0000043f
Feb 22 06:27:15 gecko kernel: sr4-7   0000043f 0000043f 0000043f 0000043f
Feb 22 06:27:15 gecko kernel: 
Feb 22 06:27:15 gecko kernel: IASQ: 0000043f 0000043f IAOQ: 40380ad3 40380ad7
Feb 22 06:27:15 gecko kernel:  IIR: 08000240    ISR: 0000043f  IOR: 40380adc
Feb 22 06:27:15 gecko kernel:  CPU:        0   CR30: 10bdc000 CR31: 10330000
Feb 22 06:27:15 gecko kernel:  ORIG_R28: faf00798

-- 
Ralf Hildebrandt (Im Auftrag des Referat V A)   Ralf.Hildebrandt@charite.de
Charite Campus Virchow-Klinikum                 Tel.  +49 (0)30-450 570-155
Referat V A - Kommunikationsnetze -             Fax.  +49 (0)30-450 570-916
C(++) is a write-only, high-level assembler language. -- Stefan Van Baelen.

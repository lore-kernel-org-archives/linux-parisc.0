Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA04735
	for <parisc-linux@puffin.external.hp.com>; Thu, 16 Sep 1999 16:05:30 -0600
Received: from milano.cup.hp.com (root@milano.cup.hp.com [15.16.124.11])
	by palrel3.hp.com (8.8.6 (PHNE_17135)/8.8.5tis) with ESMTP id PAA24548
	for <parisc-linux@thepuffingroup.com>; Thu, 16 Sep 1999 15:00:05 -0700 (PDT)
Received: from localhost (grundler@localhost [127.0.0.1]) by milano.cup.hp.com with SMTP (8.8.6 (PHNE_14041)/8.7.3 TIS Messaging 5.0) id OAA21289 for <parisc-linux@thepuffingroup.com>; Thu, 16 Sep 1999 14:58:14 -0700 (PDT)
Message-Id: <199909162158.OAA21289@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Date: Thu, 16 Sep 1999 14:58:14 -0700
From: Grant Grundler <grundler@cup.hp.com>
Subject: [parisc-linux] 715/100 data page fault and msg output
List-ID: <linux-parisc.vger.kernel.org>


Here's the output from the 715/100 followed by some comments:

...
mem_init 0xC01667E0 0xC1000000
mem_map c0116000
&_stext c0010000
&_data_start c0071000
start_mem c0167000
Memory: 14948k available (388k kernel code, 984k data, 64k init) [c0000000,c1000000]
here
here
here
here
here
here
here
here
here
here
VM test
c007640c c0013288 c0076000
POSIX conformance testing by UNIFIX
do_basic setup 2
do_basic setup 2
interrupted with code 15, regs c0076874
IAOQ: c0067c4c c0067c50
ISR: 00000000 IOR: c00167a8 IIR: 02a008b8
ior 00000004
sp c0076ac0
c0078000 c0078000
bad pgd 00000000 at c0078000
address 00000004 (vma)
vma 00000000
bad_area
bad address 00000004

PSW  : 0004000b  GR 1 : 00000000  GR 2 : 00014de8  GR 3 : c0079000  
GR 4 : c0079000  GR 5 : c010dd48  GR 6 : c00fe000  GR 7 : c0105800  
GR 8 : 00002000  GR 9 : 00000008  GR10 : c0015e84  GR11 : fc3ffe1f  
GR12 : 00000000  GR13 : 00000001  GR14 : 0000000a  GR15 : f0000704  
GR16 : f000b858  GR17 : 00000002  GR18 : 00000000  GR19 : c00eb92c  
GR20 : 0001aa03  GR21 : f0105800  GR22 : 00000000  GR23 : 00000060  
GR24 : f0105800  GR25 : 00000001  GR26 : c00ddc8c  GR27 : c0071000  
GR28 : 00000000  GR29 : 00000000  GR30 : 00000000  GR31 : c0017840  
SR0  : 00000000  SR1  : 00000000  SR2  : 00000000  SR3  : 00000000  
SR4  : 00000000  SR5  : 00000000  SR6  : 00000000  SR7  : 00000000  
IAOQ : c0067c4c c0067c50
SHR 1: 50000800  SHR 8: 00000008  SHR 9: c00d7000  SHR16: c0076874  
SHR17: 00000002  SHR24: f0105800  SHR25: 00000001  
Kernel panic: bad address

In swapper task - not syncing
================================================

I think this is a "Data Page Fault". The processor tried to
access an address which wasn't valid in the Page directory.
Couple of things in the trap handler would help here:
o More white space - makes what to cut/paste easier to determine
o clear text describing the fault
o In this case the offending instruction and a stack trace.
o printing the invalid address, IOAQ and general registers was good
o a message about please reset the machine to restart or something
  like that.

On a different note, the kernel prints lots of useful stuff along
with plenty of garbage. As a general rule, I would like to propose
folks use file name and line number instead of "here" and "Heya".
Remember we will be debugging stuff via other folks console output
quite a bit.

thanks,
grant

ps. Alex showed me the "la la la" work around in init_task.c.
   Is anyone already working to make this a runtime check?

Grant Grundler
Communications Infrastructure Computer Operations
+1.408.447.7253

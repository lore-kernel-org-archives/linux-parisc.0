Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA04954
	for <parisc-linux@puffin.external.hp.com>; Thu, 16 Sep 1999 16:30:26 -0600
Date: Fri, 17 Sep 1999 00:32:09 +0200
From: Philipp Rumpf <prumpf@suse.de>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715/100 data page fault and msg output
Message-ID: <19990917003209.H8112@suse.de>
References: <199909162158.OAA21289@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199909162158.OAA21289@milano.cup.hp.com>; from Grant Grundler on Thu, Sep 16, 1999 at 02:58:14PM -0700
List-ID: <linux-parisc.vger.kernel.org>

> bad address 00000004
> 
> PSW  : 0004000b  GR 1 : 00000000  GR 2 : 00014de8  GR 3 : c0079000  
> GR 4 : c0079000  GR 5 : c010dd48  GR 6 : c00fe000  GR 7 : c0105800  
> GR 8 : 00002000  GR 9 : 00000008  GR10 : c0015e84  GR11 : fc3ffe1f  
> GR12 : 00000000  GR13 : 00000001  GR14 : 0000000a  GR15 : f0000704  
> GR16 : f000b858  GR17 : 00000002  GR18 : 00000000  GR19 : c00eb92c  
> GR20 : 0001aa03  GR21 : f0105800  GR22 : 00000000  GR23 : 00000060  
> GR24 : f0105800  GR25 : 00000001  GR26 : c00ddc8c  GR27 : c0071000  
> GR28 : 00000000  GR29 : 00000000  GR30 : 00000000  GR31 : c0017840  
> SR0  : 00000000  SR1  : 00000000  SR2  : 00000000  SR3  : 00000000  
> SR4  : 00000000  SR5  : 00000000  SR6  : 00000000  SR7  : 00000000  
> IAOQ : c0067c4c c0067c50
> SHR 1: 50000800  SHR 8: 00000008  SHR 9: c00d7000  SHR16: c0076874  
> SHR17: 00000002  SHR24: f0105800  SHR25: 00000001  
> Kernel panic: bad address
> 
> In swapper task - not syncing
> ================================================

This is a NULL pointer, and most probably a bug in the CVS tree that is
already fixed in my tree.  I will send a diff between the trees to the
list later.

> Couple of things in the trap handler would help here:
> o More white space - makes what to cut/paste easier to determine
> o clear text describing the fault
> o In this case the offending instruction and a stack trace.
> o printing the invalid address, IOAQ and general registers was good

basically look at what the x86 port does and implement it.

> On a different note, the kernel prints lots of useful stuff along
> with plenty of garbage. As a general rule, I would like to propose
> folks use file name and line number instead of "here" and "Heya".
> Remember we will be debugging stuff via other folks console output
> quite a bit.

Remember most of the messages will disappear soon (many of them as soon
as Alex finishes moving the tree to 2.2.12).  I do not intend to waste
my time changing anything outside of arch/parisc and include/asm-parisc
because that will mostly be replaced by the linus versions.

> ps. Alex showed me the "la la la" work around in init_task.c.
>    Is anyone already working to make this a runtime check?

you cannot.  not without major pain at least


	Philipp Rumpf

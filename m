Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from intro.peace.co.nz (intro.peace.co.nz [202.14.141.227])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1C717482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  9 May 2002 16:42:48 -0600 (MDT)
From: "James Braid" <james.braid@peace.com>
To: "'Grant Grundler'" <grundler@dsl2.external.hp.com>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] Re: Dodgy SCSI in L2000
Date: Fri, 10 May 2002 10:46:17 +1200
Message-ID: <00b001c1f7ab$571903d0$5e01000a@bongo>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
In-Reply-To: <20020509165445.7A515482A@dsl2.external.hp.com>
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

 
-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

> The fault was caused at 0x0000000010108fe0 - I need to see the
> matching vmlinux and System.map to determine where this is in
> the code.
> 

Ah, mind if send you the vmlinux and System.map off-list?


> When the box freezes, do "tc" from GSP. On reboot, at PDC prompt
> type "ser pim" to get the state of the machine when it was TC'd.
> Once you've saved the PIM dump, it's good to clear PIM.
> (iirc, "ser clearpim")
> Again, save matching Sysytem.map and vmlinux.
> 

> IIRC, setting _SYNC parameter to 10 is equivalent to "fast".

Okay, I will try that and put a new kernel in.
 
> oic. In cases like this, we have to disable Stack Dumping since
> it data page faults. I suspect that's what's happened in the
> previous dumps too. You can disable stack dumps by changing "#if 1"
> to "#if 0" on line 149 (show_stack()) in
> arch/parisc/kernel/traps.c.  

I will disable that as well and put a new kernel in.

> BTW, typically this msg means a kernel driver is attempting 
> to directly
> access user space data instead of copying the data into kernel
> space.  

That sounds nasty...

> > so I cranked it up to dbench 100. That crashed nicely with 
> this panic:
> > 
> > Dumping Stack from 0x0000000056390000 to 0x0000000056390000:
> > 
> > Kernel Fault: Code=15 regs=0000000046390000
> > (Addr=0000000056388018) 
> 
> did you get the "Stack pointer and cr30 do not correspond!" 
> msg before this?

Yep, I did get the "Stack pointer..." stuff before this, I left it
off the email though.

> Me either since I've not seen this problem. This does sound like
> the SCSI interface driver is hitting a corner case and dying there.
> But that's just a SWAG.
> 
> I'll have to get dbench and try it on the a500 when that's
> available.  

Cool.

Thanks, James.

-----BEGIN PGP SIGNATURE-----
Version: PGP 7.1.1

iQA/AwUBPNr8OFW+bhIOiSqWEQLoTwCeOG3NSZzK01Aq1w+tz7R421fs9xgAoPbb
9VCHtaEiG6tTKElsrWsPMiad
=6qMg
-----END PGP SIGNATURE-----

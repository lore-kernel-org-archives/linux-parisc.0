Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: jamesb@peace.com
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: Message from "James Braid" <jbraid@gmx.net>
   of "Thu, 09 May 2002 22:08:27 +1200." <000001c1f741$846d8730$0500a8c0@oscar>
References: <000001c1f741$846d8730$0500a8c0@oscar> 
Date: Thu, 09 May 2002 10:54:45 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020509165445.7A515482A@dsl2.external.hp.com>
Subject: [parisc-linux] Re: Dodgy SCSI in L2000
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

"James Braid" wrote:
...
> Kernel Fault: Code=15 regs=000000004eb88000 (Addr=000000005eb80018)

> IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000010108fe0
> 0000000010108fe4

The fault was caused at 0x0000000010108fe0 - I need to see the
matching vmlinux and System.map to determine where this is in
the code.

>  IIR: 487a0030    ISR: 0000000000000000  IOR: 000000005eb80018
>  CPU:        0   CR30: 000000004eb48000 CR31: 0000000010460000
>  ORIG_R28: 000000001012c9fc
> 
> I then hard rebooted (rs command from the gsp), ran dbench 10 on sdc,
> and the box just completely froze after about half a line of dots from
> dbench.

When the box freezes, do "tc" from GSP. On reboot, at PDC prompt type
"ser pim" to get the state of the machine when it was TC'd.
Once you've saved the PIM dump, it's good to clear PIM.
(iirc, "ser clearpim")
Again, save matching Sysytem.map and vmlinux.

> So I was thinking that sdc may be a dodgy disk/controller, so
> then I rebooted again, ran dbench 10 on sdd, and it worked fine. Tried
> sdb, that was fine too. Okay, so theres something weird happening here,
> I tried dbench 10 on sdc now, and it ran fine. Ran dbench 10 a few more
> times on sdc and it ran fine every time. Also ran dbench 10 over all
> disks serially 4 times and no errors.

Well, that's interesting.

> I rebooted it cleanly (finally!) and went into the boot menu thing, and
> into the service menu, and had a look through the options. I saw the
> scsi paths were set to fast for the boot disk and ultra for the other 3
> disks.

IIRC, setting _SYNC parameter to 10 is equivalent to "fast".

> I set all the scsi paths to "fast" instead of ultra, booted up
> and ran dbench 10 on sdb and sdc simultaneously...it went okay for a
> while, and then, another kernel panic:
> 
> Dumping Stack from 0x0000000056f10000 to 0x0000000056f11380:
> WARNING! Stack pointer and cr30 do not correspond!

oic. In cases like this, we have to disable Stack Dumping since
it data page faults. I suspect that's what's happened in the
previous dumps too. You can disable stack dumps by changing "#if 1"
to "#if 0" on line 149 (show_stack()) in arch/parisc/kernel/traps.c.

BTW, typically this msg means a kernel driver is attempting to directly
access user space data instead of copying the data into kernel space.

...
> Hard rebooted it (*again*), ran dbench 10 on 1 disk (sdd), it ran fine,
> so I cranked it up to dbench 100. That crashed nicely with this panic:
> 
> Dumping Stack from 0x0000000056390000 to 0x0000000056390000:
> 
> Kernel Fault: Code=15 regs=0000000046390000 (Addr=0000000056388018)

did you get the "Stack pointer and cr30 do not correspond!" msg before this?
Well, I guess it doesn't matter...keep an eye out for it though.

> I have no idea whats going on here now :(

Me either since I've not seen this problem. This does sound like
the SCSI interface driver is hitting a corner case and dying there.
But that's just a SWAG.

I'll have to get dbench and try it on the a500 when that's available.

> Is there anything I need to do to decode these kernel panics or anything
> (I'm not a kernel hacker at all, so I don't really know much about the
> panics). I did notice that the ORIG_R28 part is identical on the panics
> though - no idea what this means.

GR02 and IAOQ are my starting points.
get "a.c" from http://cvs.parisc-linux.org/build-tools/
and use that to lookup symbols in System.map.

> I am running ext3 on all my disks - could this be causing any problems?

I doubt it. I'm running ext3 on all my machines.

> I did however notice that the problems still occurred running ext2
> before I re-made the filesystems.

yeah - i don't think this is related to anything in the file system.

...
> As for the good news, I tried a SMP kernel, and SMP works :)
> It sees both CPUs and uses them (I think, top doesn't show cpu usages,
> as per the bug in the bug tracking system).

SMP boots - but it's still less stable the UP. Maybe because of the same
problem you are running into here.

grant

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id CD4DB4829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  2 Jun 2003 02:10:57 -0600 (MDT)
Date: Mon, 2 Jun 2003 09:10:53 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Joel Soete <joel.soete@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] compiler & kernel
In-Reply-To: <3ED886A1.10605@tiscali.be>
Message-ID: <Pine.LNX.4.44.0305311445540.3474-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Sat, 31 May 2003, Joel Soete wrote:

> M. Grabert wrote:
>
> >[...]
> >
> >Oh yes, one important issue:
> >I have this 'target suffers from tag starvation' problem as some others
> >seem to have aswell. I just have a 20GB SE SCSI (50 pin), no other SCSI
> >devices (the original internal UW-SCSI drive is in my AlphaStation now).
> > [...]
>
> Which scsi driver do you used (I presume a Symbios one but version 1 or
> 2; version 2 is recommended now in 2.4.20-pa..)?

I have/had this problems with both (old/new) Symbios drivers!
The problems are fixed for any Symbios driver when I use an older version
of 53x700 driver. I did extensive testing (for kernel with driver version
1 and 2) for 2 days before I was conviced that this 'fix' actually works.

Right now the kernel I currently use (with the longest uptime for months
so far) is using the Symbios v1 driver, but as I said v2 works now aswell!

> OTC this w-e I still experiment such a scsi terminator pb: I recover a
> lvd 30gb scsi-disk (sun); I find a converter sca2 80pins sca 64pins but
> a cable with terminator for hvd disk. The disk seems to works fine
> untill the terminator warm to much then I got scsi parity errors. And
> without terminator the controler do not see the disk at all?

That's actually the first time that I hear of a SCSI terminator
overheating. Perhaps you shouldn't overclock your SCSI bus then ;))))

But seriously, I have had lots of troubles with 80pins to 64pins
converters and UW to U-SCSI converters. Quite often they didn't work
for some harddisk and others worked fine. I don't trust these converters!

> >hppa64-gcc (3.2.3, from ftp.p-l.org unofficial-debs)
> >  seems to work fine but obviously ipt_limit.o is miscompiled:
> >  I can insmod it, but iptable wouldn't recognize the --limit* options.
> >  There are still some problems with some modules and canonicalize_funcptr,
> >
> Are you sure this is with hppa64-gcc (iirc canonicalize.., was just
> recently backport to 3.2)?
>
> [...]

I thought so. The canonicalize_* stuff showed up when compiling with
gcc-3.3 (I forgot this to mention), but I thought they showed up in
3.2 (64bit). Maybe I just can't remeber this one correctly.
But the iptable_limit error is definitely a hppa64-gcc-3.2.3 issue
(or a kernel issue with hppa64 ;)
>
> >  Man, gcc-3.3 is SLOW! it takes ages to compile the kernel!
> >
> >  Kernel compiled with 3.3 definitely have a bogomips problem (they report
> >  0.8 instead of about 470 on a C240);

This might actually be PA8000 specific ...

> >  The kernel takes forever to boot up (it 'waits' for over one minute
> >  after palo loads the kernel (right after the 'switch to another console'
> >  message)), propably because of the bogomips calculation.

...my PA book with the same kernel & gcc-3.3 doesn't hang!

> >  Also the userspace programme 'bogomips' has the same issue.
> >
> >  Apart to make from this issues, gcc-3.3 produces a kernel that is at
> >  least as stable as those compiled with 3.0 or 3.2

I'll send the config file as soon as I'm back home (tomorrow)

> btw which gcc-3.3 release do you use?

the latest in testing (no prerelease anymore)

 Max

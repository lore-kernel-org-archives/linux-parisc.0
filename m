Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA26021
	for <parisc-linux@puffin.external.hp.com>; Tue, 28 Mar 2000 10:18:19 -0700
From: davisg@Celestica.com
To: Philipp Rumpf <prumpf@puffin.external.hp.com>
cc: davisg@Celestica.com, Bas Valkema <b_valkema@hotmail.com>,
        parisc-linux@thepuffingroup.com
Message-ID: <852568B0.005EEA6A.00@tormta3.tor.cel.com>
Date: Tue, 28 Mar 2000 12:16:49 -0500
Subject: Re: [parisc-linux] Couple of questions
Mime-Version: 1.0
Content-type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>



Greetings,

Philipp Rumpf wrote:
> > Transfer-Of-Control button/switch merely appears to result in a system
> > reset, its primary use is to recover from system hang conditions while
> > preserving the machine state for later analysis, i.e. where and why was
> > the sytem hung.
> >
> > So, in summary, although TOC on the surface appears to merely 'reset' the
> > system, it is capable of much more provided the OS specifies an OS_TOC
> > entry point for recovery and debug of machine state at any point during
> > system run time.
>
> Actually, that's exactly what reset does on (most) x86 boxes.  Remember
> getting 286s out of protected mode by resetting them ?
>

Oh yeah - I vaguely recall this. Painful, ugly and slow.

>
> I'm not convinced having customized TOC / HPMC handlers for Linux/PA-RISC
> is a good idea yet.

Agreed!  It's a lot of effort to add support for this. Looking back over the
parisc-linux archives, the alternative
is to use the platform firmware 'pim [hpmc|toc]' command to retrieve the machine
state at the time of crash/hang
and use this information to manually glark the vmlinux image to see where you
were at the time. Although there
is limited information to understand the overall machine context at time of
crash/hang, there's generally enough
information available from PIM to find out where you were (assuming you were
even in the kernel at the time).

BTW, there is a reference in the parisc-linux archives to trap handlers in the
Utah code, Mach I presume, which
may be useful as a model upon which to base HPMC/TOC handlers in Linux for
PA-RISC. Maybe someday...

Regards,
Geoge G. Davis
Software Engineer,  Celestica Chelmsford Design Center
20 Alpha Road
Chelmsford, MA 01824

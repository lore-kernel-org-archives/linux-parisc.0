Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA09733
	for <parisc-linux@puffin.external.hp.com>; Tue, 7 Nov 2000 10:48:09 -0700
Message-Id: <5.0.0.25.0.20001107094526.00a44990@mail.webcash.com>
Date: Tue, 07 Nov 2000 09:46:53 -0800
To: Thierry SIMONNET <t.simonnet@esiee.fr>
From: Kailashnath V Rampure <kailasr@webcash.com>
Subject: Re: [parisc-linux] Boot command
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <3A056715.45799D85@esiee.fr>
References: <Your message of "Fri, 03 Nov 2000 11:46:39 PST." <5.0.0.25.0.20001103114401.00a46150@mail.webcash.com>
 <Your message of "Fri, 03 Nov 2000 11:03:23 PST." <5.0.0.25.0.20001102174648.02a4fb20@mail.webcash.com>
 <5.0.0.25.0.20001103114401.00a46150@mail.webcash.com>
 <5.0.0.25.0.20001103145524.00a49a50@mail.webcash.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
List-ID: <linux-parisc.vger.kernel.org>

Hi,
Thanks. I copied the termcap and terminfo directory froma red hat linux 
box. Now I am able to run VI and the TERM is vt100.

Regards
Kailas

At 02:56 PM 11/5/00 +0100, Thierry SIMONNET wrote:
>To have a suitable TERM, you must get termcap or terminfo definition; ie a
>good terminfo tree from a linux box. To have a good method to install a
>pa/linux box, see my student's web site at http://www.esiee.fr/~djoudim
>
>Th. SIMONNET
>
>
>Kailashnath V Rampure wrote:
>
> > Thanks!  Paul.
> > Yes I had copied the lifImage there. Now I have downloaded the kernel from
> > the link you mentioned.
> >
> > I am still unable to use vi as it says "linux:unknown terminal type"
> > Can you help me.
> >
> > To add features can I add deb packages. I am not that familiar with debian.
> > Actually I want to build an apache + mod_ssl+mod_perl on A180c.
> > Regards
> > Kailas
> >
> > At 01:30 PM 11/3/00 -0700, Paul Bame wrote:
> > >= ext2_open(/boot/vmlinux)=3
> > >= Couldn't gork your kernel executabel format failed to load kernel
> > >= Failed to load Kernel.
> > >
> > >That should be "grok" :-)  Apparently you're not using cut/paste for
> > >these error messages.
> > >
> > >This is PALO saying that /boot/vmlinux is neither elf32, elf64, nor SOM
> > >format.  I'm guessing, based on some earlier advice I gave when you
> > >were net-booting, that you may have a lifimage there by mistake -- you
> > >need a kernel instead, for example from
> > >ftp://puffin.external.hp.com/pub/parisc/binaries/kernels
> > >
> > >To tell for sure, run 'file vmlinux' on that file.  If you get
> > >     vmlinux: 8086 relocatable (Microsoft)
> > >that's probably a lifimage.  You should get this instead:
> > >     vmlinux: ELF 32-bit MSB executable, PA-RISC, version 1, statically
> > > linked, not stripped
> > >
> > >
> > >         -P
> >
> > ---------------------------------------------------------------------------
> > To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> > `unsubscribe' as the subject.

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA20358
	for <parisc-linux@puffin.external.hp.com>; Wed, 18 Oct 2000 12:22:26 -0600
From: Helge Deller <deller@gmx.de>
Date: Wed, 18 Oct 2000 20:22:54 +0200
Content-Type: text/plain;
  charset="us-ascii"
To: parisc-linux <parisc-linux@thepuffingroup.com>
References: <200010181654.JAA14222@milano.cup.hp.com> <87r95e13o5.fsf@linuxcare.com>
In-Reply-To: <87r95e13o5.fsf@linuxcare.com>
Subject: Re: [parisc-linux] booting on 712/60
MIME-Version: 1.0
Message-Id: <00101820225400.00316@P100>
List-ID: <linux-parisc.vger.kernel.org>

Am Wednesday 18 October 2000 19:04 schrieb David Huggins-Daines:
> Grant Grundler <grundler@cup.hp.com> writes:
> 
> > James Waterhouse wrote:
> > > Hello,
> > > 	I just compiled a ramdisk using mondays cvs src for everything. I'm
> > > using the graphics console ramdisk file off the puffin.external.hp.com
> > > (ramdisk20000530-sticon.tgz) to make the ramdisk. Now when I got to boot
> > > it boots up until the point where the kernel says...
> > 
> > iirc, ramdisk20000530-sticon.tgz uses a "kluge" /dev/tty major/minor 
number.
> > I was reading old mail on this and the kluge to use a different
> > major/minor confused me. I was told this was no longer needed.
> > So you can use a newer/regular ramdisk.
> 
> Ah!  Actually that triggers my memory.  You *must* append
> 'console=tty' to the kernel command line in order to use sticon (or
> probably fbcon too for that matter), or else it will default to
> serial.
> 
> Usually the PALO makefile handles this for you though.

Yeah, that was the problem ! I just found it too !
(And you need to enable getty in /etc/inittab).

Thanks,
Helge

> 
> -- 
> dhd@linuxcare.com, http://www.linuxcare.com/
> Linuxcare. Support for the revolution.
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.

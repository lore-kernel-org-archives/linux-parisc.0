Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id GAA15151
	for <parisc-linux@puffin.external.hp.com>; Fri, 9 Jul 1999 06:49:42 -0600
Date: Fri, 9 Jul 1999 15:49:33 +0300 (EETDST)
From: Hannu Martikka <martikka@stybba.ntc.nokia.com>
To: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
cc: parisc-linux <parisc-linux@thepuffingroup.com>,
        Alex deVries <adevries@thepuffingroup.com>
Subject: Re: [parisc-linux] vmlinux in C360
In-Reply-To: <37849F59.D59C7057@ruhr-uni-bochum.de>
Message-ID: <Pine.HPX.4.05.9907091537090.19393-100000@gamgee.ntc.nokia.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 8 Jul 1999, Helge Deller wrote:

> Mike Hibler schrieb:
> 
> > > Date: Wed, 07 Jul 1999 22:15:51 -0400
> > > From: Alex deVries <adevries@thepuffingroup.com>
> > > To: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
> > > Subject: Re: [parisc-linux] vmlinux in C360
> > >
> > > Helge Deller wrote:
> > > >
> > > > Hi !
> > > >
> > > > Only a little idea, but you could try to set the Boot-Offset for the loaded
> > > > Image in the
> > > > arch/parisc/Makefile from 0x10000 to 0x12000 or higher....
> > > > It could be, that we overwrite the PDC & IO-Structures from the BIOS...
> > > > I think I read something about that in the other parisc-ports.....
> > > >
> > >
> > > Is there any reason not to bump that up to 0x12000 ?
> 
> No, I don't know... (maybe only theese few unused kilobyte...)
> Alex, maybe you want to set it higher ? (We could try lower it later again!).
> 
> > I thought that 0x10000 was the magic value, the PDC using memory below that.
> > However, we do indeed load the Mach kernel at 0x12000 and we load our BSD
> > kernel at 0x11000.  I no longer remember the reason, but I'm sure it was a
> > good one! :-)
> 
> Hannu: did you tried, if it worked ?
Yes. It works better now. I used the 0x12000.

Now I see following:
----------------------------------------------------------
ISL> hpux /stand/vmlinux

Boot
:disk (8/..........)/stand/vmlinux
397320 + 114688 + 66464 start 0x12000

The kernel has started...
You are running a 0Mhz PA-RISC-Machine with 0MB of RAM.
First free address was 0x00000000 (This is the base of the stack).
Stacksize = 0x00040000.
First free User-Memory starts now at address 0x00040000 and ends at
0x00090beb.
L
----------------------------------------------------------

I guess that it still tries to say something (Cursor was placed after "L"
on last line). The amount of memory and Mhz are also bit incorrect...

Ps. Axex: I have tried couple of times to mail you directly... Did you get
those emails?

Btw. Is there going to be anything about paric-linux in LinuxExpo (San
Jose 9-12 Aug) or in HP-World? Anyone going there?

> 
> Helge.
- Goodi
"The linuX Files -- The Source is Out There."
ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°

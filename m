Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id BAA27749
	for <parisc-linux@puffin.external.hp.com>; Thu, 10 Jun 1999 01:16:57 -0600
Sender: adevries@feather.thepuffingroup.com
Message-ID: <375F6778.7E2F1385@thepuffingroup.com>
Date: Thu, 10 Jun 1999 03:21:28 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: Kirk Bresniker <kirkb@chrome.rose.hp.com>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] booting problems
References: <199906100620.XAA03156@chrome.rose.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Kirk Bresniker wrote:
> Discounting the system
> board or unknown faults, you code has caused an HPMC, High Priority
> Machine Check. This could be several things, but a good guess would be
> either execution of an invalid instruction (you jumped into data), or
> you attempted to read a address where there is no hardware to respond.

It's likely the bootstrap code jumping to some random bit of data.

> 
> The way to check is to reboot the system through self-test and when you
> reach the boot console handler execute a "SER PIM" command.  PIM is an
> area of non-volatile memory that is filed in by the routine which
> handled the HPMC and is filled with the state of the machine when the
> HPMC was encountered.  From this you should be able to obtain the
> address of the instruction which was executing when the problem occured,
> and should be able to determine what type of problem occured (illegal
> instruction, bad memory reference, etc.)  The PIM dumps are timestamped,
> so make sure that your system time is up to date and that that the PIM
> is from your crash.

All that looks very helpful, and it's the first time I'd heard about it.

I tried that, and I got no error codes, and completely blank registers.
I tried booting a file I knew would break IPL, and I got no error codes
back from it either.

> Do your systems include remote management cards? The remote management
> cards offer the ability to force a PIM dump through a TC (Transfer of
> Control) command, or to force a reset. They also will display chassis
> codes. 

No, we don't have remote manatement cards, but it sounds like they'd be
very useful for this kind of thing.  I know the LCD panels on the D270
displays these, is this a similiar device?


> Chassis codes, see the PDC_CHASSIS call in your pdc32.pdf
> documentation), are displayed on the 25th line of an HPTERM compatible
> terminal or web console session. They are communicated to the management
> cards over a dedicated hardware interface, and so inserting them into
> your code gives a very low level way to display debug data.

Putting the error on the 25th line is a really good idea, but I can't
see the 25th line because of the terminal control buttons ("Line
Modify", "Modify All", etc).  I can't seem to get rid of them either.
What's the trick?

My suspicion is that the problem with our cross compiling bootloader is
somehow related to byte order of the build system.  Jason did his
originally on HPUX (big), and I'm doing my work on i386 (little).  To
check this I'm going to build the kernel on this sparc I have.

- Alex

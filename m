Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id JAA21618
	for <parisc-linux@puffin.external.hp.com>; Fri, 22 Oct 1999 09:50:47 -0600
From: Helge Deller <Helge.Deller@ruhr-uni-bochum.de>
To: parisc-linux@thepuffingroup.com,
        Alex deVries <adevries@thepuffingroup.com>, frowand@cup.hp.com
Subject: Re: [parisc-linux] Boot messages from C3000 console
Date: Fri, 22 Oct 1999 17:15:02 +0200
Content-Type: text/plain
Cc: Paul Bame <bame@debian.fc.hp.com>
References: <Pine.LNX.4.10.9910212221480.18206-100000@vodka.thepuffingroup.com>
MIME-Version: 1.0
Message-Id: <99102217512801.00256@P100>
List-ID: <linux-parisc.vger.kernel.org>

Am Fri, 22 Oct 1999 schrieb Alex deVries:
> On Thu, 21 Oct 1999, Frank Rowand wrote:
> > Ok, tirade mode off.  This is where my newbie status becomes apparent.  Please
> > excuse any foot in mouth here.  I looked at the Puffin web page and didn't
> > notice anything about the process of making sure that code that is submitted
> > has some minimal level of quality.  Is it just a matter of the community
> > applying peer pressure?
> 
> In fact, it's *ALL* about the community applying pressure.
> 
> If the code in head.S is a bit rough, remember that it was just about the
> first PA-RISC assembler that Helge or Philipp had ever written, so do keep
> that in mind.  Also, at the start of the project, there was a very
> conscious effort to only be concerned with 1.1 code.  It doesn't surprise
> me in the least that it's not 2.0 compliant.
> 
> I agree that the code is unreadable though;  I've simply passed it off on
> not being able to understand parisc assembler well enough.
> 
> We'd all appreciate it if you could commit appropriate changes to make the
> code clearer.
> 
> - Alex

Thanks Alex,

Yes, we all know that the boot-loader really needs a complete clean-up, and as
it looks like I´m the maintainer of the bootloader. 

It´s really funny to see people from HP talking to the list and saying somthing
about code-quality, but only as a little reminder:
When I wrote the bootloader I had no documentation on bootloading from HP at
all, no knowledge of parisc and got it only working with trial & error methods
in day and night-sessions. More, it´s first goal was to get at least a kernel
booted so that the real kernel-development could start. (See my messages in the
commits) The end of this all was this really ugly bootloader with many until
now unused enhancements (ELF-loader and ramdisk-support) which can be easily
removed.

More I think there are currently MUCH MORE IMPORTANT things to be fixed in the
kernel than beautifying a (mostly) working bootloader which will be completely
rewritten in the future. When time has come and we have clean code to read
filesystems like LIF and HFS, then this can be easily integrated into a
completely rewritten PALO (PArisc-LOader).

But currently I have nearly no time at all (as many others on this list), so if
anyone has time to fix things, beautify the code and send me patches or
enhancements I really would like to integrate them at once.
SO: PLEASE don´t talk about quality of source code (we all know, that the
bootloader is bad!) , just send patches !!!!!

NB: It seems, that many people wants to talk about this over and over again.
All this was already said some weeks ago.....

Helge Deller.

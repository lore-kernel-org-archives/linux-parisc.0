Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id NAA15681
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 Nov 1999 13:54:08 -0700
Message-Id: <199911242055.PAA14777@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Progress - Update
To: Philipp.H.Rumpf@mathe.stud.uni-erlangen.de (Philipp Rumpf)
Date: Wed, 24 Nov 1999 15:55:38 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: sieler@allegro.com, Philipp.H.Rumpf@mathe.stud.uni-erlangen.de,
        parisc-linux@thepuffingroup.com
In-Reply-To: <19991124203349.J1009@mathe.stud.uni-erlangen.de> from "Philipp Rumpf" at Nov 24, 99 08:33:50 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

It's hard to believe that my initial post started all this discussion
about delay loops.  My original post was about progress in trying to
get to the sash prompt on my 735.  Well were still not there!

I have modified real/setup.c, boot/boot_code/ipl_c.c and include/asm/bootdata.h
so that a default command line is now set when I boot with the hpux loader.
The default command line now prints during the boot.  However, the system
is still not able to open an initial console.

I removed all LASI stuff from my configuration since some of the boot
messages made it seem that it was trying to do things that were bad.  It
did find the ASP, however, when the LASI stuff was in.

I am now mainly concerned that some of the memory configuration messages
seem strange.  I also got a panic after:

Attempting to execute '/sbin/init'
It seems to be a valid SOM executable.

I got a nice dump of the registers.  I think this shows that interruptions
for bus errors are working.  The panic occured at sem_exit+2C when it
tried to access location fffc5e6c.  I will try to determine how this address
got used by sem_exit.

This is what I copied down from the boot re memory and the kernel:

548872 + 532480 + 131952
...
Clearing BSS 0x00118550 --> 0x00139370
Free mem starts at 0xc0139370
Available Virtual mapped memory 0xc0139370 - c5000000
Memory : 14768K available (536K kernel code, 1016K data, 64K init) [c0000000, c1000000]
...
initrd : c009e000 - c00f5800
free_area_init : c0143000 c2000000
mem_map = c0143000
...

The initial BSS clear and the start of free memory are correct.  However,
the 14768K available and the upper limit for the free_area_init appear
incorrect.

Any thoughts?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

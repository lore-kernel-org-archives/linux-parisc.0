Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA11039
	for <parisc-linux@puffin.external.hp.com>; Tue, 1 Jun 1999 15:36:07 -0600
Message-Id: <199906012135.RAA26921@hiauly1.hia.nrc.ca>
Subject: Re: Building the Bootloader
To: jason@equator.com (Jason Eckhardt)
Date: Tue, 1 Jun 1999 17:35:59 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: prumpf@suse.de, cjbeard@istar.ca, parisc-linux@thepuffingroup.com
In-Reply-To: <199906012044.NAA19549@gatekeeper.equator.com> from "Jason Eckhardt" at Jun 1, 99 01:44:55 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

>   Care was taken -- the ipl is position independent with the chosen 
>   combination of flags and code design. The ipl makes no assumption about the
>   location it will be loaded into by the ROM (see ipl_s.s). Text offset zero 
>   is correct for linking in the scheme I have chosen. The bootloader determines
>   where is was loaded at runtime and sets the dp and sp accordingly. All of
>   this should be obvious from the code.

It is not obvious to me that the C code is position independent.

>   The specific combination of flags allowed me to get something resembling
>   a straight binary image (by ignoring the header) and position independence.
>   For some reason I can't remember now, -fpic didn't get the job done
>   (perhaps a compiler defect).

When -fpic is used, $global$ is not used as an offset to access data
variables.  Gnu ld doesn't seem to like $global$ not being used:

624 (hiauly1)dave> make
hppa-linux-as                  ipl_s.s -o ipl_s.o
ipl_s.s: Assembler messages:
ipl_s.s:65: Warning: Ignoring subspace decl due to ELF BFD bugs.
ipl_s.s:68: Warning: Ignoring subspace decl due to ELF BFD bugs.
ipl_s.s:83: Warning: Ignoring subspace decl due to ELF BFD bugs.
ipl_s.s:243: Warning: Ignoring subspace decl due to ELF BFD bugs.
hppa-linux-gcc           -fwritable-strings -mdisable-fpregs -fpic -c ipl_c.c
hppa-linux-gcc           -fwritable-strings -mdisable-fpregs -fpic -c rom_interf
ace.c
hppa-linux-ld                  -Ttext 0 -N ipl_s.o ipl_c.o rom_interface.o -L/eh
ic/a/lib/gcc-lib/hppa-linux/egcs-2.91.60 -lgcc -o ipl
ipl_c.o: In function `IPL_main':
ipl_c.o($CODE$+0x60): undefined reference to `$global$'
make: *** [ipl] Error 1

Inspection of ipl_c.o shows that there is no actual reference to $global$
in ipl_c.o.  No errors occur if -fpic is removed.  

-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA10016
	for <parisc-linux@puffin.external.hp.com>; Tue, 1 Jun 1999 12:05:29 -0600
Message-Id: <199906011805.OAA25752@hiauly1.hia.nrc.ca>
Subject: Re: Building the Bootloader
To: prumpf@suse.de (Philipp Rumpf)
Date: Tue, 1 Jun 1999 14:05:08 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: cjbeard@istar.ca, parisc-linux@thepuffingroup.com
In-Reply-To: <19990601191800.C25364@suse.de> from "Philipp Rumpf" at Jun 1, 99 07:18:00 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> > If the IPL could be extracted from an ELF binary, then it could be produced
> > on any system which supports cross compiling to HP/UX ELF format.
> 
> The problem (unless for the confused ones Christopher just showed the light)
> is the GNU binutils seem to be buggy at the moment.

The question is in what way.  I have been using gas for a long time
with gcc with no major problems.  Possibly, there are problems with ld.
The source at puffin is quite a bit out of date.  Maybe the hppa-linux
support should be integrated into 2.9.4.

> We need to get to the point where we can safely cross-compile for parisc machines
> on i386. My experience with binutils / bfd is rather limited, so I wait for some-
> one else to do it...

I think that I may have been able to successfully cross compile ipl to an
elf binary with text starting at offset 0.  Note that this requires that
libgcc.a has been built successfully for hppa-linux.  This requires a
few patches to gcc.  I think that I have comparable linker flags but I
am not quite sure.   I can make the binary available if someone wants to
try it.  Here are the diffs:

*** Makefile.hp	Thu Mar 11 16:52:20 1999
--- Makefile.gnu	Tue Jun  1 13:55:34 1999
***************
*** 13,22 ****
  #
  
  
! CC	= /usr/local/bin/gcc		# gcc
! LD	= /bin/ld                       # HP's linker
! LDFLAGS = -R 0 -N			#
! AS	= /usr/local/bin/as             # gas
  CFLAGS	= -fwritable-strings -mdisable-fpregs
  
  all:    ipl
--- 13,24 ----
  #
  
  
! CC	= hppa-linux-gcc		# gcc
! LD	= hppa-linux-ld                 #
! # LDFLAGS = -Wl,-Ttext -Wl,0 -Wl,-N -nostartfiles -nostdlib -v
! LDFLAGS = -Ttext 0 -N
! LDLIBS  = -L/ehic/a/lib/gcc-lib/hppa-linux/egcs-2.91.60 -lgcc
! AS	= hppa-linux-as                 # gas
  CFLAGS	= -fwritable-strings -mdisable-fpregs
  
  all:    ipl
***************
*** 41,47 ****
  
  #
  ipl: ipl_s.o ipl_c.o rom_interface.o
! 	$(LD) $(LDFLAGS) ipl_s.o ipl_c.o rom_interface.o -o ipl
  
  
  #
--- 43,49 ----
  
  #
  ipl: ipl_s.o ipl_c.o rom_interface.o
! 	$(LD) $(LDFLAGS) ipl_s.o ipl_c.o rom_interface.o $(LDLIBS) -o ipl
  
  
  #

-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA10818
	for <parisc-linux@puffin.external.hp.com>; Tue, 1 Jun 1999 14:45:40 -0600
Date: Tue, 1 Jun 1999 13:44:55 -0700 (PDT)
From: Jason Eckhardt <jason@equator.com>
Message-Id: <199906012044.NAA19549@gatekeeper.equator.com>
To: dave@hiauly1.hia.nrc.ca, prumpf@suse.de
Subject: Re: Building the Bootloader
Cc: cjbeard@istar.ca, parisc-linux@thepuffingroup.com
List-ID: <linux-parisc.vger.kernel.org>


> > > I think that I may have been able to successfully cross compile ipl to an
> > > elf binary with text starting at offset 0.  Note that this requires that
> > 
> > offset 0 sounds bad as we may not corrupt page 0 (the PDC puts some data we
> > need there).
>
> This is easily changed but seems consistent with the "-R 0" option to
> the hp linker used in Jason Eckhardt's Makefile.  It would appear that
> mkipl builds the actual image.  On the otherhand, no care was taken
> to compile using pic so there may be a relocation problem.
>

  Care was taken -- the ipl is position independent with the chosen 
  combination of flags and code design. The ipl makes no assumption about the
  location it will be loaded into by the ROM (see ipl_s.s). Text offset zero 
  is correct for linking in the scheme I have chosen. The bootloader determines
  where is was loaded at runtime and sets the dp and sp accordingly. All of
  this should be obvious from the code.

  The specific combination of flags allowed me to get something resembling
  a straight binary image (by ignoring the header) and position independence.
  For some reason I can't remember now, -fpic didn't get the job done
  (perhaps a compiler defect).

  In any case, I expect later that we will just link the ipl as a standard
  ELF and then extract the "actual" binary image from it (as chris mentioned
  earlier, and as mentioned in the HILO README). The point was to get a 
  simple bootloader going, which I did (there were no cross tools at that
  time, I therefore just used gcc on HPUX). Any number of tweaks can easily be
  made as needed.

  jason.

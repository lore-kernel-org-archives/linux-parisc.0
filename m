Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA01738
	for <parisc-linux@puffin.external.hp.com>; Sun, 21 Nov 1999 16:05:51 -0700
Message-Id: <199911212307.SAA11686@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Progress
To: Philipp.H.Rumpf@mathe.stud.uni-erlangen.de (Philipp Rumpf)
Date: Sun, 21 Nov 1999 18:07:29 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <19991119043037.B941@mathe.stud.uni-erlangen.de> from "Philipp Rumpf" at Nov 19, 99 04:30:37 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Hi Philipp,

> > VFS: Mounted root (ext2 filesystem)
> > Warning: unable to open an initial console.
> > Attempting to execute '/sbin/init'
> > It seems to be a valid SOM executable.
> > 
> > I am using the PDC_CONSOLE.  I think there was a changed needed to allow
> > opening the PDC_CONSOLE that was discussed previously.  Does anybody
> > remember?  Maybe with this change I can get to sash.
> 
> edit arch/parisc/boot/boot_code/ipl_c.c and replace the "ttyS0" in the command
> line with "tty".  Alternatively, boot in interactive mode and edit the command
> line (again replacing "ttyS0" with "tty").
> 
> That should get you to an (most likely unusable) shell prompt.

I am currently booting with "hpux /stand/vmunix".

This doesn't use the boot code in ipl_c.c.  Maybe the problem is the failure
in main to open "/dev/console".  Possibly, "/dev/console" is not in the ram
disk or, if it is, the kernel is not figuring out which tty to use.

> > I also need to slow down the console messages.
> 
> edit arch/parisc/kernel/pdc_cons.c and put a __delay(N); in pdc_putc.  N is
> approximately the number of CPU cycles you want to wait.  I suggest placing
> it directly after the "case 'n':" as that gives you a per-line delay instead
> of a per-character one.

I tried this and it didn't work.  It looks like __delay() is broken.  The
".balignl" is clearly bogus.  I think the "addib" tests need to bew looked
at more closely.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

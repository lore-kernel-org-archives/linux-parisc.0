Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id UAA28384
	for <parisc-linux@puffin.external.hp.com>; Thu, 18 Nov 1999 20:27:45 -0700
Date: Fri, 19 Nov 1999 04:30:37 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Progress
Message-Id: <19991119043037.B941@mathe.stud.uni-erlangen.de>
References: <199911182316.SAA01297@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199911182316.SAA01297@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>

> VFS: Mounted root (ext2 filesystem)
> Warning: unable to open an initial console.
> Attempting to execute '/sbin/init'
> It seems to be a valid SOM executable.
> 
> I am using the PDC_CONSOLE.  I think there was a changed needed to allow
> opening the PDC_CONSOLE that was discussed previously.  Does anybody
> remember?  Maybe with this change I can get to sash.

edit arch/parisc/boot/boot_code/ipl_c.c and replace the "ttyS0" in the command
line with "tty".  Alternatively, boot in interactive mode and edit the command
line (again replacing "ttyS0" with "tty").

That should get you to an (most likely unusable) shell prompt.

> I also need to slow down the console messages.

edit arch/parisc/kernel/pdc_cons.c and put a __delay(N); in pdc_putc.  N is
approximately the number of CPU cycles you want to wait.  I suggest placing
it directly after the "case 'n':" as that gives you a per-line delay instead
of a per-character one.

> The space registers are all zero.

They always are, currently (this needs to, and will, change).

	Philipp Rumpf

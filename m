Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id CAA03386
	for <parisc-linux@puffin.external.hp.com>; Mon, 22 Nov 1999 02:39:32 -0700
Date: Mon, 22 Nov 1999 08:30:23 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Philipp Heinrich Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Progress
Message-Id: <19991122083023.B1310@mathe.stud.uni-erlangen.de>
References: <19991119043037.B941@mathe.stud.uni-erlangen.de> <199911212307.SAA11686@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199911212307.SAA11686@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>

> Hi Philipp,

Hi.

> I am currently booting with "hpux /stand/vmunix".
>
> This doesn't use the boot code in ipl_c.c.  Maybe the problem is the failure
> in main to open "/dev/console".  Possibly, "/dev/console" is not in the ram
> disk or, if it is, the kernel is not figuring out which tty to use.

Don't do that, then :).

Honestly, I don't think we have a way yet to use the command line the HPUX
boot loader passes us (which I was told uses the ANSI C way of passing
arguments, i.e. argument count in GR26, pointer to NULL-terminated array
of pointers to NULL-terminated arrays of strings in GR25).  Anyone up to
write some glue code that puts that back together into a simple long string
Linux's commandline splitting code can spli again ?

> > > I also need to slow down the console messages.
> > 
> > edit arch/parisc/kernel/pdc_cons.c and put a __delay(N); in pdc_putc.  N is
> > approximately the number of CPU cycles you want to wait.  I suggest placing
> > it directly after the "case 'n':" as that gives you a per-line delay instead
> > of a per-character one.
> 
> I tried this and it didn't work.  It looks like __delay() is broken.  The
> ".balignl" is clearly bogus.

Oh.  Why ?  The way it is intended is to align the following code to a 64-byte
boundary (cache lines on current PA2.0 CPUs are 64 bytes, I think) using nops.

> I think the "addib" tests need to bew looked at more closely.

Possible.  They seem to work fine for the rest of us though (i.e. the delay
loop gets calibrated nicely).

	Philipp Rumpf

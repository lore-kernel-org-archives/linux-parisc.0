Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA30652
	for <parisc-linux@puffin.external.hp.com>; Thu, 11 Jan 2001 08:01:43 -0700
Received: from localhost (ingram@localhost)
	by maestro.symsys.com (8.9.3/8.9.3) with ESMTP id JAA08536
	for <parisc-linux@thepuffingroup.com>; Thu, 11 Jan 2001 09:05:11 -0600
Date: Thu, 11 Jan 2001 09:05:11 -0600 (CST)
From: Greg Ingram <ingram@symsys.com>
To: parisc-linux <parisc-linux@thepuffingroup.com>
In-Reply-To: <387B2C2C.3136129D@tipas.lt>
Message-ID: <Pine.LNX.4.21.0101110826250.8356-100000@maestro.symsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] More C100 questions
List-ID: <linux-parisc.vger.kernel.org>


Hello again,

Well, I bought the C100 and I have a couple of more questions.  Er,
they're not Linux-specific yet, but I'll get there.

1)  Display.  I'd asked earlier (this list and the vendor) if I could
drive an off-the-shelf PC monitor.  Everybody liked my chances, the
connector on the back of the C100 looks like an [S]VGA connector, but it
doesn't seem to drive my fairly studly 17" HP monitor.  The C100's PROM
says this about the display adaptor:

MONITOR INFORMATION

    Slot #        HPA        State    Resolution   Frequency     Class
   ---------   ----------   -------   ----------   ---------   ---------
   graphics0   f8000000     Empty
   graphics3   f4000000     Empty
   graphics4   f6000000     Present   1280x1024    75Hz        VESA
   graphics1   fa000000     Empty

   Current Console Path:       core.SERIAL_1.9600.8.none

   Stable Store Console Path:  GRAPHICS3

The serial console is working fine.  Any suggestions as to the if/how I
can drive a PC monitor with this thing?  Is that 'Stable Store Console
Path' wrong?

2) SCSI.  It came with a two-user version of HP/UX installed on a 2 gig
wide SCSI drive BUT NO MEDIA.  So for the time being I plan to keep HP/UX
on this drive.  Apparently there's about 250 megs that aren't allocated.
Can Linux use an HP/UX partition?  The box has two SCSI connectors on the
back.  One is called a 'single-ended SCSI bus'.  If I had the right cable,
could I run an older SCSI drive?  I've got a 500 meg drive waiting for
something useful to do.

Kind regards,

- Greg

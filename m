Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA32257
	for <parisc-linux@puffin.external.hp.com>; Thu, 11 Jan 2001 09:36:15 -0700
Message-Id: <200101111641.IAA06417@milano.cup.hp.com>
To: Greg Ingram <ingram@symsys.com>
Cc: parisc-linux <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] More C100 questions 
In-reply-to: Your message of "Thu, 11 Jan 2001 09:05:11 PST."
             <Pine.LNX.4.21.0101110826250.8356-100000@maestro.symsys.com>
Date: Thu, 11 Jan 2001 08:41:24 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Greg Ingram wrote:
> 1)  Display.  I'd asked earlier (this list and the vendor) if I could
> drive an off-the-shelf PC monitor.

This should be in the FAQ: "Hit Tab key on power up. Keyboard and Display
must connected to respective ports. Firmware will cycle through known
display types. Hit return to select one". This is probably described
in any of the workstation ownwers guides at
	http://docs.hp.com/hpux/hw/index.html

I'm not sure where the FAQ lives these days.
Alex, can you add this?

...
> The serial console is working fine.  Any suggestions as to the if/how I
> can drive a PC monitor with this thing?  Is that 'Stable Store Console
> Path' wrong?

Can't tell. Need to know what slot your interface card is installed in.
Use "in io" on newer workstations/servers or "info" (?) on older ones
to find out what's installed and the PDC understands.
How to check is worth mentioning the "How do I hook up a Display" FAQ.

> 
> 2) SCSI.  It came with a two-user version of HP/UX installed on a 2 gig
> wide SCSI drive BUT NO MEDIA.  So for the time being I plan to keep HP/UX
> on this drive.  Apparently there's about 250 megs that aren't allocated.
> Can Linux use an HP/UX partition?

No. Only full disk supported until some one writes the LVM support
and also adds it to our boot loader, palo.

> The box has two SCSI connectors on the
> back.  One is called a 'single-ended SCSI bus'.  If I had the right cable,
> could I run an older SCSI drive?  I've got a 500 meg drive waiting for
> something useful to do.

Yes.

grant

Grant Grundler
Unix Systems Enablement Lab
+1.408.447.7253

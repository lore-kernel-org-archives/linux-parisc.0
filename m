Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA00886
	for <parisc-linux@puffin.external.hp.com>; Thu, 11 Jan 2001 11:09:19 -0700
From: "Baz Valkema" <bvalkema@knowhowww.nl>
To: "Grant Grundler" <grundler@cup.hp.com>, "Greg Ingram" <ingram@symsys.com>
Cc: "parisc-linux" <parisc-linux@thepuffingroup.com>
Subject: RE: [parisc-linux] More C100 questions 
Date: Thu, 11 Jan 2001 19:06:45 +0100
Message-ID: <JGEAKBGINIHGNHJDIOMCGEFNCAAA.bvalkema@knowhowww.nl>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
In-Reply-To: <200101111641.IAA06417@milano.cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Other thing to note when attaching a monitor to an workstation is that
some (old at least the 715/50) workstations have the sync-signal on green,
and no signal(s) on the h-sync and v-sync, which will make newer monitors
go into power-save state...


-----Oorspronkelijk bericht-----
Van: Grant Grundler [mailto:grundler@cup.hp.com]
Verzonden: donderdag 11 januari 2001 17:41
Aan: Greg Ingram
CC: parisc-linux
Onderwerp: Re: [parisc-linux] More C100 questions


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

---------------------------------------------------------------------------
To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
`unsubscribe' as the subject.

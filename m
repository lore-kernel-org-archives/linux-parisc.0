Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id IAA21240
	for <parisc-linux@puffin.external.hp.com>; Wed, 10 Nov 1999 08:22:36 -0700
Received: from postal.sr.hp.com (postal.sr.hp.com [15.4.46.173])
	by palrel1.hp.com (Postfix) with ESMTP id E7ECB11F
	for <parisc-linux@thepuffingroup.com>; Wed, 10 Nov 1999 07:24:01 -0800 (PST)
Received: from meow.sr.hp.com (billk@meow.sr.hp.com [15.8.162.83]) by postal.sr.hp.com with ESMTP (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0) id HAA26432 for <parisc-linux@thepuffingroup.com>; Wed, 10 Nov 1999 07:24:09 -0800 (PST)
Received: (from billk@localhost) by meow.sr.hp.com (8.8.6 (PHNE_14041)/8.7.3 TIS 5.0) id HAA02309 for parisc-linux@thepuffingroup.com; Wed, 10 Nov 1999 07:24:00 -0800 (PST)
Message-Id: <199911101524.HAA02309@meow.sr.hp.com>
Subject: Re: [parisc-linux] HIL status (fwd)
To: parisc-linux@thepuffingroup.com
Date: Wed, 10 Nov 1999 07:24:00 -0800 (PST)
From: Bill Katz "\(William\)" <billk@sr.hp.com>
Reply-To: bkatz@agilent.com
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

|On Wed, Nov 10, 1999 at 04:03:39AM -0500, Alex deVries wrote:
|> 
|> Having ASP interrupts working will enable a lot of different boxes to be
|> supported, mostly 715s.  I have a /50, /75 and probably /100 to test on.
|
|The /50 and /75 are also Scorpio machines.  The /100 is either a Mirage or
|a Turnip.  As such, I don't know if it has ASP.

/100 is a LASI machine, like 80 and 64.  They are the original 3 mirages.
Turnip is a mirage with bigger caches, shouldn't affect driver stuff.


|> The closest things we have to ASP docs are:
|> - take the portions of the Lasi docs that describe how Lasi is not like
|> ASP, and read backwards
|
|umm.. 4MB download this evening then...
|
|> Hrm.  That's uncomfortable. So did it actually work at 0xf0800000?
|
|Yep.
|
|> The problem comes when we hit an ASP that's not at 0xf0800000, which I'd
|> think might come up with ASP add on cards.
|
|Do ASP add-in cards exist?  We could just refuse to support them until
|we know more :-)

I've never heard of one, and I've also never heard of a slot that might
support one.  SO, with 99.9% confidence, no they don't exist.

|
|> I don't think that firmware is lying, though.  Perhaps we just need to
|> subtract 0x2f000 for some reason.
|
|Found out what this is in the mach sources.  It's called CORE_ASP:
|
|/*
| * Structures defining memory-mapped registers in the Core IOSS (ASP).
| */
|        vu_char reset;          /* (WO) IOSS reset */
|        vu_char version;        /* (RO) version byte */
|        vu_char scsi_dsync;     /* (WO) SCSI DSYNC enable bit (1:enable) */
|        vu_char error;          /* bus errors while ASP masters SGC/VSC */
|        vu_char lan_oen;        /* (WO) output enable Ethernet/FDDI */
|
|Shortly below this is:
|
|/*
| * Structures defining memory-mapped registers in the Core IOSS (LASI).
| */
|struct core_lasi {
|        vu_int  power;
|        vu_int  error;
|        vu_int  version;
|        vu_int  reset;
|        vu_int  arbmask;
|};
|
|which is defined to be at 0xF010C000.
|
|> > Here's the driver list printed at boot on the 715 (is someone collecting
|> > these somewhere?)
|> 
|> Within a week, I'll send some mail about The Puffin PA RISC Hardware
|> Guide. Details to come.
|
|Oh good.

If you have specific Scorpio/ASP questions, mail them to me, and I'll 
look them up in the docs.

	-Bill

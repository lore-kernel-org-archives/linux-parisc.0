Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id AAA08071
	for <parisc-linux@puffin.external.hp.com>; Tue, 26 Oct 1999 00:55:53 -0600
Date: Tue, 26 Oct 1999 08:56:54 +0200
From: Philipp Rumpf <prumpf@suse.de>
To: Alex deVries <adevries@thepuffingroup.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] keyboards and such.
Message-ID: <19991026085653.A17980@suse.de>
References: <Pine.LNX.4.10.9910242258310.22118-100000@vodka.thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.10.9910242258310.22118-100000@vodka.thepuffingroup.com>; from Alex deVries on Sun, Oct 24, 1999 at 11:01:57PM -0400
List-ID: <linux-parisc.vger.kernel.org>

> Does anyone have docs on how to speak to a standard AT or PS/2 keyboard?
> The Black Puffin of Death will haunt you if you point me to 8042
> controller docs.

what about looking at the current keyboard driver ?  It looks to me like it
shouldn't be too difficult to work from the assumption that kbd_read_input is
RCVDATA, kbd_read_status is STATUS, KBD_STAT_OBF is RBNE, KBD_STAT_IBF is TBNE,
KBD_STAT_MOUSE_OBF we don't need, KBD_STAT_GTO is TERR and KBD_STAT_PERR is
PERR.

looking at it again, the bit correlations are:

8042		Lasi
0-1		0-1
6-7		2-3
2-5		unimplemented
unimplemented	4-7

assuming there is a 8042-compatible chip inside lasi, it just seems to get the
line for bit 2 as both input line 2 and 3 (and there's some additional logic
around it).

	Philipp Rumpf

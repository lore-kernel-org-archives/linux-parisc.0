Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id DAA15167
	for <parisc-linux@puffin.external.hp.com>; Wed, 15 Mar 2000 03:36:01 -0700
Date: Wed, 15 Mar 2000 10:36:23 +0100
From: Philipp Rumpf <prumpf@inwestnet.de>
To: "Dave O'Neill" <doneill@linuxcare.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ld death
Message-ID: <20000315103623.A673@abacus.local>
References: <Pine.LNX.4.10.10003141855270.9288-100000@boilermaker.thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.10.10003141855270.9288-100000@boilermaker.thepuffingroup.com>; from doneill@linuxcare.com on Tue, Mar 14, 2000 at 07:12:35PM -0500
List-ID: <linux-parisc.vger.kernel.org>

> hppa1.1-hp-linux-ld: Warning: type of symbol `__ashrdi3' changed from 1 to
> 2 in ashrdi3.o
> death: gsc_writeq type 1
> hppa1.1-hp-linux-ld: can not size stub section: Bad value

This is Sammyese for "undefined symbol gsc_writeq".  I haven't actually got
that code in the tree that builds (and, until yesterday, worked) here, so
no idea what blew up.  (actually, could you check we use gsc_(write|read)q
instead of ...d in gsc.h ?)

	Philipp Rumpf

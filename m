Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id EAA28746
	for <parisc-linux@puffin.external.hp.com>; Tue, 2 Jan 2001 04:35:29 -0700
Date: Tue, 2 Jan 2001 03:21:24 -0800
Message-Id: <200101021121.DAA14657@pizda.ninka.net>
From: "David S. Miller" <davem@redhat.com>
To: matthew@wil.cx
CC: grundler@cup.hp.com, linux-kernel@vger.kernel.org,
        alan@lxorguk.ukuu.org.uk, parisc-linux@thepuffingroup.com
In-reply-to: <20010102112242.A7040@parcelfarce.linux.theplanet.co.uk> (message
	from Matthew Wilcox on Tue, 2 Jan 2001 11:22:42 +0000)
Subject: Re: [PATCH] move xchg/cmpxchg to atomic.h
References: <200101020811.AAA26525@milano.cup.hp.com> <200101020903.BAA14334@pizda.ninka.net> <20010102112242.A7040@parcelfarce.linux.theplanet.co.uk>
List-ID: <linux-parisc.vger.kernel.org>

   Date: Tue, 2 Jan 2001 11:22:42 +0000
   From: Matthew Wilcox <matthew@wil.cx>

   We really can't.  We _only_ have load-and-zero.  And it has to be
   16-byte aligned.  xchg() is just not something the CPU implements.

Oh bugger... you do have real problems.

Later,
David S. Miller
davem@redhat.com

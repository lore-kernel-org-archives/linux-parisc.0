Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA00409
	for <parisc-linux@puffin.external.hp.com>; Tue, 2 Jan 2001 10:41:14 -0700
Received: from router-100m.swansea.linux.org.uk (HELO the-village.bc.nu) (194.168.151.17)
  by mailserv2.iuinc.com with SMTP; 2 Jan 2001 17:44:33 -0000
Subject: Re: [PATCH] move xchg/cmpxchg to atomic.h
To: ak@suse.de (Andi Kleen)
Date: Tue, 2 Jan 2001 17:18:52 +0000 (GMT)
Cc: matthew@wil.cx (Matthew Wilcox), davem@redhat.com (David S. Miller),
        grundler@cup.hp.com, linux-kernel@vger.kernel.org,
        alan@lxorguk.ukuu.org.uk, parisc-linux@thepuffingroup.com
In-Reply-To: <20010102125924.A9538@gruyere.muc.suse.de> from "Andi Kleen" at Jan 02, 2001 12:59:24 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E14DV5K-0002Xn-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> > We really can't.  We _only_ have load-and-zero.  And it has to be 16-byte
> > aligned.  xchg() is just not something the CPU implements.
> 
> The network code relies on the reader-xchg semantics David described in 
> several places.

I guess the network code will just have to change for 2.5. read_xchg_val()
can be a null macro for everyone else at least

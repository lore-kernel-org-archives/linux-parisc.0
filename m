Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id EAA29614
	for <parisc-linux@puffin.external.hp.com>; Tue, 2 Jan 2001 04:56:34 -0700
Date: Tue, 2 Jan 2001 12:59:24 +0100
From: Andi Kleen <ak@suse.de>
To: Matthew Wilcox <matthew@wil.cx>
Cc: "David S. Miller" <davem@redhat.com>, grundler@cup.hp.com,
        linux-kernel@vger.kernel.org, alan@lxorguk.ukuu.org.uk,
        parisc-linux@thepuffingroup.com
Subject: Re: [PATCH] move xchg/cmpxchg to atomic.h
Message-ID: <20010102125924.A9538@gruyere.muc.suse.de>
References: <200101020811.AAA26525@milano.cup.hp.com> <200101020903.BAA14334@pizda.ninka.net> <20010102112242.A7040@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010102112242.A7040@parcelfarce.linux.theplanet.co.uk>; from matthew@wil.cx on Tue, Jan 02, 2001 at 11:22:42AM +0000
Sender: ak@suse.de
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Jan 02, 2001 at 11:22:42AM +0000, Matthew Wilcox wrote:
> On Tue, Jan 02, 2001 at 01:03:48AM -0800, David S. Miller wrote:
> > If you require an external agent (f.e. your spinlock) because you
> > cannot implement xchg with a real atomic sequence, this breaks the
> > above assumptions.
> 
> We really can't.  We _only_ have load-and-zero.  And it has to be 16-byte
> aligned.  xchg() is just not something the CPU implements.

The network code relies on the reader-xchg semantics David described in 
several places.

-Andi

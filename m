Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id EAA29125
	for <parisc-linux@puffin.external.hp.com>; Tue, 2 Jan 2001 04:45:51 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 2 Jan 2001 11:49:10 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14DPWc-000218-00; Tue, 02 Jan 2001 11:22:42 +0000
Date: Tue, 2 Jan 2001 11:22:42 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: "David S. Miller" <davem@redhat.com>
Cc: grundler@cup.hp.com, linux-kernel@vger.kernel.org,
        alan@lxorguk.ukuu.org.uk, parisc-linux@thepuffingroup.com
Subject: Re: [PATCH] move xchg/cmpxchg to atomic.h
Message-ID: <20010102112242.A7040@parcelfarce.linux.theplanet.co.uk>
References: <200101020811.AAA26525@milano.cup.hp.com> <200101020903.BAA14334@pizda.ninka.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200101020903.BAA14334@pizda.ninka.net>; from davem@redhat.com on Tue, Jan 02, 2001 at 01:03:48AM -0800
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Jan 02, 2001 at 01:03:48AM -0800, David S. Miller wrote:
> If you require an external agent (f.e. your spinlock) because you
> cannot implement xchg with a real atomic sequence, this breaks the
> above assumptions.

We really can't.  We _only_ have load-and-zero.  And it has to be 16-byte
aligned.  xchg() is just not something the CPU implements.

-- 
Revolutions do not require corporate support.

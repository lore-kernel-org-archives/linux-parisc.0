Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA23304
	for <parisc-linux@puffin.external.hp.com>; Mon, 1 Jan 2001 18:57:54 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 2 Jan 2001 02:01:03 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14DG8g-0003AE-00; Tue, 02 Jan 2001 01:21:22 +0000
Date: Tue, 2 Jan 2001 01:21:22 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@cup.hp.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, Matthew Wilcox <matthew@wil.cx>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ZONE_DMA
Message-ID: <20010102012122.A10153@parcelfarce.linux.theplanet.co.uk>
References: <E14D9PA-00017j-00@the-village.bc.nu> <200101020059.QAA26152@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200101020059.QAA26152@milano.cup.hp.com>; from grundler@cup.hp.com on Mon, Jan 01, 2001 at 04:59:31PM -0800
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jan 01, 2001 at 04:59:31PM -0800, Grant Grundler wrote:
> o Elroy HW supports 64-bit PCI addressing (Dual Address cycle).

But, if possible, we want to avoid doing DAC as it cuts down the bandwidth
(and increases latency by a clock).  obviously, if it's a 64-bit device
and a 64-bit controller, there's no problem, but we should try to stick
to 32-bit bus addresses where possible.

-- 
Revolutions do not require corporate support.

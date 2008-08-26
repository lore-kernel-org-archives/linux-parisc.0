From: David Miller <davem@davemloft.net>
Subject: Re: __kernel_suseconds_t is int on PA-RISC (and SPARC64)?
Date: Tue, 26 Aug 2008 13:50:24 -0700 (PDT)
Message-ID: <20080826.135024.03095891.davem@davemloft.net>
References: <Pine.LNX.4.64.0808262207450.7910@anakin>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org, linux-m68k@vger.kernel.org,
	linux-kernel@vger.kernel.org
To: geert@linux-m68k.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0808262207450.7910@anakin>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 26 Aug 2008 22:11:25 +0200 (CEST)

> Apparently __kernel_suseconds_t is `int' on PA-RISC (and on SPARC64),
> while it's `long' on all other platforms.
> 
> Is there a specific reason for that?

An existing API probably decided it for us :-)

Anyways, no use in wondering why, it can't be changed at this point.

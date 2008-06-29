From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: kernel fault when booting with dual link network card
Date: Sun, 29 Jun 2008 11:00:34 -0500
Message-ID: <1214755234.3405.5.camel@localhost.localdomain>
References: <20080629151759.GA7856@spring.luon.net>
Mime-Version: 1.0
Content-Type: text/plain
Cc: linux-parisc@vger.kernel.org
To: Sjoerd Simons <sjoerd@luon.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080629151759.GA7856@spring.luon.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 2008-06-29 at 16:17 +0100, Sjoerd Simons wrote:
> Hi,
> 
>   Kernel 2.6.24 causes the machine to fault when a dual-link network card is
>   installed right after loading the tulip module. Output of SER PIM attached.

I'm afraid just the hex dump isn't really any use.  To be possibly
useful, we need at least the symbolic addresses of IAOQ and %r2.
That's:

%r2: 0x10245748
IAOQ[0]: 0x10252bdc
IAOQ[1]: 0x10252be0

the I/O module error seems to indicate an incorrect GSC DMA read.

James



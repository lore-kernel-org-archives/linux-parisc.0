Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA27956
	for <parisc-linux@puffin.external.hp.com>; Wed, 17 Jan 2001 12:50:34 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 17 Jan 2001 19:54:16 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14IyFI-0002oz-00; Wed, 17 Jan 2001 19:27:48 +0000
Date: Wed, 17 Jan 2001 19:27:48 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@cup.hp.com>
Cc: Thierry SIMONNET <t.simonnet@esiee.fr>, parisc-linux@thepuffingroup.com,
        frowand@montevista.com
Subject: Re: [parisc-linux] booting 742
Message-ID: <20010117192748.D10580@parcelfarce.linux.theplanet.co.uk>
References: <026e01c08080$91102ee0$0a14d793@esiee.fr> <200101171709.JAA12768@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200101171709.JAA12768@milano.cup.hp.com>; from grundler@cup.hp.com on Wed, Jan 17, 2001 at 09:09:24AM -0800
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jan 17, 2001 at 09:09:24AM -0800, Grant Grundler wrote:
> Only vaguely - A seperate group in HP supports/developes the "industrial"
> workstations since they run RTE (not HPUX) on them. AFAIK, many of those
> boxes are similar to B-class workstations w/PXC-L or -L2. I have no clue
> how the VME bus is supported - ie bus interface chip or such.

http://www.parisc-linux.org/hp9000_models.html

the 742 is PCXT-based; ie it's basically a 715/scorpio on a different
board.

Richard is the expert on VME stuff :-)

how to get a consle on those things... no idea.  there's no PDC on them?

-- 
Revolutions do not require corporate support.

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA27731
	for <parisc-linux@puffin.external.hp.com>; Sun, 20 Aug 2000 12:21:52 -0600
Received: from user52-196.jakinternet.co.uk (HELO rhirst.linuxcare.com) (@212.41.52.196)
  by mailserv2.iuinc.com with SMTP; 20 Aug 2000 18:21:40 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 9BFD0B005; Sun, 20 Aug 2000 19:20:36 +0100 (BST)
Date: Sun, 20 Aug 2000 19:20:36 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Matthew Wilcox <matthew@wil.cx>
Cc: Grant Grundler <grundler@cup.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] test6 merge
Message-ID: <20000820192036.H13870@linuxcare.com>
References: <20000818124944.A13870@linuxcare.com> <200008182207.PAA07370@milano.cup.hp.com> <20000818220456.A32273@vodka.thepuffingroup.com> <20000819162418.E13870@linuxcare.com> <20000819191335.E32273@vodka.thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000819191335.E32273@vodka.thepuffingroup.com>; from matthew@wil.cx on Sat, Aug 19, 2000 at 07:13:35PM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Aug 19, 2000 at 07:13:35PM -0400, Matthew Wilcox wrote:
> On Sat, Aug 19, 2000 at 04:24:18PM +0100, Richard Hirst wrote:
> > Dream on ;-)  I've fixed drivers/char/serial.c to allocate our serial ports
> > from ttyS00 rather than from ttyS04, and my A180 now boots to a sash
> > prompt.  That got rid of the 'pci bus 0 not registered" message also.
> 
> OK, can we now lay down the LINUS_240_TEST6_DEVEL tag to indicate that
> we're done with merging and development can begin again?  (If you agree,
> you (== Richard) can lay it down rather than waiting for me).

Done.

Richard

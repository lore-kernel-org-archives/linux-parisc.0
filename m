Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id IAA06213
	for <parisc-linux@puffin.external.hp.com>; Thu, 2 Sep 1999 08:42:15 -0600
Date: Thu, 2 Sep 1999 16:43:43 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Philipp Rumpf <prumpf@suse.de>
Cc: Grant Grundler <grundler@cup.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux-cvs] grundler
Message-ID: <19990902164343.V493@mencheca.ch.genedata.com>
References: <199909012302.RAA04044@puffin.external.hp.com> <19990902110831.I629@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <19990902110831.I629@suse.de>; from Philipp Rumpf on Thu, Sep 02, 1999 at 11:08:31AM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Sep 02, 1999 at 11:08:31AM +0200, Philipp Rumpf wrote:
>  - use of readb aso instead of gsc_readb aso
> 
> gsc_readb is there for a reason.

Let me amplify on this a little.  As I understand it, Linus has decreed
that readb/writeb/(etc) shall work on busses which `look like PCI'.
All other busses (zorro, podule, sbus, ...) shall define their own
*_readb/writeb/...  functions.  People have proposed auto-detecting which
bus is being written to and doing the right thing, but Linus disagrees.
So that's why we have gsc_readb, because GSC looks insufficiently
like PCI.  Does this make sense?

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson

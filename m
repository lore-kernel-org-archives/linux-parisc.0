Received: from mailserv2.iuinc.com (mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA11668
	for <parisc-linux@puffin.external.hp.com>; Tue, 24 Aug 1999 15:43:38 -0600
Date: Tue, 24 Aug 1999 23:44:40 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Grant Grundler <grundler@cup.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Booting 715/100
Message-ID: <19990824234440.H31994@mencheca.ch.genedata.com>
References: <19990824223815.E31994@mencheca.ch.genedata.com> <199908242121.OAA09713@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199908242121.OAA09713@milano.cup.hp.com>; from Grant Grundler on Tue, Aug 24, 1999 at 02:21:35PM -0700
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Aug 24, 1999 at 02:21:35PM -0700, Grant Grundler wrote:
> I finally managed to build a kernel from the 08/07/99 tar file.

I assume you mean 07/Aug/99 rather than 08/Jul/99?  :-)

> Now I can't boot it!
> 
> I might need to update the source tree again but need
> to figure out how CVS can operate through HP's firewall.

Can you ssh out?  CVS_RSH=ssh should do the trick if so.

> I also wasn't sure about the difference between
> CONFIG_PA7100 and CONFIG_PA7300 in the .config file.
> I thought the 715/100 is an older machine before 7300LC
> was available and thus is PA7100. Is this right?

Well, according to /usr/sam/lib/mo/sched.models (a very useful file!)

715     1.1c    PA7100LC

It doesn't mention the submodels explicitly.  However,

http://www.thepuffingroup.com/parisc/hp9000_models.html

says the 715/100 (both variants!) have PCXL CPUs which is the same as that
on the 712 models, which we know to be the 7100LC.

Sorry I can't be of any help on the actual problem though...

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson

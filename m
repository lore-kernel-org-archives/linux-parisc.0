Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id HAA13891
	for <parisc-linux@puffin.external.hp.com>; Thu, 5 Aug 1999 07:32:04 -0600
Date: Thu, 5 Aug 1999 15:32:48 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: Hannu Martikka <martikka@stybba.ntc.nokia.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Pa-risc Linux timetables?
Message-ID: <19990805153248.S11586@mencheca.ch.genedata.com>
References: <19990804132850.A17303@grcbd508.grc.hp.com> <Pine.HPX.4.05.9908051545080.18930-100000@gamgee.ntc.nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.HPX.4.05.9908051545080.18930-100000@gamgee.ntc.nokia.com>; from Hannu Martikka on Thu, Aug 05, 1999 at 03:54:09PM +0300
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Aug 05, 1999 at 03:54:09PM +0300, Hannu Martikka wrote:
> Do we have any estimate on parisc/linux timetables? When is the pa-risc
> Linux going to be "released"? Do we target it to 2.5 or 2.6? 
> 
> We are now based on 2.2.1. How big effort would be required to merge
> pa-risc linux (2.2.1) to 2.3/2.4?

I believe we're aiming at having a 2.2 version ready for the end of the
year -- approximately the same time as Linus expects to have a 2.4 release
out.  Updating to 2.4 shouldn't be a big problem, and we don't have to be
ready for the release of 2.4.0 -- Linus merged alpha, sparc, ppc and mips
trees at several stages after 2.2.0 was released.  (Indeed, there is a
big mips merge in the 2.2.11 prepatches.)

Don't worry about 2.4 yet :-)

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson

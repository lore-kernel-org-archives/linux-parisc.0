Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (A630f.pppool.de [213.6.99.15])
	by dsl2.external.hp.com (Postfix) with ESMTP id 17825496A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Oct 2001 09:28:05 -0600 (MDT)
Date: Thu, 4 Oct 2001 17:27:02 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: "Bryan W. Headley" <bheadley@interaccess.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: C110 question
Message-ID: <20011004172702.B5324@solo.franken.de>
References: <bheadley@interaccess.com> <200110021733.LAA07820@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200110021733.LAA07820@puffin.external.hp.com>; from grundler@puffin.external.hp.com on Tue, Oct 02, 2001 at 11:33:05AM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Oct 02, 2001 at 11:33:05AM -0600, Grant Grundler wrote:
> > The drives are hanging off of a FWSCSI controller. I'm right in thinking 
> > that the support for that is still not there, right?
> 
> In general the SCSI driver for Zalon works. The problem is with
> IO MMU support for devices below anything other than the first IO MMU.

I don't know how close a C110 is compared to a C100, but we had massive
filesystem corruptions on a C100 (and a C160) during the weekend in Oldenburg. 
It looked like the problems I had with my C200, which seem to be fixed
(I've compiled XFree and mozialla on that machine). I'll recheck on
my C100, when I get home again.

> XF86 is mostly working for B180 and 712's from reports on p-l mailing list.
> If you have Vis-EG (normal built-in) graphics, it might work for
> C110 as well since it's not using IO MMU (afaik).

it should work. To use stifb you need to remove the check for Artist
only (search for HACK:).

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]

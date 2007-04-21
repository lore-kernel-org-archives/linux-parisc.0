From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] [PATCH] limit thread stack size with >4K pages
Date: Sat, 21 Apr 2007 16:35:16 +0200
Message-ID: <200704211635.16322.deller__39395.5571730205$1416624337$gmane$org@gmx.de>
References: <200703171323.06002.deller@gmx.de>
	<1174139264.3476.1.camel@mulgrave.il.steeleye.com>
	<20070317162332.GB10950@athena.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: James Bottomley <James.Bottomley@steeleye.com>,
 parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070317162332.GB10950@athena.road.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Saturday 17 March 2007, Kyle McMartin wrote:
> On Sat, Mar 17, 2007 at 08:47:44AM -0500, James Bottomley wrote:
> > That's a bit ugly ... and would break if someone added new page sizes.
> > Can't we do something like
> > 
> > #if PAGE_BITS > 16
> > #define THREAD_ORDER 0
> > #else
> > #define THREAD_ORDER (16 - PAGE_BITS)
> > #endif
> > 
> 
> Nice.

Nice yes, but doesn't work.
Basically I think it would need to be PAGE_SHIFT  (instead of PAGE_BITS is part of include/linux/raid/bitmap.h).

But with PAGE_SHIFT you get due to missing #includes lots of:
In file included from include/linux/thread_info.h:21,
                 from include/linux/preempt.h:9,
                 from include/linux/spinlock.h:49,
                 from include/linux/module.h:9,
                 from init/main.c:13:
include/asm/thread_info.h:37:5: warning: "PAGE_SHIFT" is not defined

Adding more #includes isn't a good idea either.

I still propose my initial patch: http://lists.parisc-linux.org/pipermail/parisc-linux/2007-March/031423.html
If someone adds new page sizes (is this likely?), he will stumble over the not-defined THREAD_ORDER anyway and will have to fix it acordingly.

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

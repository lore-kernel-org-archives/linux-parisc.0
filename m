From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [dave@hiauly1.hia.nrc.ca: Re: [parisc-linux] Why gas kills the
Date: Fri, 1 Jul 2005 14:38:03 -0400 (EDT)
Message-ID: <200507011838.j61Ic37N006115@hiauly1.hia.nrc.ca>
References: <1120241244.5046.16.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: carlos@systemhalted.org,
 tausq@debian.org,
 parisc-linux@lists.parisc-linux.org
To: James.Bottomley@SteelEye.com (James Bottomley)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1120241244.5046.16.camel@mulgrave> from "James Bottomley" at Jul
	1, 2005 02:07:24 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Fri, 2005-07-01 at 13:53 -0400, Carlos O'Donell wrote:
> > journal_alloc_journal_head() can return a null pointer causing
> > the kernel to die in memset.  I think the fix is to skip calling
> > memset when new_jh is null.  The rest of the code looks ok except
> > for possibly
> 
> That's true (and needs fixing), but isn't what happened in this case.
> Look at the traceback:

Actually, I was wrong.  journal_alloc_journal_head con't return
null.  I see it spins until kmem_cache_alloc returns a non null
value.

It looks like mm/slab.c needs to be built with DEBUG true and
and possibly CONFIG_DEBUG_PAGEALLOC to find how the pointer is
getting allocated.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: Peter Zijlstra <a.p.zijlstra@chello.nl>
Subject: Re: [parisc-linux] memory management issues
Date: Sun, 06 May 2007 16:42:24 +0200
Message-ID: <1178462545.2789.1.camel__33049.2608169608$1416624354$gmane$org@lappy>
References: <65dd6fd50704301144k77003d1he9f85f4bb6cf2ace@mail.gmail.com>
	<1178149192.3712.28.camel@mulgrave.il.steeleye.com>
	<65dd6fd50705021652s3b3b721dl6a8323259cd4efa9@mail.gmail.com>
	<1178153532.3712.39.camel@mulgrave.il.steeleye.com>
	<65dd6fd50705030111i993390bx829ee5eb8a188462@mail.gmail.com>
	<1178461403.3760.10.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Ollie Wild <aaw@google.com>,
 parisc-linux@lists.parisc-linux.org
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1178461403.3760.10.camel@mulgrave.il.steeleye.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 2007-05-06 at 09:23 -0500, James Bottomley wrote:
> On Thu, 2007-05-03 at 01:11 -0700, Ollie Wild wrote:
> > Is this a bug in get_user_pages()?  Should it be calling
> > flush_cache_page() directly?
> 
> Just for the sake of completeness, the answer to this is "no".  The
> anonymous page part of get_user_pages() is designed to gather pages from
> current processes only (an then, the only in-tree user we have is fuse
> and that's a bit of a hack).  The problem with your patch is that you're
> trying to gather non-current pages.
> 
> It took me a while to discover this, largely because you do this:
> 
> +                               ret = get_user_pages(current, bprm->mm, pos,
> +                                                    1, 1, 1, &page, NULL);
> 
> That's horribly wrong ... you can't use the current process context to
> gather non-current pages ... if anything goes wrong and the page needs
> faulting (unusual for a nascent process, but not impossible) you'll get
> into terrible trouble because the mapping for the page isn't in current.

Right, what would be the proper way to go about this, a NULL tsk?
Because the bprm->mm is un-owned at this point in time. That is, there
is no process context associated with it at all.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

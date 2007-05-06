From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] memory management issues
Date: Sun, 06 May 2007 10:39:11 -0500
Message-ID: <1178465951.3760.23.camel__27232.0941011005$1416624354$gmane$org@mulgrave.il.steeleye.com>
References: <65dd6fd50704301144k77003d1he9f85f4bb6cf2ace@mail.gmail.com>
	<1178149192.3712.28.camel@mulgrave.il.steeleye.com>
	<65dd6fd50705021652s3b3b721dl6a8323259cd4efa9@mail.gmail.com>
	<1178153532.3712.39.camel@mulgrave.il.steeleye.com>
	<65dd6fd50705030111i993390bx829ee5eb8a188462@mail.gmail.com>
	<1178461403.3760.10.camel@mulgrave.il.steeleye.com>
	<1178462545.2789.1.camel@lappy>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Ollie Wild <aaw@google.com>,
 parisc-linux@lists.parisc-linux.org
To: Peter Zijlstra <a.p.zijlstra@chello.nl>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1178462545.2789.1.camel@lappy>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 2007-05-06 at 16:42 +0200, Peter Zijlstra wrote:
> > It took me a while to discover this, largely because you do this:
> > 
> > +                               ret = get_user_pages(current, bprm->mm, pos,
> > +                                                    1, 1, 1, &page, NULL);
> > 
> > That's horribly wrong ... you can't use the current process context to
> > gather non-current pages ... if anything goes wrong and the page needs
> > faulting (unusual for a nascent process, but not impossible) you'll get
> > into terrible trouble because the mapping for the page isn't in current.
> 
> Right, what would be the proper way to go about this, a NULL tsk?
> Because the bprm->mm is un-owned at this point in time. That is, there
> is no process context associated with it at all.

Heh, no good way I can think of ... you certainly can't use NULL.  But
look at what you're doing.  You're using the stack expansion functions
to populate the mm's vma ... then you use get_user_pages() to place the
pages into the vma.  I suspect it only works because you're in the
middle of a fork and the new process is structurally almost identical to
the old one, so get_user_pages() is using pieces of current (mainly the
task gate) and accounting all the page faults the new process is taking
to current.

The thing which worries me is that this user of get_user_pages() is very
fragile.  Fortunately, you have the mm ... certainly on parisc, that's
the primary coherence entity for memory management (we don't really care
what the task is).

However, the fragility could be greatly reduced if you could do this
later when you do have a task structure ... then you could even use the
appropriate APIs, like access_proces_vm() or copy_to_user_page() which
will take care of the architecturally necessary flushing for you.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

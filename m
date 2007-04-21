From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: hanging linuxthread processes
Date: Sat, 21 Apr 2007 15:11:11 -0400 (EDT)
Message-ID: <200704211911.l3LJBBgh028700__26732.7080051929$1416624337$gmane$org@hiauly1.hia.nrc.ca>
References: <1177177757.3718.79.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: kyle@mcmartin.ca,
 parisc-linux@lists.parisc-linux.org
To: James.Bottomley@SteelEye.com (James Bottomley)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1177177757.3718.79.camel@mulgrave.il.steeleye.com> from "James
	Bottomley" at Apr 21, 2007 12:49:17 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > http://lists.parisc-linux.org/pipermail/parisc-linux/2007-February/031385.html
> 
> This one, definitely not ... it doesn't work ... I need to get acess to
> a machine again where I can play around with it.
> 
> > There's also the somewhat related space register issue associated with
> > TLB flushing:
> > 
> > http://lists.parisc-linux.org/pipermail/parisc-linux/2007-February/031365.html
> 
> I think this one works OK ... but we could do with checking it
> 
> > Randolph's change to tlbflush.h is broken and needs to be reverted
> > if we don't have a better fix yet.
> 
> I really think these problems demonstrate this new approach to patch
> management is non functional.  I bet even the good patch has had no
> testing at all for the last two months.

I've been testing both for the last two months.  My impression is
that the latter patch doesn't fully work.  Although I was able to
successfully bootstrap a SMP kernel with the patch, there were
too many tlb problems for the system to be usable.  The UP version
of the same kernel only has the occassional problem.  It sounds
like I should remove the first one on the pa8800 to see if it is
causing problems.

I definitely miss being able to download parisc patched kernels
and source for testing.  However, I recognize that maintaining
this tree is a lot of work.

Comparing the linux and gcc development models, I have to say I
think the gcc model is better.  In gcc, it's possible to install
bug fixes nearly all the time.  In practice, the only period that
is significantly restricted is the trunk stabilization period
prior to the creation of a release branch.  There are fewers
releases, so this isn't too much of a problem.  The trunk is quite
unstable after a new release branch is created but that's life.

Since the upstream linux merge windows are short, there's definitely
a problem in tracking patches and getting a reasonable amount of
testing before they go upstream.  Even diffs are a problem as changes
can conflict.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

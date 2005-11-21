From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Migrating from CVS to Git
Date: Mon, 21 Nov 2005 15:25:22 -0700
Message-ID: <20051121222522.GB25773@colo.lackof.org>
References: <20051121165411.GF1598@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051121165411.GF1598@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Nov 21, 2005 at 09:54:11AM -0700, Matthew Wilcox wrote:
> I'm investigating what needs to be done to switch us from CVS to Git.
> So far I've done:
> 
>  - Set up a shared repository (current people with commit access:
>    bame,carlos,deller,grundler,jejb,kyle,rbrad,tausq,varenet,willy
>    others will be added on an ad-hoc basis)
>  - Changes made to that repository get sent to the p-l-cvs mailing list
>  - The repo is visible via gitweb: http://git.parisc-linux.org/
>  - Changes are linked from the mailing list

thanks!

> What needs to be converted?
> 
>  - Tagging.  It's now essentially free.  A tag in git terms is just a
>    ref.  You can add them at any point.  So we need to figure out what
>    we want to bless as good.

This is a distro problem. We should tag anything we change in the tree.

>  - Autobuilding.  This can change slightly as a result of how different
>    tagging is.  Do we want to just build every time there's a commit?

Something that anyone who has write access can trigger.
Just need to make sure we "commit" sets properly.
Will the Makefile commit will no longer trigger the auto-builder?

>    It'd be a bit wasteful, but CPU and disk is cheap.
>  - Documentation.  There's the git tutorials to link to, but something
>    specific to "Here's how you work on the p-l tree" would make the
>    learning curve less steep.

Thanks - I think what you already wrote should be sufficient for now:
	http://www.parisc-linux.org/faq/git.html

If someone is disappointed, please clone the content to wiki.parisc-linux.org
and improve it.

>  - Merging to Linus.  This should hopefully be an easier process,
>    being easier to cherry-pick changesets out of our shared repo.
>  - Merging from Linus.  We can now pull whenever we like, but how often
>    should we pull, and what bits of Linus' dev tree do we want to
>    inflict on our users?  ;-)

-rc releases is sufficient for me unless we some infrastructure broken
that needs faster turn-around to linus. I'm thinking of the spinlock
breakage that occurred when mingo's latest cleanup went in.

> I'm sure there are other things that need to be converted and discussed.

Given you already have gitview running, the auto-builder is the
only other tool I can think of.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

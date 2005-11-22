From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] Migrating from CVS to Git
Date: Mon, 21 Nov 2005 20:16:19 -0700
Message-ID: <20051122031619.GJ1598@parisc-linux.org>
References: <20051121165411.GF1598@parisc-linux.org>
	<20051121222522.GB25773@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051121222522.GB25773@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Nov 21, 2005 at 03:25:22PM -0700, Grant Grundler wrote:
> >  - Tagging.  It's now essentially free.  A tag in git terms is just a
> >    ref.  You can add them at any point.  So we need to figure out what
> >    we want to bless as good.
> 
> This is a distro problem. We should tag anything we change in the tree.

We don't need to any more.  We have a sha1 number (which is part of the
commit mail) that allows us to recover the state of the tree after any
commit.

> >  - Autobuilding.  This can change slightly as a result of how different
> >    tagging is.  Do we want to just build every time there's a commit?
> 
> Something that anyone who has write access can trigger.
> Just need to make sure we "commit" sets properly.
> Will the Makefile commit will no longer trigger the auto-builder?

I was hoping we'd no longer have to do Makefile commits.  Maybe we still
want to, though?

> Thanks - I think what you already wrote should be sufficient for now:
> 	http://www.parisc-linux.org/faq/git.html
> 
> If someone is disappointed, please clone the content to wiki.parisc-linux.org
> and improve it.

I thought about doing it on the wiki to begin with, but thought we
should have the git docs somewhere official first.

> -rc releases is sufficient for me unless we some infrastructure broken
> that needs faster turn-around to linus. I'm thinking of the spinlock
> breakage that occurred when mingo's latest cleanup went in.

I was thinking along similar lines.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

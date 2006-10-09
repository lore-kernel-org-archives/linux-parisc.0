From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] Proposal for git tree management
Date: Mon, 9 Oct 2006 12:06:52 -0600
Message-ID: <20061009180652.GB28254@parisc-linux.org>
References: <20061008004151.GZ2563@parisc-linux.org>
	<20061009032945.GB30517@colo.lackof.org>
	<7d01f9f00610090439g763c9260q257fad185bbdf326@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Thibaut VARENE <T-Bone@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <7d01f9f00610090439g763c9260q257fad185bbdf326@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Oct 09, 2006 at 01:39:58PM +0200, Thibaut VARENE wrote:
> >Please just make it "KISS". I'm only using git a few times per month
> >and it's just not enough to do anything complicated right now.
> >My goal is any git commits I make can (indirectly via kyle) go
> >to linus without the confusion you described.
> 
> I'd also strongly support a KISS approach. Yet I was under the
> impression that rebasing the tree would break any subsequent 'git
> pull' on older trees, is that right?

Yes.  And no.  It depends ;-)

If your refspec looks like this:

$ cat .git/remotes/origin 
URL: ssh://git.parisc-linux.org/var/git/linux-2.6.git
Pull: refs/heads/master:refs/heads/origin
Pull: refs/heads/linus:refs/heads/linus

then it's going to whinge about not being able to fast-forward.
However, if you add a +, like this:

Pull: +refs/heads/master:refs/heads/origin

then it'll update the ref, even if it's not a fast-forward.

> Along those lines I'm also thinking that assuming we want to revive
> our kernel autobuilder, we probably want to think of a git tree
> architecture that will induce minimal man handling of the autobuilder
> once started...

I agree, though I wouldn't expect rebasing to be a common operation
(every 2-3 months), it would suck to inadvertently break the autobuilder.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

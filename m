From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Proposal for git tree management
Date: Sun, 8 Oct 2006 21:29:45 -0600
Message-ID: <20061009032945.GB30517@colo.lackof.org>
References: <20061008004151.GZ2563@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061008004151.GZ2563@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Oct 07, 2006 at 06:41:52PM -0600, Matthew Wilcox wrote:
> 
> I think the git development model is working out pretty well.  We've
> committed around 100 patches to our tree since we switched to using git.
> Most of those have gone upstream, mostly through Kyle's hard work.

Agreed - many kudos/thanks to kyle!

...
> The obvious solution is to rebase the tree.  We start a new origin
> branch from point E and pull commit F onto it as commit F'.  But if we
> delete the former origin branch we lose our history.

I don't care so much about "our" history. I mostly care
about the commit message(s) that end up in linus' tree.

> I'm concerned we may get an unreasonable number of branches using this
> scheme.  Using a date (rather than a cardinal) helps understand how
> relevant a branch may be.

I think anything is ok if it helps us determine what's missing
from linus' tree and ship those patches (when ready) to him.
I'll probably end up ignoring the branches anyway.

Please just make it "KISS". I'm only using git a few times per month
and it's just not enough to do anything complicated right now.
My goal is any git commits I make can (indirectly via kyle) go
to linus without the confusion you described.

thanks!
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

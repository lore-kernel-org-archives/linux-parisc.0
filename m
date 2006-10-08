From: Matthew Wilcox <matthew@wil.cx>
Subject: [parisc-linux] Proposal for git tree management
Date: Sat, 7 Oct 2006 18:41:52 -0600
Message-ID: <20061008004151.GZ2563@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


I think the git development model is working out pretty well.  We've
committed around 100 patches to our tree since we switched to using git.
Most of those have gone upstream, mostly through Kyle's hard work.

However, figuring out what is left to merge is getting harder.  Due to
trying to keep Linus' tree clean, the commit that goes into our
development tree isn't the same one that ends up in his tree.  So it's
hard to tell what's been committed and what hasn't.  Don't get me wrong,
it's still an improvement over using CVS, but I think we could use Git
more effectively.

Right now, git-log linus..origin shows all the patches we've ever
committed, regardless of whether they've been merged.  A graphic would
make this easier:

A -> B -> C -> D' -> E
 \-> D -------/-> F --\->G

This illustrates Linus' tree at time A.  We clone his tree and make
change D, and eventually it ends up in Linus' tree as D' (after changes
B and C have happened in his tree).  At point G, git-log linus..master
shows change D, even though it was already merged to the linus tree.

The obvious solution is to rebase the tree.  We start a new origin
branch from point E and pull commit F onto it as commit F'.  But if we
delete the former origin branch we lose our history.  So I'd like to
rename it (probably to something like devel-2006-10-07), and create a
new origin.  That way we can still go back and find our history, and
still keep git-log useful.

I'm concerned we may get an unreasonable number of branches using this
scheme.  Using a date (rather than a cardinal) helps understand how
relevant a branch may be.

Anyway, comments, suggestions, alternatives, abuse?
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

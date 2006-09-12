From: Matthew Wilcox <matthew@wil.cx>
Subject: [parisc-linux] On keeping history clean
Date: Tue, 12 Sep 2006 06:46:23 -0600
Message-ID: <20060912124622.GM29775@parisc-linux.org>
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


So you've done some work on the parisc git tree, you've been committing
stuff as you go, and now it's time to merge back.  Unfortunately, other
people have also been working on the tree, and so your history is full
of merges that you'd like to get rid of.  Here's how to do it.

I have a pretty simple situation here; I did a couple of commits, then I
pulled the recent 2.6.18-rc6 merge.

So what would I push?

$ git-log origin..master
commit 59c4c2b0510ff0b8acd904c0cbc52a7cba788baf
Merge: 302eeed... df0e7cd...
Author: Matthew Wilcox <matthew@wil.cx>
Date:   Tue Sep 12 05:21:19 2006 -0600

    Merge branch 'master' of /var/git/linux-2.6

commit 302eeedbcb19477ebaee30fe934f4b82cb44fbba
Author: Matthew Wilcox <matthew@wil.cx>
Date:   Tue Sep 12 05:19:15 2006 -0600

    Remove some obsolete comments and I checked that Reo is similar to Ike.

commit 7f51f71822a4019136d3297ba5b50ff9fca8e9f3
Author: Matthew Wilcox <matthew@wil.cx>
Date:   Tue Sep 12 05:17:59 2006 -0600

    Hardware found in the rp8400

The merge commit has to be eliminated.  So create a new branch:

$ git-branch merge origin
$ git-checkout merge
$ git-cherry-pick -e 7f51f71822a4019136d3297ba5b50ff9fca8e9f3
$ git-cherry-pick -e 302eeedbcb19477ebaee30fe934f4b82cb44fbba

I use the -e so I can get rid of the message appended by cherry-pick.

Now let's pretend the original branch never happened.

$ git-branch -D master
$ git-checkout -b master
$ git-branch -d merge

And finally, push to palinux.

$ git-push

Voila, no more merge commits.  I'm sure someone with more git expertise
can tell me a better way of doing this ... but it works.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

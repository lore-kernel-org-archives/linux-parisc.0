From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] Git tree rebased
Date: Tue, 31 Oct 2006 09:05:16 -0700
Message-ID: <20061031160516.GC26964@parisc-linux.org>
References: <20061031150001.GB26964@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061031150001.GB26964@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Oct 31, 2006 at 08:00:01AM -0700, Matthew Wilcox wrote:
> If your remotes file currently has a line in it like:
> 
> 	Pull: refs/heads/master:refs/heads/origin
> 
> then you'll want to add the '+' at the beginning:
> 
> 	Pull: +refs/heads/master:refs/heads/origin
> 
> otherwise git will refuse to update.  With the +, it will complain, but
> do it anyway.

As we've now learned, it's not that easy.  The problem is that all your
local repositories have a divergent branch of history from the one now
in the shared repo's master branch.  Here's a recovery guide.  Sorry for
all the inconvenience.

First, be sure your tree is clean before you pull.  ie git-diff returns
nothing.  Otherwise you'll be in even more pain than the rest of this.

Now, if you have no commits outstanding vs upstream
(git-log origin..master returns nothing), life is fairly easy.
After you put in the + above, you need to git-pull, then

git-checkout origin
git-branch -D master
git-checkout -b master

Now you can work as before.


If you have commits in your master branch, then we need to move them
over to the new origin branch.

git-fetch origin devel-2006-10-31:devel-2006-10-31
git-fetch origin
git-checkout -b new-master origin
for i in `git-rev-list devel-2006-10-31..master |tac`; do if ! git-cherry-pick -r $i; then sh; fi; done
# assuming the above goes OK
git-branch -D master
git-checkout -b master
git-branch -d new-master


Any more problems, please let me know.  I hadn't thought through all the
consequences of rebasing the current master branch.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

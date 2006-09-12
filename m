From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] Zen and the Art of Merge Maintenance
Date: Tue, 12 Sep 2006 11:19:29 -0400
Message-ID: <20060912151929.GB15336@athena.road.mcmartin.ca>
References: <20060912124622.GM29775@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060912124622.GM29775@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Ok, this is how I've been doing merges on palinux.

(Using palinux only to minimize the amount of uploading I have to do
 when I push the tree)

## first, update the `linus' branch on palinux

$ git fetch \
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git \
 master:linus

## then push the branch back, and any new tags

$ git push origin linus:linus
$ git push --tags origin

## make sure the tree is clean

$ git checkout -f

## then do the merge from a tag

$ git pull origin refs/tags/v2.6.18-rc6:master

## look at, and fix up conflicts

$ vi Makefile

## edit the merge message to remove the conflicts section

$ git commit -a

## tag the merge

$ git tag -a v2.6.18-rc6-pa0

## push

$ git push origin
$ git push --tags origin

## and we're done
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

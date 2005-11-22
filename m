From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] Migrating from CVS to Git
Date: Mon, 21 Nov 2005 22:27:26 -0500
Message-ID: <20051122032726.GA9450@tachyon.int.mcmartin.ca>
References: <20051121165411.GF1598@parisc-linux.org>
	<20051121222522.GB25773@colo.lackof.org>
	<20051122031619.GJ1598@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20051122031619.GJ1598@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Nov 21, 2005 at 08:16:19PM -0700, Matthew Wilcox wrote:
> > >  - Autobuilding.  This can change slightly as a result of how different
> > >    tagging is.  Do we want to just build every time there's a commit?
> > 
> > Something that anyone who has write access can trigger.
> > Just need to make sure we "commit" sets properly.
> > Will the Makefile commit will no longer trigger the auto-builder?
> 
> I was hoping we'd no longer have to do Makefile commits.  Maybe we still
> want to, though?
>

I dunno, maybe it would be easier to just manually thunk the autobuilder
with a commit id whenever we feel it's justified, and let the autobuilder
worry about the incrementing -pa numbers? There's an embedded CONFIG 
option that will embed the commit sha1sum in the kernel version, turning
this on in defconfigs would be good for everyone who pulls our tree
from git. 

Btw, if no one has used it yet, the git bisect stuff is pretty darn
cool.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

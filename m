From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] Let's Try Something New(tm)
Date: Sat, 17 Feb 2007 12:11:48 -0500
Message-ID: <20070217171148.GD2880__42620.3872230419$1416624291$gmane$org@athena.road.mcmartin.ca>
References: <20070217064648.GA2880@athena.road.mcmartin.ca>
	<20070217103018.GD26273@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070217103018.GD26273@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Feb 17, 2007 at 03:30:18AM -0700, Grant Grundler wrote:
> On Sat, Feb 17, 2007 at 01:46:48AM -0500, kyle mcmartin wrote:
> > And, well, I'm kind of getting sick of it. I propose for at least the next
> > few months, instead of everyone being able to pollute the shared tree, they
> > keep all their work in branches. Instead of merging or pushing, or whatever,
> > you can send the patches to the list for review. This will work more or less
> > like linux-kernel does, hopefully. 
> 
> Ok. Fair enough. Well said. Can someone with more git experience than I
> have share a recipe for creating and committing to a git branch?
> Maybe post that on one of the existing HOW-TO web pages or a new wiki page?
> 

I will post it to the wiki page, but the basic gist is you checkout a new
branch...

git checkout -b NEW_BRANCH_NAME

to branch off of the current working branch...

Or

git checkout -b NEW_BRANCH SOME_TAG_OR_OTHER_HEAD_OR_SHA1

to build a new branch at some previous or future point.

You can see what you're doing when you gitk afterwards.

Use git-branch to find out what branch you are on.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

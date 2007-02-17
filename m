From: kyle mcmartin <kyle@parisc-linux.org>
Subject: [parisc-linux] Let's Try Something New(tm)
Date: Sat, 17 Feb 2007 01:46:48 -0500
Message-ID: <20070217064648.GA2880__37789.6330006935$1416624290$gmane$org@athena.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
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

So I just finally got around to trying to organize a bit of the chaos
we have in our "git"[1] tree so that it can be sent along to Linus[2].

And, well, I'm kind of getting sick of it. I propose for at least the next
few months, instead of everyone being able to pollute the shared tree, they
keep all their work in branches. Instead of merging or pushing, or whatever,
you can send the patches to the list for review. This will work more or less
like linux-kernel does, hopefully. 

Your patch will get an ACK or NAK from others here, and I'll directly
merge the mail into my git tree, instead of waiting until there's an aperture
of Minimal Kyle Apathy[3] and having to sync up a pile of junk[4].

The goal here is n-fold, where n is determined by the number of points I'm
able to rattle off here and will neglect to update when I finish:

1. Reduce the number of commits and reversions because someone didn't like
   the change. Instead, we can all comment together. Yay. Blissful harmony.

2. Reduce the number of brown paper bag bugs, which mean I have to fold
   multiple changesets together. Annoying.

e. Increase our use of the idea of merges and changesets to form a real
   tree, instead of just blatting everything into a linear shared tree.

pi. Reduce the amount of half-baked commits, not to pick on Helge, but
   the ENTRY macros were a good example of this. I count 4 commits just to
   add these macros.

Anyway, hopefully this will reduce the amount of shit I have to filter
through in order to sync up to Linus, and maybe we can actually merge more
than once per cycle, and have proper bugfixes, and such. Wouldn't it be nice?

Objections? Tomatoes?

The Last Word(tm):
	Well. It works for everyone else. Why should we be special?

[01:41] * kyle falls off the pulpit.

Footnotes:
1: Frankly I find this shared git tree thing to be a huge waste of my time,
   we're no better off than we were with CVS...

2: Don't know what difference it makes having a buildable tree when SMP
   is utterly broken, and SCSI offlines devices left, right and centre when
   you're trying to get some work done... So yeah, you could say I'm a little
   unmotivated to care.

3: Apathy was pretty high right now, but I'm bored, and it is Friday night.
   That and Jeff asked real nice for me to get the Ubuntu kernel tree
   somewhat up to date so he can do glibc work.

4: Yeah, most of you know way better than me, and write far less shite code
   than I do. But I'm the one having to do the merging.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

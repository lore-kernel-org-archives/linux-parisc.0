From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] A more frequent merge methodology
Date: Thu, 28 Oct 2004 16:22:43 +0100
Message-ID: <20041028152243.GB10769@parcelfarce.linux.theplanet.co.uk>
References: <20041021181110.GG16153@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041021181110.GG16153@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Oct 21, 2004 at 07:11:10PM +0100, Matthew Wilcox wrote:
> It's been clear to me for a while that we need more regular merges
> with Linus' tree.  Part of the fault for that is with me -- I don't
> send patches to Linus as fast as I could [1].  Another part of the fault
> is with our process.  We only merge full releases and -rc releases.
> So, after some awk hacking (thanks to Paul Bame) and a bit of thinking,
> I'd like to use a more development-oriented process.

Neither Paul nor I have been able to come up with an acceptable fix for the
unforseen problems that -rcN-bkM-paQ would encounter.  But I'm not entirely
willing to give up on more frequent merges.  Here's my current thinking,
using Makefile as an example:

-- current --
CVS2_6_9_BK6_PA7: 1.280
LINUS_2_6_10_RC1: 1.280.2
linus: 1.280.2.1
CVS2_6_10_RC1_PA0: 1.281
CVS2_6_10_RC1_PA1: 1.283

-- future --
LINUS_2_6_10_RC1_BK6: 1.283.2.1
CVS2_6_10_RC1_BK6_PA0: 1.283.2.2
CVS2_6_10_RC1_PA2: 1.284
LINUS_2_6_10_RC2: 1.284.2
CVS2_6_10_RC2_PA0: 1.285
CVS2_6_10_RC2_PA1: 1.286
CVS2_6_10_RC2_PA2: 1.287
LINUS_2_6_10_RC2_BK3: 1.287.2.1
CVS2_6_10_RC2_BK3_PA0: 1.287.2.2

ie create a branch tag at the current top of tree, but then merge the
PA work onto that branch rather than merge the contents of that branch
back onto mainline.  Development work continues on mainline and my need
for more frequent merges doesn't have to impinge on anyone else's needs.

So what's the point in committing these bits to CVS?  After all, I
could as well do the merge in my own private tree and not commit it back.
I think it's useful for other people to catch merge errors that I miss ;-)
and it helps us cherry-pick patches from -bk snapshots which fix problems.

I'll probably move a couple of tags around -- perhaps parisc-bk and linus-bk

Comments?

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

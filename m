From: Matthew Wilcox <matthew@wil.cx>
Subject: [parisc-linux] A more frequent merge methodology
Date: Thu, 21 Oct 2004 19:11:10 +0100
Message-ID: <20041021181110.GG16153@parcelfarce.linux.theplanet.co.uk>
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


It's been clear to me for a while that we need more regular merges
with Linus' tree.  Part of the fault for that is with me -- I don't
send patches to Linus as fast as I could [1].  Another part of the fault
is with our process.  We only merge full releases and -rc releases.
So, after some awk hacking (thanks to Paul Bame) and a bit of thinking,
I'd like to use a more development-oriented process.

Those on the p-l-cvs list will be seeing the current 2.6.9-bk6 import.
I'm not committing to any kind of schedule for these, but I do intend
to merge every few days.  If two weeks go by without merges, I'm either
slacking or on holiday.

Obviously, this is going to lead to more frequent, but hopefully
also more short-term breakage.  If anyone wants to, they are allowed,
nay, encouraged to create branches in our CVS tree for the purposes
of stabilisation.  I see no problems with 2.6.9-paX continuing as a
"stable series", as long as fixes also go onto the trunk.


[1] Those who want to debug me instead of changing our development
process should be in possession of a degree in psychiatry and be willing
to travel to the Ottawa area for an extended period ;-)

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

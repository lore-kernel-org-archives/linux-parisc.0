Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id ABD95484B
	for <parisc-linux@parisc-linux.org>;
	Sat,  7 Feb 2004 10:21:09 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1ApW8i-0004OF-BT
	for parisc-linux@parisc-linux.org; Sat, 07 Feb 2004 17:21:08 +0000
Date: Sat, 7 Feb 2004 17:21:08 +0000
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20040207172108.GV24334@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Cc: 
Subject: [parisc-linux] Merge status with 2.6
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


I just got a significant amount of updates merged with Linus, so I
thought I'd give an update on where we're at merge-wise.  I know this
is a bit detailed, but I'd appreciate you reading it (particularly if
you commit code to our CVS) since there's some questions in here.

The total size of our diff vs 2.6.3-rc1 is 441434 bytes
( 78 files changed, 7547 insertions(+), 3413 deletions(-) )

However, 3 patches were merged after 2.6.3-rc1 was released, bringing that
down to 432775 bytes
( 74 files changed, 7502 insertions(+), 3369 deletions(-) )

Of that, 229111 bytes
( 23 files changed, 5811 insertions(+), 819 deletions(-) )
is the input layer changes for ps/2 and HIL.  I'm assuming Helge's taking
care of merging that with Vojtech (thanks a lot, Helge!)

Another 163675 bytes
( 18 files changed, 1062 insertions(+), 2468 deletions(-) )
is the scsi sym2/ncr work I've been doing in this tree.  I need to finish
that and merge it with jejb.

14231 bytes ( 8 files changed, 342 insertions(+), 7 deletions(-) ) is
Carlos' compat_signal work.  This is going upstream via akpm and should
be in 2.6.4.  Excellent work, Carlos.

After taking off the files in our tree we don't want to merge upstream
(the Makefile diff and our todo list), we're left with just 22019 bytes
of diff ( 22 files changed, 225 insertions(+), 74 deletions(-) ).

Breaking that down:
drivers/ide/pci/ns87415.c: I pinged Bart about this patch last week.
drivers/net/tg3.c: Doesn't actually affect PA-RISC; I'll try to get it
	merged with jgarzik/davem this week.
drivers/net/tulip: Some of this I'll try to get merged with jgarzik,
	other bits he wants rewritten before he'll accept.
drivers/pcmcia: I believe this is jejb's work -- Shall I send it to rmk?
drivers/serial: I don't think this can go upstream, it's part of our console
	hackery.
fs/intermezzo/dir.c: Compile fix, I resent it upstream last week; they promise
	to get it merged soon.
fs/smbfs/inode.c: Compile fix for those without uid16.  I'll try and get
	it upstream this week.
include/linux/console.h: Console hackery.
include/linux/mca.h: Need to merge it upstream.
include/linux/serial_core.h: If this is still needed, it should go upstream.
kernel/printk.c: Console hackery.
kernel/resource.c: I added this.  I'll send it to l-k for discussion.
kernel/sysctl.c: Have we really removed these sysctls or is this a merge
	artifact?
sound/oss/kahlua.c: Alan says to simply disable this driver for non-x86
	as it's used for an embedded board.

... and that's it!  I think the only thing that prevents Linus' tree from
building and working on at least a subset of configurations is the console
hackery.

We're in really good shape in 2.6, thanks to all of you.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

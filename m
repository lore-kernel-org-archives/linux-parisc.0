From: Matthew Wilcox <matthew@wil.cx>
Subject: [parisc-linux] State of the kernel
Date: Mon, 14 Mar 2005 18:12:15 +0000
Message-ID: <20050314181215.GV21986@parcelfarce.linux.theplanet.co.uk>
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


Those subscribed to the parisc-linux-cvs list may have noticed the huge
number of merges I've been doing recently.  This has been mostly in aid
of this year's goal of getting PA-RISC to build out of Linus' tree.  I'm
at the point where it's reasonable to give a status update now, so here goes:

2.6.11-pa0 was approximately 813k of diff against Linus' tree with
changes everywhere.  We're now down to 396k of diff against 2.6.11-bk10!

Here's how that breaks down:

 - 196k of it is sym2 driver changes.  I expect that will be merged
   upstream shortly.
 - 49k of it is other scsi changes; 53c700, ncr53c8xx and scsi_transport_spi.
   Some of this is merged in James' scsi-misc-2.6 tree and other bits are
   waiting for that tree to be merged to Linus', hopefully before -rc1.
 - 56k is the ad1889 driver and related changes.  I'm holding off on
   submitting this until the driver is a bit closer to working on the
   request of Kyle and Stuart.
 - 40k is unmerged HIL header files.  I think they were inadvertently omitted;
   I've just pinged Linus and Vojtech about them
 - 3k is misc input stuff.
 - 25k is compat-related code.  I'm talking with Stephen Rothwell about
   some of it, this is going to be difficult to merge, I think.
 - 3k is Tulip driver changes.  Grant is handling these.
 - I've sent another 6k of misc changes to Linus today.
 - There's another 12k of misc patches in our tree:
   - some Kconfiggery (I'll take care of this)
   - NO_IRQ / SERIAL_IRQ_NONE (waiting on Ben Herrenschmidt)
   - pcmcia (James will take care of this)
   - FIONREAD (I'll deal with this)
   - IDE header (I want to review this)
   - CON_BOOT (needs fixing, I think I see what to do)
   - OPD bugfix (doesn't need to go upstream)
   - A small PA PCI patch I want to review
   - Perf counters update (missed today's submission)

I think only trivial fixes are needed to Linus' tree to allow
712_defconfig to build and boot.  The major merge headaches are the
CON_BOOT and compat code.  I'm going to stop deluging Linus with patches
for a week or so and work on making some of the unmergable bits more
mergable.

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

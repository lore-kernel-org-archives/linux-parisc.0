From: Matthew Wilcox <willy@debian.org>
Subject: [parisc-linux] Merge status update
Date: Sat, 14 Aug 2004 22:08:07 +0100
Message-ID: <20040814210807.GX12936@parcelfarce.linux.theplanet.co.uk>
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


Haven't done these in a while, so here goes:

I merged about 250k of patch to Linus right before 2.6.8 came out:

$ ls -l parisc-2.6.8*diff
-rw-r--r--    1 willy    willy      466638 Jul 27 18:54 parisc-2.6.8-rc2.diff
-rw-r--r--    1 willy    willy      484286 Aug 13 08:41 parisc-2.6.8-rc4.diff
-rw-r--r--    1 willy    willy      239078 Aug 14 11:22 parisc-2.6.8.1.diff

I just sent him another 20k:
-rw-r--r--    1 willy    willy       20698 Aug 14 14:30 sound-2.6.8.1.diff

The bulk of the patch is HIL and other input-related stuff:
-rw-r--r--    1 willy    willy      173466 Aug 14 14:43 hil-2.6.8.1.diff

Then there's the compat_siginfo patch:
-rw-r--r--    1 willy    willy       20071 Aug 14 14:56 compat-2.6.8.1.diff

The remainder:
-rw-r--r--    1 willy    willy       20803 Aug 14 14:58 one.diff
is composed of:
 - A gcc bug workaround
 - A BUG_ON() I added that never triggers
 - The console mess
 - SERIAL_IRQ_NONE
 - A couple of arch/parisc bits that got committed after I merged ;-)
 - smbfs CONFIG_UID16
 - console Kconfig changes
 - A minor sym2 change I need to send to James ;-)
 - A minor lasi700 change, ditto
 - pcmcia probing changes (James mentioning to Russell)
 - tulip MII changes that someone needs to engage jgarzik in
   bare-knuckle boxing over.
 - ns87415 IDE changes I need to investigate and send to Bart
 - an ia64 Kconfig change I should send to Tony.

So a lot of minor stuff, but it's still not possible to build parisc
out of Linus' tree ;-(

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

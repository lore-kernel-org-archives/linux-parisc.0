From: Matthew Wilcox <matthew@wil.cx>
Subject: [parisc-linux] Merge update status
Date: Wed, 3 Nov 2004 16:54:36 +0000
Message-ID: <20041103165436.GI24690@parcelfarce.linux.theplanet.co.uk>
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


As some of you may have noticed, I've been busily splitting and merging
our patches with Linus.  Excluding the patches I've sent today which
haven't been accepted yet (I expect he was up late watching the election
;-), here's the remaining to-merge list:

 - parisc_device
 - PDC_INITIATOR rewrite
 - PDC stable storage
 - iomap
 - ns87415
 - input (helge sent to vojtech recently)
 - tulip (vetoed by jgarzik)
 - pci early fixups (should go in via gregkh)
 - pcmcia (should go in via rmk)
 - sym2 (sent to linux-scsi recently)
 - ncr53c8xx trivial patch
 - serial (may now be obsolete)
 - smbfs CONFIG_UID16
 - compat_signal
 - printk/CON_BOOT mess
 - resource oneliner
 - shmem gcc 3.3 OPD workaround (pre-vetoed)
 - O= fix (obsoleted)

The current (400k) patch is at
http://www.parisc-linux.org/~willy/parisc-2.6.10-rc1-bk13-a.diff

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

From: Matthew Wilcox <matthew@wil.cx>
Subject: [parisc-linux] Five year old bug found ;-)
Date: Fri, 21 Jan 2005 14:52:07 +0000
Message-ID: <20050121145207.GN25940@parcelfarce.linux.theplanet.co.uk>
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


OK, I tracked down the change ... it was merely 4 years, 3 months ago ;-)

In txn_alloc_data, we test the bit width:

-       if ((virt_irq - CPU_IRQ_BASE) > (1 << (bits_wide - 1))) {
-               panic("Sorry -- didn't allocate valid IRQ for this device\n");
-       }

But the bracketing is wrong.  GSC devices could only allocate up to
16 IRQs (1 << (5 - 1)).  This should be 31, ((1 << bits_wide) - 1).
Or even better, just use >= and it becomes:

	if ((virt_irq - CPU_IRQ_BASE) >= (1 << bits_wide))

Much more intuitive and easy to understand, IMO.  Oh, and I'm rewriting
this to get rid of the panic ... what's committed later will look slightly
different to this.

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

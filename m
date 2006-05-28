From: Chris Frost <chris@frostnet.net>
Subject: [parisc-linux] ohci1394 and ioremap()
Date: Sat, 27 May 2006 23:14:43 -0700
Message-ID: <20060528061443.GA20234@pooh.cs.ucla.edu>
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

In case this issue is unknown, when ohci1394_pci_probe() calls
ioremap() a notice is printed that ioremap should not be used for
non-cacheable memory regions. Changing ioremap() to ioremap_nocache()
removes the message; both versions appear to be functional. This is
with kernel 2.6.16-pa11 on a B1000/785.

According to previous threads, it sounds like a more correct solution
abstracts the ioremap call using the pci_iomap API:
	http://www.mail-archive.com/netdev@vger.kernel.org/msg10410.html

I no longer have the firewire card, and so can't comment much further, but
wanted to mention the above just in case!

-- 
Chris Frost  |  <http://www.frostnet.net/chris/>
-------------+----------------------------------
Public PGP Key:
   Email chris@frostnet.net with the subject "retrieve pgp key"
   or visit <http://www.frostnet.net/chris/about/pgp_key.phtml>
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

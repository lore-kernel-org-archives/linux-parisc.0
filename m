From: Matthew Wilcox <matthew@wil.cx>
Subject: [parisc-linux] K-class support improved
Date: Sat, 10 Sep 2005 12:46:03 -0600
Message-ID: <20050910184603.GE4770@parisc-linux.org>
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


Those watching the CVS list will see that I've renovated some code to
improve K-class support.  On Thursday, I tracked down the SMP hang when
initialising the Mux serial driver (it was a missing spin_lock_init()).
Today, I rewrote some of the driver probing so we allocate iomem resources
sufficiently early that the fancy code I wrote to avoid allocating PCI
iomem resources over the top of other devices actually works ;-)

I also updated the defconfig to include support for the Mux console so
when 2.6.13-pa2 appears on http://cvs.parisc-linux.org/download/linux-2.6/
it should work.  I'd appreciate it if people with a K-class could test
this assumption ;-)  The E-class should also work (as well as it ever
has ... still no Wizard SCSI support).

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

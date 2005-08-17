From: Kurt Fitzner <kfitzner@excelcia.org>
Subject: [parisc-linux] CONFIG_PDC_NARROW leftover in sba_iommu.c
Date: Tue, 16 Aug 2005 23:31:25 -0600
Message-ID: <4302CBAD.3010506@excelcia.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
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

While investigating why I couldn't get a 64 bit kernel to boot on my
machine, I discovered that there is a holdout use of the old
CONFIG_PDC_NARROW config option.

It occurs in drivers/parisc/sba_iommu.c, line 108.

I'm not sure if this is in any way critical or not.

	Kurt.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

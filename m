From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] BTLBs usable as HUGHTLBs ?
Date: Sun, 31 Oct 2004 15:04:30 +0100
Message-ID: <200410311504.30552.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
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

Maybe a stupid question from someone not knowledgeable of memory-stuff on Linux...

Since HPPA offers Block-TLBs (BTLBs), couldn't those be used comparable/wrapped as so-called HUGHTLBs (CONFIG_HUGETLBFS) as available on i386/ia64 ?

from /proc/cpuinfo on my 715/64:
BTLB fixed      : max. 16384 pages, pagesize=4096 (64MB)
BTLB fix-entr.  : 0 instruction, 0 data (8 combined)		<--- 8
BTLB var-entr.  : 0 instruction, 0 data (0 combined)

Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

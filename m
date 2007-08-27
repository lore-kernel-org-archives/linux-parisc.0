From: Kyle McMartin <kyle@parisc-linux.org>
Subject: [parisc-linux] parisc v2.6.23-rc3-pa2
Date: Sun, 26 Aug 2007 23:48:31 -0400
Message-ID: <20070827034831.GC18343__4304.91353986344$1416624429$gmane$org@fattire.cabal.ca>
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

This fixes a nullptr deref caused by udev just after userspace entry...
somehow. Bisected to commit to Makefile added build-id notes.

Cheers,
	Kyle

http://ftp.kernel.org/pub/linux/kernel/people/kyle/parisc/2.6.23-rc3/v2.6.23-rc3-pa2.diff.bz2

Changes since -pa1:
+parisc/add-notes-section.patch
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

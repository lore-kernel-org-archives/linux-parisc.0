From: Matthias Klose <doko@cs.tu-berlin.de>
Subject: [parisc-linux] gij/gcj-dbtool segfaults
Date: Thu, 7 Sep 2006 22:51:17 +0200
Message-ID: <17664.34373.179880.934087@gargle.gargle.HOWL>
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

at least no more bus errors; that started after the backport of
classpath-0.92 and gcj-4.2 to the 4.1 branch; I built a current 4.2
compiler yesterday, but found the same behaviour on the trunk.  It's
reproducible by installing gij-4.2 (or by running gcj-dbtool-4.2).
The packages currently are in the NEW queue and should show up in
experimental.  In the meantime you can get them from

  deb http://people.debian.org/~doko/gcc-4.2/ ./

The libgcj8-dbg does have the detached debugging symbols.

  Matthias
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

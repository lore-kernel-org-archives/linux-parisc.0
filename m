From: Randolph Chung <randolph@tausq.org>
Subject: [parisc-linux] KDB v4.4 support for parisc-linux
Date: Fri, 6 Aug 2004 15:00:54 -0700
Message-ID: <20040806220054.GB546@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
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

KDB 4.4 support for parisc-linux is now available. 

To use it, first get the arch-indep kdb patch from SGI:
ftp://oss.sgi.com/projects/kdb/download/v4.4/kdb-v4.4-2.6.8-rc2-common-1.bz2

Then apply the parisc-specific patch:
http://ftp.parisc-linux.org/patches/kdb-v4.4-2.6.8-rc2-parisc-1.bz2

Tested in 32-bit UP and 64-bit UP/SMP against 2.6.8-rc2-pa6. There are
still various bugs and unimplemented features, but it might still be
interesting.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

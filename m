From: Matthew Wilcox <matthew@wil.cx>
Subject: [parisc-linux] Please fix the OPL mess
Date: Tue, 13 Sep 2005 11:34:22 -0600
Message-ID: <20050913173422.GF32395@parisc-linux.org>
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


I'm not entirely sure which of our intrepid sound hackers introduced
this problem, but it's a PITA when trying to build a suitable kernel for
ia64 boxes out of the parisc tree, and I suspect for C8000 too.  Could
somebody fix it?

  CC      sound/drivers/opl3/opl3_lib.o
sound/drivers/opl3/opl3_lib.c: In function `snd_opl3_free':
sound/drivers/opl3/opl3_lib.c:336: error: structure has no member named `unmap_on_free'
sound/drivers/opl3/opl3_lib.c: In function `snd_opl3_create_main':
sound/drivers/opl3/opl3_lib.c:421: error: structure has no member named `unmap_on_free'

Easiest way to reproduce the error is probably to enable the FM801
driver, but obviously this library is used by a lot of drivers.

Thanks
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

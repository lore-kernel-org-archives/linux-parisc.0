From: Chris Frost <chris@frostnet.net>
Subject: [parisc-linux] Re: [fuse-devel] Example filesystem fail to init on
	parisc
Date: Sat, 18 Mar 2006 20:39:39 -0800
Message-ID: <20060319043939.GP26474__44157.688241876$1416624588$gmane$org@pooh.bubble.frostnet.net>
References: <20060308071445.GA28275@pooh.bubble.frostnet.net>
	<E1FGwXn-0005Dh-00@dorka.pomaz.szeredi.hu>
	<20060309055002.GJ26474@pooh.bubble.frostnet.net>
	<E1FHKQR-0007JU-00@dorka.pomaz.szeredi.hu>
	<20060309223622.GP26474@pooh.bubble.frostnet.net>
	<E1FHfby-00052b-00@dorka.pomaz.szeredi.hu>
	<20060310230000.GX26474@pooh.bubble.frostnet.net>
	<E1FIlC6-0005ts-00@dorka.pomaz.szeredi.hu>
	<E1FJsHo-0006Yf-00@dorka.pomaz.szeredi.hu>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=unknown-8bit
Cc: fuse-devel@lists.sourceforge.net,
 jick.nan@gmail.com,
 parisc-linux@parisc-linux.org
To: Miklos Szeredi <miklos@szeredi.hu>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <E1FJsHo-0006Yf-00@dorka.pomaz.szeredi.hu>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

The kernel output on my parisc machine using copy_to/from_user2() is a bit
different:


woozle:/home/frost/fuse_test# insmod copytest.ko
woozle:/home/frost/fuse_test# cat /proc/fs/test
woozle:/home/frost/fuse_test# echo hello > /proc/fs/test
woozle:/home/frost/fuse_test# dmesg | tail
program smartd is using a deprecated SCSI ioctl, please convert it to SG_IO
test_read 000258a0 1024 0
dst: 000258a0 page: 10acb460 offset: 2208 mapaddr: 3b523000 ptr: 3b5238a0
  test_read: 7
test_read 000258a0 1024 7
  test_read: 0
test_write 000d6c08 6 0
src: 000d6c08 page: 108e9060 offset: 3080 mapaddr: 2c403000 ptr: 2c403c08
<ßßßßßß>
  test_write: 6
woozle:/home/frost/fuse_test#


Changing the copy_to/from_user2() calls to copy_to/from_user1() changes
the output to include the "Hello!" and "<hello\n>" you see on an x86
(x86, I presume);


woozle:/home/frost/fuse_test# insmod copytest.ko
woozle:/home/frost/fuse_test# cat /proc/fs/test
Hello!
woozle:/home/frost/fuse_test# echo hello > /proc/fs/test
woozle:/home/frost/fuse_test# dmesg | tail -9
program smartd is using a deprecated SCSI ioctl, please convert it to SG_IO
test_read 000258a0 1024 0
  test_read: 7
test_read 000258a0 1024 7
  test_read: 0
test_write 000d6c08 6 0
<hello
>
  test_write: 6
woozle:/home/frost/fuse_test# 


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

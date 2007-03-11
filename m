From: Guy Martin <gmsoft@gentoo.org>
Subject: [parisc-linux] glibc dladdr test failure
Date: Sun, 11 Mar 2007 20:17:50 +0100
Message-ID: <20070311201750.0f280e87__27286.3079830588$1416624324$gmane$org@localhost>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
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



Hi all,


The dladdr test of the glibc testsuite fail for the following reason :

in elf/dl-addr.c:30, the address passed is transformed this way :
  const ElfW(Addr) addr = DL_LOOKUP_ADDRESS (address);


While in ports/sysdeps/hppa/dl-lookupcfg.h:35, you have this :

/* Clear the bottom two bits so generic code can find the fdesc entry */
#define DL_LOOKUP_ADDRESS(addr) \
  (_dl_lookup_address ((void *)((unsigned long)addr & ~3)))


If you don't apply this bitmask, addr is set to the original value of
the passed address and it is resolved correctly.

What should be the correct fix ?


  Guy


-- 
Guy Martin
Gentoo Linux - HPPA port lead

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 722FD4829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Aug 2002 15:50:49 -0600 (MDT)
Received: from [192.168.95.4] (p5080D804.dip.t-dialin.net [80.128.216.4])
	by mail.scram.de (8.11.6+3.4W/8.11.0) with ESMTP id g7FLokB23502
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Aug 2002 23:50:47 +0200 (CEST)
Date: Thu, 15 Aug 2002 23:49:24 +0200 (CEST)
From: Jochen Friedrich <jochen@scram.de>
To: HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
Message-ID: <Pine.LNX.4.44.0208152341001.18472-100000@gfrw1044.bocc.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] unreliable mmap on 720
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi,

i recognized that mmap operations seem unreliable on HP720 platform. The 
following test program (taken from cyrus imap configure) demonstrates the 
problem:

#include <sys/types.h>
#include <sys/mman.h>
#include <fcntl.h>

main()
{
  char *base;
  int fd = open("testmmap", O_RDWR|O_CREAT|O_TRUNC, 0666);

  if (fd == -1)
  {
    printf("can't open testmmap\n");
    exit(1);
  }
  if (write(fd, "test", 4) != 4)
  {
    printf("can't write testmmap\n");
    exit(1);
  }
  fsync(fd);
  base = mmap((caddr_t)0, 100, PROT_READ, MAP_SHARED
#ifdef MAP_FILE
  | MAP_FILE
#endif
#ifdef MAP_VARIABLE
  | MAP_VARIABLE
#endif
  , fd, 0L);

  if (base == (caddr_t)-1)
  {
    printf("can't mmap testmmap\n");
    exit(1);
  }
  if (strncmp(base, "test", 4) != 0)
  {
    printf("memory not test\n");
    exit(1);
  }
  if (write(fd, "test", 4) != 4) 
  {
    printf("can't append testmmap\n");
    exit(1);
  }
  fsync(fd);
  if (strncmp(base+4, "test", 4) != 0)
  {
    printf("memory not testtest: %s\n", base);
    exit(1);
  }
  exit(0);
}

# ./testmmap
memory not testtest: test
# ./testmmap
# ./testmmap
# ./testmmap
# ./testmmap
# ./testmmap
# ./testmmap
# ./testmmap
# ./testmmap
# ./testmmap
# ./testmmap
memory not testtest: testtest

This only seems to happen on 720 (i couldn't replicate the bug on a 715 
with the same kernel booted up). Things seem to get worse if the load on 
the box rises (if the test is done on an idle machine, testmmap works 
without problems). Weird...

This is 2.4.19-pa3.

Cheers,
--jochen

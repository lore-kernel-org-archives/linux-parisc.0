Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1D53F4834
	for <parisc-linux@lists.parisc-linux.org>; Wed, 23 Oct 2002 17:07:22 -0600 (MDT)
Received: from gfrw1044.bocc.de (pD9E01D57.dip.t-dialin.net [217.224.29.87])
	(authenticated)
	by mail.scram.de (8.11.6+3.4W/8.11.0) with ESMTP id g9NN7FU18817
	for <parisc-linux@lists.parisc-linux.org>; Thu, 24 Oct 2002 01:07:16 +0200 (CEST)
Date: Thu, 24 Oct 2002 01:01:42 +0200 (CEST)
From: Jochen Friedrich <jochen@scram.de>
To: HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] unreliable mmap
In-Reply-To: <Pine.LNX.4.44.0208152341001.18472-100000@gfrw1044.bocc.de>
Message-ID: <Pine.LNX.4.44.0210240048490.1407-100000@gfrw1044.bocc.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

> i recognized that mmap operations seem unreliable on HP720 platform. The
> following test program (taken from cyrus imap configure) demonstrates the
> problem:
> [...]
>
> This only seems to happen on 720 (i couldn't replicate the bug on a 715
> with the same kernel booted up).

While debugging cyrus21-imapd, i experienced pretty fishy behaviour
of the skiplist database backend. It turned out that the 715 is affected
by the mmap problem, as well.

Here is a new test program which performs random writes to a file and
verifies the mmapped memory afterwards which demonstrates the problem:

Cheers,
--jochen

-------------------------------------8<-------------------------------------
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <fcntl.h>

int main()
{
  char *base;
  int fd;
  char buf[2000];
  int i, j;
  char c;

  for (i=0; i<2000; i++)
    {
      c = (char) ((float) rand() / (float) (RAND_MAX) * 26) + 'a';
      buf[i] = c;
    }

  fd = open("mmap.test", O_CREAT|O_TRUNC|O_RDWR, 0664);
  write(fd, buf, 2000);

  base = (char *)mmap((caddr_t)0, 2000, PROT_READ, MAP_SHARED
#ifdef MAP_FILE
| MAP_FILE
#endif
#ifdef MAP_VARIABLE
| MAP_VARIABLE
#endif
  , fd, 0L);

  for (i=0; i<2000; i++)
    {
      j = (int) ((float) rand() / (float) (RAND_MAX) * 2000);
      c = (char) ((float) rand() / (float) (RAND_MAX) * 26) + 'a';
      lseek(fd, j, SEEK_SET);
      write(fd, &c, 1);
      if (*(base+j) != c)
        printf("Error: mmap inconsistent at %d\n", j);
    }
  close(fd);
}

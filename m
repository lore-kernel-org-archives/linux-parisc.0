Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7F17F4855
	for <parisc-linux@lists.parisc-linux.org>;
	Fri,  9 Jan 2004 07:04:52 -0700 (MST)
Received: from carlos by baldric with local (Exim 3.35 #1 (Debian))
	id 1Aex7k-0004YD-00 for <parisc-linux@lists.parisc-linux.org>;
	Fri, 09 Jan 2004 08:56:28 -0500
Date: Fri, 9 Jan 2004 08:56:27 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040109135627.GB17203@systemhalted>
References: <20040108054212.GC2347@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040108054212.GC2347@systemhalted>
Subject: [parisc-linux] [Kernel Hacker Challenge #1] loop.c source update.
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Thu, Jan 08, 2004 at 12:42:12AM -0500, Carlos O'Donell wrote:
> 
> pa,
> 

Mistake in the code, changed up thanks to Stan who noticed I missed
setting the "start" value for the second mmap call. I was also smoking
crack when I wrote PAGEMASK down, that's what I get for issuing
challenges in the early morning.

http://www.baldric.uwo.ca/~carlos/loop.c (For those with wget fetishes).

The *NO* in the syscall comment means that I did not include that
syscall in the loop. I deemed it not important. If you think otherwise
please test and return the results.

---
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>

#define BUFLEN 512
#define PAGESIZE 4096
/* 4096 - 1, usefull for ~PAGEMASK */
#define PAGEMASK 0x0fff

/*
 
 Sample trace of what glibc does...
   
    968 open("./tst-tlsmod13.so", O_RDONLY)     = 3
    969 read(3, "\177ELF\1\2\1\3\0\0\0\0\0\0\0\0\0\3\0\17\0\0\0\1\0\0\10"..., 512) = 512
    970 fstat64(3, {st_mode=0, st_size=4294967297000, ...}) = 0
*NO*971 getcwd("/home/carlos/src/glibc-work/tests/tst-tls13", 128) = 44
    972 mmap(NULL, 69232, PROT_READ|PROT_EXEC, MAP_PRIVATE, 3, 0) = 0x401b2000
    973 mprotect(0x401b3000, 65136, PROT_NONE)  = 0
    974 mmap(0x401c2000, 4096, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_FIXED, 3, 0) = 0x401c2000
    975 close(3)                                = 0
*NO*976 munmap(0x401a1000, 69352)               = 0
    977 munmap(0x401b2000, 69232)               = 0

Compile this code with:

	gcc -o loop loop.c

Create the test file with:

	dd if=/dev/zero of=./testdata bs=1024 count=70

*/

int
main (void)
{
  int i;
  char buffer[BUFLEN];
  void * start = NULL;
  int offset = 0;
  void * end = NULL;
  size_t length = 0;
  int filefd;
  void * filemap;
  void * filemap2;
  struct stat statbuf;
  
  for (i = 0; i < 1000;)
    {
      printf ("round %d\n",++i);

      /* File is 70 * 1024 bytes */
      filefd = open("./testdata", O_RDONLY);
      if (filefd == -1) { perror("open"); exit(1); }
      
      /* Read 512 bytes into a buffer... or less */
      length = read(filefd, buffer, BUFLEN);
      if (length == 0) { perror("read"); exit(1); }
       
      /* Find the real size */
      if (fstat(filefd, &statbuf) != 0) { perror("fstat"); exit(1); }
      length = statbuf.st_size;
      
      /* mmap without protection */
      filemap = mmap (start, length, PROT_READ|PROT_EXEC, MAP_PRIVATE, filefd, offset);
      if (filemap == MAP_FAILED) { perror("mmap"); exit (1); }
     
      /* Load in a page of zeros, starting at the next page */
      start = (void *)((unsigned int)(filemap + length + PAGESIZE) & ~PAGEMASK);
      filemap2 = mmap (start, PAGESIZE, PROT_READ|PROT_WRITE|PROT_EXEC, 
		      MAP_PRIVATE|MAP_FIXED, filefd, offset);
      if ( filemap2 == MAP_FAILED ) { perror("mmap2"); exit(1); }
      
      /* Protect everything but the first page */
      start = (void *)(((unsigned int)(filemap) & ~PAGEMASK) + PAGESIZE);
      length = (size_t)((filemap - ((unsigned int)filemap & ~PAGEMASK)) + length - PAGESIZE);
      if (mprotect(start, length, PROT_NONE) != 0) 
        { perror("mprotext"); exit(1); }

      /* Close the file descriptor */
      if (close(filefd) != 0) { perror("close"); exit(1); }

      /* munmap the areas */
      if (munmap(filemap, length) != 0 ) { perror("munmap"); exit(1); }
      if (munmap(filemap2, PAGESIZE) != 0 ) { perror("munmap2"); exit(1); }
      
    }

  return 0;
}
---

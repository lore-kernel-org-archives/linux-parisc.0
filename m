Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 283894868
	for <parisc-linux@lists.parisc-linux.org>;
	Wed,  7 Jan 2004 22:50:32 -0700 (MST)
Received: from carlos by baldric with local (Exim 3.35 #1 (Debian))
	id 1AeSvs-0000qI-00 for <parisc-linux@lists.parisc-linux.org>;
	Thu, 08 Jan 2004 00:42:12 -0500
Date: Thu, 8 Jan 2004 00:42:12 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040108054212.GC2347@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [Kernel Hacker Challenge #1] Make my loop.c run
	faster, fly higher, and win big!
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


pa,

============================================
UP PA8700 @650Mhz.
============================================

round 1
...
round 999
round 1000

real    0m1.559s
user    0m0.000s
sys     0m1.430s

Too slow joe! :)

============================================
UP PIII @450MHz
============================================

round 1
...
round 999
round 1000

real    0m0.303s
user    0m0.010s
sys     0m0.090s <- Look at that sys time!

*Fast*

============================================
Why is it so slow on hppa?
============================================

Profile reveals some hints:

   161 total                                      0.0001
    89 flush_user_dcache_range_asm                2.4722
    48 flush_user_icache_range_asm                1.3333
     8 pc_in_user_space                           0.0667
     2 zap_page_range                             0.0016
     2 __muldi3                                   0.0071
     1 syscall_restore                            0.0041
     1 rmqueue                                    0.0007
     1 normal_poll                                0.0020
     1 n_tty_receive_buf                          0.0003
     1 memset                                     0.0054
     1 kmalloc                                    0.0023
     1 get_unused_fd                              0.0021
     1 fget                                       0.0139
     1 fdsync                                     0.0500
     1 do_mmap_pgoff                              0.0006
     1 __down_read_trylock                        0.0208
     1 $lctu_loop                                 0.0833

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
#define PAGEMASK 0x1888

/*
 
 Sample trace of what glibc does during dlopen/dlclose pair ...
   
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

The reward goes to the person who make this run the fasteest, as judged
by me :)

c.

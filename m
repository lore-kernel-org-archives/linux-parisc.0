Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id CEF6D4829
	for <parisc-linux@lists.parisc-linux.org>; Sun,  8 Dec 2002 16:55:37 -0700 (MST)
Message-Id: <200212082355.gB8NtUAe010825@hiauly1.hia.nrc.ca>
To: randolph@tausq.org
Date: Sun, 8 Dec 2002 18:55:30 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20021208232601.GH21187@tausq.org> from "Randolph Chung" at Dec 8, 2002 03:26:01 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] Re: Trap handler
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

> > I just happened to notice that the system almost totally stalled running
> > the test.  The load average jumps from 1 to about 9.  You just have to
> > compile and run to see the effect.  Line 127 writes to unmapped memory
> > and causes multiple entries in /var/log/debug.
> 
> Dave, can you send the test program and details to the list? i didn't
> see the beginning of this thread and am not sure which program you are
> refering to.

Here it is.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

#include <sys/types.h>
#include <sys/mman.h>
#include <fcntl.h>
#include <signal.h>
#include <setjmp.h>
#include <stdio.h>

#if !defined (MAP_ANONYMOUS) && defined (MAP_ANON)
# define MAP_ANONYMOUS MAP_ANON
#endif

/* This mess was copied from the GNU getpagesize.h.  */
#ifndef HAVE_GETPAGESIZE
# ifdef HAVE_UNISTD_H
#  include <unistd.h>
# endif

/* Assume that all systems that can run configure have sys/param.h.  */
# ifndef HAVE_SYS_PARAM_H
#  define HAVE_SYS_PARAM_H 1
# endif

# ifdef _SC_PAGESIZE
#  define getpagesize() sysconf(_SC_PAGESIZE)
# else /* no _SC_PAGESIZE */
#  ifdef HAVE_SYS_PARAM_H
#   include <sys/param.h>
#   ifdef EXEC_PAGESIZE
#    define getpagesize() EXEC_PAGESIZE
#   else /* no EXEC_PAGESIZE */
#    ifdef NBPG
#     define getpagesize() NBPG * CLSIZE
#     ifndef CLSIZE
#      define CLSIZE 1
#     endif /* no CLSIZE */
#    else /* no NBPG */
#     ifdef NBPC
#      define getpagesize() NBPC
#     else /* no NBPC */
#      ifdef PAGESIZE
#       define getpagesize() PAGESIZE
#      endif /* PAGESIZE */
#     endif /* no NBPC */
#    endif /* no NBPG */
#   endif /* no EXEC_PAGESIZE */
#  else /* no HAVE_SYS_PARAM_H */
#   define getpagesize() 8192	/* punt totally */
#  endif /* no HAVE_SYS_PARAM_H */
# endif /* no _SC_PAGESIZE */

#endif /* no HAVE_GETPAGESIZE */

#ifndef MAP_FAILED
# define MAP_FAILED -1
#endif

#undef perror_exit
#define perror_exit(str, val) \
  do { perror(str); exit(val); } while (0)

/* Some versions of cygwin mmap require that munmap is called with the
   same parameters as mmap.  GCC expects that this is not the case.
   Test for various forms of this problem.  Warning - icky signal games.  */

static sigset_t unblock_sigsegv;
static jmp_buf r;
static size_t pg;
static int devzero;

static char *
anonmap (size)
     size_t size;
{
#ifdef USE_MAP_ANON
  return (char *) mmap (0, size, PROT_READ|PROT_WRITE,
			MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);
#else
  return (char *) mmap (0, size, PROT_READ|PROT_WRITE,
			MAP_PRIVATE, devzero, 0);
#endif
}

static void
sigsegv (unused)
     int unused;
{
  sigprocmask (SIG_UNBLOCK, &unblock_sigsegv, 0);
  longjmp (r, 1);
}

/* Basic functionality test.  */
void
test_0 ()
{
  char *x = anonmap (pg);
  if (x == (char *) MAP_FAILED)
    perror_exit("test 0 mmap", 2);

  *(int *)x += 1;

  if (munmap(x, pg) < 0)
    perror_exit("test 0 munmap", 3);
}

/* 1. If we map a 2-page region and unmap its second page, the first page
   must remain.  */
static void
test_1 ()
{
  char *x = anonmap (pg * 2);
  if (x == (char *)MAP_FAILED)
    perror_exit ("test 1 mmap", 4);

  signal (SIGSEGV, sigsegv);
  if (setjmp (r))
    perror_exit ("test 1 fault", 5);

  x[0] = 1;
  x[pg] = 1;

  if (munmap (x + pg, pg) < 0)
    perror_exit ("test 1 munmap 1", 6);
  x[0] = 2;

  if (setjmp (r) == 0)
    {
      x[pg] = 1;
      perror_exit ("test 1 no fault", 7);
    }
  if (munmap (x, pg) < 0)
    perror_exit ("test 1 munmap 2", 8);
}

/* 2. If we map a 2-page region and unmap its first page, the second
   page must remain.  */
static void
test_2 ()
{
  char *x = anonmap (pg * 2);
  if (x == (char *)MAP_FAILED)
    perror_exit ("test 2 mmap", 9);

  signal (SIGSEGV, sigsegv);
  if (setjmp (r))
    perror_exit ("test 2 fault", 10);

  x[0] = 1;
  x[pg] = 1;

  if (munmap (x, pg) < 0)
    perror_exit ("test 2 munmap 1", 11);

  x[pg] = 2;

  if (setjmp (r) == 0)
    {
      x[0] = 1;
      perror_exit ("test 2 no fault", 12);
    }

  if (munmap (x+pg, pg) < 0)
    perror_exit ("test 2 munmap 2", 13);
}

/* 3. If we map two adjacent 1-page regions and unmap them both with
   one munmap, both must go away.

   Getting two adjacent 1-page regions with two mmap calls is slightly
   tricky.  All OS's tested skip over already-allocated blocks; therefore
   we have been careful to unmap all allocated regions in previous tests.
   HP/UX allocates pages backward in memory.  No OS has yet been observed
   to be so perverse as to leave unmapped space between consecutive calls
   to mmap.  */

static void
test_3 ()
{
  char *x, *y, *z;

  x = anonmap (pg);
  if (x == (char *)MAP_FAILED)
    perror_exit ("test 3 mmap 1", 14);
  y = anonmap (pg);
  if (y == (char *)MAP_FAILED)
    perror_exit ("test 3 mmap 2", 15);

  if (y != x + pg)
    {
      if (y == x - pg)
	z = y, y = x, x = z;
      else
	{
	  fprintf (stderr, "test 3 nonconsecutive pages - %lx, %lx\n",
		   (unsigned long)x, (unsigned long)y);
	  exit (16);
	}
    }

  signal (SIGSEGV, sigsegv);
  if (setjmp (r))
    perror_exit ("test 3 fault", 17);

  x[0] = 1;
  y[0] = 1;

  if (munmap (x, pg*2) < 0)
    perror_exit ("test 3 munmap", 18);

  if (setjmp (r) == 0)
    {
      x[0] = 1;
      perror_exit ("test 3 no fault 1", 19);
    }
  
  signal (SIGSEGV, sigsegv);
  if (setjmp (r) == 0)
    {
      y[0] = 1;
      perror_exit ("test 3 no fault 2", 20);
    }
}

int
main ()
{
  sigemptyset (&unblock_sigsegv);
  sigaddset (&unblock_sigsegv, SIGSEGV);
  pg = getpagesize ();
#ifndef USE_MAP_ANON
  devzero = open ("/dev/zero", O_RDWR);
  if (devzero < 0)
    perror_exit ("open /dev/zero", 1);
#endif

  test_0();
  test_1();
  test_2();
  test_3();

  exit(0);
}

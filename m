Return-Path: <randolph@tausq.org>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 23D2F482C
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 28 Mar 2004 13:23:09 -0700 (MST)
Date: Sun, 28 Mar 2004 12:32:11 -0800
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040328203211.GK750@tausq.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="KFztAG8eRSV9hGtP"
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] spinlock align code triggering bug in gcc?
Reply-To: Randolph Chung <randolph@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


--KFztAG8eRSV9hGtP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I'm not yet 100% sure about this one, but it seems like with the new
self-aligning spinlock code in the kernel, if you build the kernel with
hppa64-linux-gcc 3.3.3, the kernel generates incorrectly aligned code
when you bulid with -O2. You see something like this...

legolas[11:47] linux-2.6% make drivers/block/loop.o
  CC      drivers/block/loop.o
{standard input}: Assembler messages:
{standard input}:3701: Error: Field not properly aligned [8] (-183).
{standard input}:3701: Error: Invalid operands
make[1]: *** [drivers/block/loop.o] Error 1
make: *** [drivers/block/loop.o] Error 2

this does not happen with the 32-bit gcc-3.3.3. also with -O1 it is ok.
It looks like while gcc tries to inline all the spinlock stuff it gets
confused about the offsets? The attached test case illustrates the
problem. If you build with:

hppa64-linux-gcc -O2 -c foo.c, you'll get the same kind of error.

can someone check this against other versions of gcc? i cannot reach
gcc-bugzilla right now...

thanks
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

--KFztAG8eRSV9hGtP
Content-Type: text/x-csrc; charset=us-ascii
Content-Disposition: attachment; filename="foo.c"

#define __PA_LDCW_ALIGNMENT 16
#define __ldcw_align(a) ({ \
  unsigned long __ret = (unsigned long) a;                              \
  __ret = (__ret + __PA_LDCW_ALIGNMENT - 1) & ~(__PA_LDCW_ALIGNMENT - 1); \
  (volatile unsigned int *) __ret;                                      \
})

#define __ldcw(a) ({ \
        unsigned __ret; \
        __asm__ __volatile__("ldcw 0(%1),%0" : "=r" (__ret) : "r" (a)); \
        __ret; \
})

typedef struct {
  volatile unsigned int lock[4];
} spinlock_t;

struct semaphore
{
  spinlock_t sentry;
  int count;
};

struct loop_device
{
  struct loop_func_table *lo_encryption;
  struct semaphore lo_ctl_mutex;
};

static int max_loop = 8;
static struct loop_device *loop_dev;

void __down (struct semaphore *sem);
void __up (struct semaphore *sem);

static inline void _raw_spin_lock (spinlock_t * x)
{
  volatile unsigned int *a = __ldcw_align(x);

  while (__ldcw(a) == 0)
    while (*a == 0);
}

static inline void _raw_spin_unlock (spinlock_t * x)
{
  volatile unsigned int *a = __ldcw_align(x);
  *a = 1;
}

inline void down (struct semaphore *sem)
{
  _raw_spin_lock (&sem->sentry);
  if (sem->count > 0) { sem->count--; }
  else { __down (sem); }
  _raw_spin_unlock (&sem->sentry);
}

inline void up (struct semaphore *sem)
{
  _raw_spin_lock (&sem->sentry);
  if (sem->count < 0) { __up (sem); }
  else { sem->count++; }
  _raw_spin_unlock (&sem->sentry);
}

int
loop_unregister_transfer (int number)
{
  struct loop_device *lo = &loop_dev[0];

  for (lo = &loop_dev[0]; lo < &loop_dev[max_loop]; lo++)
    {
      down (&lo->lo_ctl_mutex);

      if (lo->lo_encryption == 0)
	loop_release_xfer (lo);

      up (&lo->lo_ctl_mutex);
    }

  return 0;
}

--KFztAG8eRSV9hGtP--

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 95C554A19
	for <parisc-linux@lists.parisc-linux.org>; Wed,  7 Mar 2001 10:39:38 -0700 (MST)
To: Richard Hirst <rhirst@linuxcare.com>
Cc: Alan Modra <alan@linuxcare.com.au>,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: Your message of "Mon, 26 Feb 2001 17:57:01 GMT."
             <20010226175701.U4660@linuxcare.com>
References: <20010223113052.G4660@linuxcare.com> <Pine.LNX.4.21.0102232231470.9345-100000@front.linuxcare.com.au> <20010223212325.K4660@linuxcare.com>  <20010226175701.U4660@linuxcare.com> 
Date: Wed, 07 Mar 2001 10:39:35 -0700
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E14ahuS-0001t2-00@noam.fc.hp.com>
Subject: [parisc-linux] INLINE_SYSCALL/gcc-bug? (Was Re: pipes)
List-ID: <linux-parisc.vger.kernel.org>

Help!  Probable gcc bug!

= This is looking like a glibc/kernel issue regardling the width
= of the type returned by lseek():

To reproduce the bogus return value, compile x.c:

    #include <stdio.h>
    #define __USE_FILE_OFFSET64
    #include <unistd.h>
    #include <errno.h>

    int main(int argc, char *argv[])
    {
	long lwhere = lseek(0, 0L, SEEK_CUR);

	printf("lwhere %lx errno %d (%s)\n", lwhere, errno, sys_errlist[errno]);

	return 0;
    }

then run 'ls | x' which should show 'lwhere' as either 0 or -1, but instead
it's 0xffffffec or something like that (-ESPIPE, as Richard found earlier).

After much head scratching, the bug seems to be occurring in glibc's
INLINE_SYSCALL macro (glibc/sysdeps/unix/sysv/linux/hppa/sysdep.h) as
a result of a compiler bug.  Since INLINE_SYSCALL is used to implement
quite a number of syscalls, this could be a nice thing to fix!  Here's
the "proof".  Consider the ustat() syscall [only because the generated
code is simple, not because it's known to have problems]
glibc/sysdeps/unix/sysv/linux/ustat.c:
    int
    ustat (dev_t dev, struct ustat *ubuf)
    {
      unsigned short int k_dev;

      /* We must convert the value to dev_t type used by the kernel.  */
      k_dev = ((major (dev) & 0xff) << 8) | (minor (dev) & 0xff);

      return INLINE_SYSCALL (ustat, 2, k_dev, CHECK_1 (ubuf));
    }
The way things are supposed to work, INLINE_SYSCALL() tests the value
returned from the kernel syscall, which is either in the range of
-4096..-1, in which case it's an error indicator so errno is set
and INLINE_SYSCALL returns -1 which ustat() then returns (-1 is
the standard syscall error return).  Or if outside this range,
the syscall return value is generally passed back unchanged.  This
logic is apparent from INLINE_SYSCALL:

    #define INLINE_SYSCALL(name, nr, args...)       ({              \
	    unsigned long __sys_res;                                \
	    {                                                       \
		    register unsigned long __res asm("r28");        \
		    LOAD_ARGS_##nr(args)                            \
		    asm volatile(                                   \
			    "ble  0x100(%%sr2, %%r0)\n\t"   \
			    " ldi %1, %%r20"                        \
			    : "=r" (__res)                          \
			    : "i" (SYS_ify(name)) ASM_ARGS_##nr     \
			     );                                     \
		    __sys_res = __res;                              \
	    }                                                       \
	    if (__sys_res >= (unsigned long)-4095) {                \
		    __set_errno(-__sys_res);                        \
		    __sys_res == (unsigned long)-1;                 \
	    }                                                       \
	    __sys_res;                                              \
    })

The symptom is that the return value from INLINE_SYSCALL is never -1
even when the if() condition is true.  It's not even -1 when printf-ed
right after being set to -1.  Here's the generated code for
ustat() plus some comments [xc-latest, latest glibc CVS bits]:

    00000000 <ustat>:
       0:   6b c2 3f d9     stw rp,-14(sr0,sp)
       4:   6f c3 00 80     stw,ma r3,40(sr0,sp)
       8:   08 19 02 56     copy r25,r22
       c:   08 1a 02 57     copy r26,r23
      10:   d2 f6 0a f5     shrpw r22,r23,8,r21
      14:   d6 75 09 18     depw,z r21,23,8,r19
      18:   d2 fa 1b f8     extrw,u r23,31,8,r26
      1c:   08 18 02 59     copy r24,r25
      20:   0b 53 02 5a     or r19,r26,r26
      24:   e4 00 82 00     be,l 100(sr2,r0),%sr0,%r31	# make the syscall
      28:   34 14 00 7c     ldi 3e,r20
      2c:   08 1c 02 43     copy ret0,r3		# save return value
# if (__sys_res >= (unsigned long)-4095)
      30:   34 13 20 01     ldi -1000,r19
      34:   88 73 80 28     cmpb,>>= r19,r3,50 <ustat+0x50>
# {
      38:   08 03 02 5c     copy r3,ret0
      3c:   e8 40 00 00     b,l 44 <ustat+0x44>,rp
			    3c: R_PARISC_PCREL17F   __errno_location
      40:   08 00 02 40     nop
      44:   08 60 04 13     sub r0,r3,r19	 # r19 = -__sys_res
      48:   0f 93 12 80     stw  r19,0(sr0,ret0) # __set_errno(r19)
      4c:   08 03 02 5c     copy r3,ret0	 # restore syscall ret value
# }
      50:   4b c2 3f 59     ldw -54(sr0,sp),rp
      54:   e8 40 c0 00     bv r0(rp)
      58:   4f c3 3f 81     ldw,mb -40(sr0,sp),r3

There appears to be no code generated for setting __sys_res to -1 so
I think this is probably a gcc bug.  I think I confirmed that the bug
exists with no optimization too.

Unfortunately we seem to be working around this bug in
in some of the hppa-specific syscalls, for example hppa/mmap.c
[which is using a poorer algorithm than the one in INLINE_SYSCALL()!]

INLINE_SYSCALL() also has a sign/unsigned problem as willy pointed out.

Attached is a list of glibc source files which contain INLINE_SYSCALL()
so if these syscalls seem broken to you, it could be due to this defect.

./aio_sigqueue.c
./execve.c
./ftruncate64.c
./fxstat.c
./fxstat64.c
./getcwd.c
./getdents.c
./getpriority.c
./llseek.c
./lxstat.c
./lxstat64.c
./msgctl.c
./msgget.c
./msgrcv.c
./msgsnd.c
./poll.c
./pread.c
./pread64.c
./ptrace.c
./pwrite.c
./pwrite64.c
./readv.c
./reboot.c
./semctl.c
./semget.c
./semop.c
./shmat.c
./shmctl.c
./shmdt.c
./shmget.c
./sigaction.c
./sigpending.c
./sigprocmask.c
./sigqueue.c
./sigsuspend.c
./sigtimedwait.c
./sigwaitinfo.c
./sysctl.c
./truncate64.c
./ustat.c
./writev.c
./xmknod.c
./xstat.c
./xstat64.c
./hppa/brk.c
./hppa/mmap.c
./hppa/sysdep.h

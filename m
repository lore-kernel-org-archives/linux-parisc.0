From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Question about execve.
Date: Sun, 28 Mar 2010 13:32:51 -0400 (EDT)
Message-ID: <20100328173251.B46255145@hiauly1.hia.nrc.ca>
References: <20100328154241.GA2782@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: carlos@systemhalted.org, deller@gmx.de, kyle@mcmartin.ca,
	linux-parisc@vger.kernel.org
To: dave.anglin@nrc-cnrc.gc.ca
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100328154241.GA2782@hiauly1.hia.nrc.ca> from "John David Anglin" at Mar 28, 2010 11:42:42 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> I tried the vfork.c test case on my c3750 with 32-bit kernel.  It
> didn't segv in a limited number of runs.  However, I did notice that
> getpid() is broken after vfork().

The vfork (clone) syscall corrupts (i.e., inserts wrong value)
the parent tid.  In the following, I disabled the printf's and
execve call in Carlos's testcase.  The child just does _exit().

The fast path through getpid is:

Dump of assembler code for function getpid:
0x0001ad2c <getpid+0>:	stw rp,-14(sp)
0x0001ad30 <getpid+4>:	mfctl tr3,r20
0x0001ad34 <getpid+8>:	ldw -414(r20),r19
0x0001ad38 <getpid+12>:	cmpib,>= 0,r19,0x1ad48 <getpid+28>
0x0001ad3c <getpid+16>:	copy r19,ret0
0x0001ad40 <getpid+20>:	ldw -14(sp),rp
0x0001ad44 <getpid+24>:	bv,n r0(rp)

Breakpoint 3, 0x0001ad34 in getpid ()
(gdb) del 2
(gdb) p/x $r20
$6 = 0x9a480

Breakpoint 4, main () at vfork.c:17
17	  child = vfork();
(gdb) x/x 0x9a480 - 0x414
0x9a06c:	0x00000000
(gdb) c
Continuing.

Breakpoint 3, 0x0001ad34 in getpid ()
(gdb) x/x 0x9a480 - 0x414
0x9a06c:	0x10101364

Breakpoint 4, main () at vfork.c:17
17	  child = vfork();
(gdb) x/64x 0x9a040
0x9a040:	0x00000000	0x00000000	0x00000000	0x00000000
0x9a050:	0x00000000	0x00000000	0x00000000	0x00000000
0x9a060:	0x00000000	0x00000000	0x00000000	0x00000000
0x9a070:	0x00000000	0x00000000	0x00000000	0x00000000
0x9a080:	0xc0521150	0x00000000	0x00000000	0x00000000

Breakpoint 3, 0x0001ad34 in getpid ()
(gdb) x/64x 0x9a040
0x9a040:	0x00000000	0x00000000	0x00000000	0x00000000
0x9a050:	0x00000000	0x00000000	0x00000000	0x00000000
0x9a060:	0x00000000	0x00000000	0x00000000	0x10101364
0x9a070:	0x00000000	0x00000000	0x00000000	0x00000000
0x9a080:	0xc03ae150	0x00000000	0x00000000	0x00000000

So, the only location changed by vfork is the parent tid.

dave@hiauly6:~$ strace ./vfork
execve("./vfork", ["./vfork"], [/* 16 vars */]) = 0
newuname({sys="Linux", node="hiauly6", ...}) = 0
brk(0)                                  = 0x9a000
brk(0x9acb4)                            = 0x9acb4
brk(0xbbcb4)                            = 0xbbcb4
brk(0xbc000)                            = 0xbc000
clone(child_stack=0, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0x9a068) = 6212
fstat64(0x1, 0xc0258a08)                = 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40000000
write(1, "parent is 269488996\n", 20parent is 269488996
)   = 20
exit_group(0)                           = ?

(gdb) p/x 269488996
$1 = 0x10101364

I believe this is the "getpid" implementation:

static inline __attribute__((always_inline)) pid_t
really_getpid (pid_t oldval)
{
  if (__builtin_expect (oldval == 0, 1))
    {
      pid_t selftid = THREAD_GETMEM (THREAD_SELF, tid);
      if (__builtin_expect (selftid != 0, 1))
	return selftid;
     }

  INTERNAL_SYSCALL_DECL (err);
  pid_t result = INTERNAL_SYSCALL (getpid, err, 0);

  /* We do not set the PID field in the TID here since we might be
     called from a signal handler while the thread executes fork.  */
  if (oldval == 0)
    THREAD_SETMEM (THREAD_SELF, tid, result);
  return result;
}

As a side issue, gdb can't single step over mfctl instruction ;(

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

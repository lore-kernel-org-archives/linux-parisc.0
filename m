From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Question about execve.
Date: Sun, 28 Mar 2010 14:20:25 -0400
Message-ID: <119aab441003281120y5de6174ey97a1a91b2eb0141a@mail.gmail.com>
References: <20100328154241.GA2782@hiauly1.hia.nrc.ca>
	 <20100328173251.B46255145@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	Helge Deller <deller@gmx.de>, Kyle McMartin <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100328173251.B46255145@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Mar 28, 2010 at 1:32 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>> I tried the vfork.c test case on my c3750 with 32-bit kernel. =A0It
>> didn't segv in a limited number of runs. =A0However, I did notice th=
at
>> getpid() is broken after vfork().
>
> The vfork (clone) syscall corrupts (i.e., inserts wrong value)
> the parent tid. =A0In the following, I disabled the printf's and
> execve call in Carlos's testcase. =A0The child just does _exit().

The vfork syscall goes through process.c (sys_vfork) which doesn't
tell the kernel about the parent_tidptr, or child_tidptr (passes NULL
for both).

The kernel shouldn't be touching the parent tid pointer at all.

The vfork wrapper in glibc *does* negate the cached PID value, such
that the child doesn't see a valid PID value until after execve
completes.

> The fast path through getpid is:
>
> Dump of assembler code for function getpid:
> 0x0001ad2c <getpid+0>: =A0stw rp,-14(sp)
> 0x0001ad30 <getpid+4>: =A0mfctl tr3,r20
> 0x0001ad34 <getpid+8>: =A0ldw -414(r20),r19
> 0x0001ad38 <getpid+12>: cmpib,>=3D 0,r19,0x1ad48 <getpid+28>
> 0x0001ad3c <getpid+16>: copy r19,ret0
> 0x0001ad40 <getpid+20>: ldw -14(sp),rp
> 0x0001ad44 <getpid+24>: bv,n r0(rp)
>
> Breakpoint 3, 0x0001ad34 in getpid ()
> (gdb) del 2
> (gdb) p/x $r20
> $6 =3D 0x9a480
>
> Breakpoint 4, main () at vfork.c:17
> 17 =A0 =A0 =A0 =A0child =3D vfork();
> (gdb) x/x 0x9a480 - 0x414
> 0x9a06c: =A0 =A0 =A0 =A00x00000000
> (gdb) c
> Continuing.

This is the PID of the parent, not the TID. They are actually two
different fields.

nptl/descr.h
~~~
  /* Thread ID - which is also a 'is this thread descriptor (and
     therefore stack) used' flag.  */
  pid_t tid;

  /* Process ID - thread group ID in kernel speak.  */
  pid_t pid;
~~~

The PID of all the threads in a process group is the same.

Each thread has a unique TID, which is

During the vfork the parent does this:
~~~
 /* Load thread register. */
 mfctl %cr27, %r26 !
 /* Load cached parent PID. */
 ldw -1044(%r26),%r1 !
 /* Negate it, such that the child runs with
    a negative PID and no functions work until
    the execve. */
 sub %r0,%r1,%r1 !
 /* Store it back. */
 stw %r1,-1044(%r26) !
~~~

> Breakpoint 3, 0x0001ad34 in getpid ()
> (gdb) x/x 0x9a480 - 0x414
> 0x9a06c: =A0 =A0 =A0 =A00x10101364

I don't see how this is the negative of 0x0, it should just be 0x0. I
wonder what changed it.

> Breakpoint 4, main () at vfork.c:17
> 17 =A0 =A0 =A0 =A0child =3D vfork();
> (gdb) x/64x 0x9a040
> 0x9a040: =A0 =A0 =A0 =A00x00000000 =A0 =A0 =A00x00000000 =A0 =A0 =A00=
x00000000 =A0 =A0 =A00x00000000
> 0x9a050: =A0 =A0 =A0 =A00x00000000 =A0 =A0 =A00x00000000 =A0 =A0 =A00=
x00000000 =A0 =A0 =A00x00000000
> 0x9a060: =A0 =A0 =A0 =A00x00000000 =A0 =A0 =A00x00000000 =A0 =A0 =A00=
x00000000 =A0 =A0 =A00x00000000
> 0x9a070: =A0 =A0 =A0 =A00x00000000 =A0 =A0 =A00x00000000 =A0 =A0 =A00=
x00000000 =A0 =A0 =A00x00000000
> 0x9a080: =A0 =A0 =A0 =A00xc0521150 =A0 =A0 =A00x00000000 =A0 =A0 =A00=
x00000000 =A0 =A0 =A00x00000000
>
> Breakpoint 3, 0x0001ad34 in getpid ()
> (gdb) x/64x 0x9a040
> 0x9a040: =A0 =A0 =A0 =A00x00000000 =A0 =A0 =A00x00000000 =A0 =A0 =A00=
x00000000 =A0 =A0 =A00x00000000
> 0x9a050: =A0 =A0 =A0 =A00x00000000 =A0 =A0 =A00x00000000 =A0 =A0 =A00=
x00000000 =A0 =A0 =A00x00000000
> 0x9a060: =A0 =A0 =A0 =A00x00000000 =A0 =A0 =A00x00000000 =A0 =A0 =A00=
x00000000 =A0 =A0 =A00x10101364
> 0x9a070: =A0 =A0 =A0 =A00x00000000 =A0 =A0 =A00x00000000 =A0 =A0 =A00=
x00000000 =A0 =A0 =A00x00000000
> 0x9a080: =A0 =A0 =A0 =A00xc03ae150 =A0 =A0 =A00x00000000 =A0 =A0 =A00=
x00000000 =A0 =A0 =A00x00000000
>
> So, the only location changed by vfork is the parent tid.

s/tid/pid/g.

> dave@hiauly6:~$ strace ./vfork
> execve("./vfork", ["./vfork"], [/* 16 vars */]) =3D 0
> newuname({sys=3D"Linux", node=3D"hiauly6", ...}) =3D 0
> brk(0) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0=3D 0x9a000
> brk(0x9acb4) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D=
 0x9acb4
> brk(0xbbcb4) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D=
 0xbbcb4
> brk(0xbc000) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D=
 0xbc000
> clone(child_stack=3D0, flags=3DCLONE_CHILD_CLEARTID|CLONE_CHILD_SETTI=
D|SIGCHLD, child_tidptr=3D0x9a068) =3D 6212
> fstat64(0x1, 0xc0258a08) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D 0
> mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,=
 0) =3D 0x40000000
> write(1, "parent is 269488996\n", 20parent is 269488996
> ) =A0 =3D 20
> exit_group(0) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D=
 ?
>
> (gdb) p/x 269488996
> $1 =3D 0x10101364
>
> I believe this is the "getpid" implementation:
>
> static inline __attribute__((always_inline)) pid_t
> really_getpid (pid_t oldval)
> {
> =A0if (__builtin_expect (oldval =3D=3D 0, 1))
> =A0 =A0{
> =A0 =A0 =A0pid_t selftid =3D THREAD_GETMEM (THREAD_SELF, tid);
> =A0 =A0 =A0if (__builtin_expect (selftid !=3D 0, 1))
> =A0 =A0 =A0 =A0return selftid;
> =A0 =A0 }
>
> =A0INTERNAL_SYSCALL_DECL (err);
> =A0pid_t result =3D INTERNAL_SYSCALL (getpid, err, 0);
>
> =A0/* We do not set the PID field in the TID here since we might be
> =A0 =A0 called from a signal handler while the thread executes fork. =
=A0*/
> =A0if (oldval =3D=3D 0)
> =A0 =A0THREAD_SETMEM (THREAD_SELF, tid, result);
> =A0return result;
> }
>
> As a side issue, gdb can't single step over mfctl instruction ;(

We'll fix gdb next :-)

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

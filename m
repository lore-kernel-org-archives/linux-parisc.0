From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: [parisc-linux] New libc6 2.3.5-6: poll timeouts
Date: Sun, 11 Sep 2005 12:06:33 -0400 (EDT)
Message-ID: <200509111606.j8BG6X7U025669@hiauly1.hia.nrc.ca>
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

I updated my c3k yesterday afternoon.  This upgrade included libc6
version 2.3.5-6.  I now find that many commands run as slow as molasses.
For example,

dave@hiauly6:~$ time ls -ltr
total 3300
...
real    0m20.024s
user    0m0.006s
sys     0m0.015s

There aren't that many files in this directory!

Looking at the command under gdb, I find that poll seems to be
timing out:

Dump of assembler code for function poll:
0x408543d4 <*__GI___poll+0>:    stw rp,-14(,sp)
0x408543d8 <*__GI___poll+4>:    addil 1000,r19,%r1
0x408543dc <*__GI___poll+8>:    ldw 484(,r1),ret0
0x408543e0 <*__GI___poll+12>:   stw,ma r7,80(,sp)
0x408543e4 <*__GI___poll+16>:   stw r6,-7c(,sp)
0x408543e8 <*__GI___poll+20>:   copy r26,r6
0x408543ec <*__GI___poll+24>:   stw r5,-78(,sp)
0x408543f0 <*__GI___poll+28>:   copy r25,r5
0x408543f4 <*__GI___poll+32>:   stw r3,-70(,sp)
0x408543f8 <*__GI___poll+36>:   stw r4,-74(,sp)
0x408543fc <*__GI___poll+40>:   stw r19,-20(,sp)
0x40854400 <*__GI___poll+44>:   ldw 0(,ret0),r20
0x40854404 <*__GI___poll+48>:   cmpib,<> 0,r20,0x40854464 <*__GI___poll+144>
0x40854408 <*__GI___poll+52>:   copy r24,r3
0x4085440c <*__GI___poll+56>:   copy r19,r4
0x40854410 <*__GI___poll+60>:   be,l 100(sr2,r0),%sr0,%r31
0x40854414 <*__GI___poll+64>:   ldi a8,r20
0x40854418 <*__GI___poll+68>:   copy r4,r19

Starting program: /bin/ls -ltr
Breakpoint 1 at 0x40854418
Breakpoint 1 at 0x40854418: file ../sysdeps/unix/sysv/linux/poll.c, line 82.
[Thread debugging using libthread_db enabled]
[New Thread 16384 (LWP 3198)]
total 3300
[Switching to Thread 16384 (LWP 3198)]

Breakpoint 1, 0x40854418 in *__GI___poll (fds=0xc03feec8, nfds=1, timeout=5000)     at ../sysdeps/unix/sysv/linux/poll.c:82
82      ../sysdeps/unix/sysv/linux/poll.c: No such file or directory.
    in ../sysdeps/unix/sysv/linux/poll.c
(gdb) p $ret0
$6 = 1
(gdb) c
Continuing.

Breakpoint 1, 0x40854418 in *__GI___poll (fds=0xc03fecc8, nfds=1, timeout=5000)
    at ../sysdeps/unix/sysv/linux/poll.c:82
82      in ../sysdeps/unix/sysv/linux/poll.c
(gdb) p $ret0
$7 = 0
(gdb) bt
#0  0x40854418 in *__GI___poll (fds=0xc03fecc8, nfds=1, timeout=5000)
    at ../sysdeps/unix/sysv/linux/poll.c:82
#1  0x407ecb08 in _IO_new_fclose (fp=0x1388) at iofclose.c:88
#2  0x40896708 in get_mapping (type=Variable "type" is not available.
) at nscd_helper.c:195
#3  0x407f96a4 in _IO_new_file_write (f=0x7363642f, data=0x736f636b,
    n=1970155374) at fileops.c:1260
#4  0x00008800 in ?? ()
Cannot find bounds of current function (@0x0), unwinding will fail.

Any thoughts on what's wrong?  The gdb backtrace is messed up because
the callinfo data isn't right for the syscall.  The call to __GI___poll
is actually from get_mapping at nscd_helper.c:195.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

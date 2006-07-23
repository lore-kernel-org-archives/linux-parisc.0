From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: Re: [parisc-linux] The problem on the PA8800 is all in the data-cache.
Date: Sat, 22 Jul 2006 21:01:03 -0400
Message-ID: <7d01f9f00607221801v256dd541l152a85d7624a8d5b@mail.gmail.com>
References: <119aab440607221050w3b6a949j49862c2766d5c7ef@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: James Bottomley <James.Bottomley@steeleye.com>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440607221050w3b6a949j49862c2766d5c7ef@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Carlos,

I'm observing something totally crazy right now. On the very same
machine we hacked yesterday, exact same setup (same kernel, same
binary, same everything):

i /can't/ start our static sshd anymore. It dies right after a sysctl (!):

898   mmap(NULL, 4096, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x4000b000
898   getpid()                          = 898
898   rt_sigaction(SIGRTMIN, {0x40c51eba, [], 0}, NULL, 8) = 0
898   rt_sigaction(SIGRT_1, {0x40c51ec2, [TRAP], 0}, NULL, 8) = 0
898   rt_sigaction(SIGRT_2, {0x40c51ea2, [], 0}, NULL, 8) = 0
898   rt_sigprocmask(SIG_BLOCK, [RTMIN], NULL, 8) = 0
898   rt_sigprocmask(SIG_UNBLOCK, [RT_1], NULL, 8) = 0
898   _sysctl({{CTL_KERN, KERN_VERSION}, 2, 0xc00e67d4, 36, (nil), 0}) = 0
898   --- SIGSEGV (Segmentation fault) @ 0 (0) ---
898   +++ killed by SIGSEGV +++

as you can see at that point it hasn't even yet spawned any child. gdb
isn't of much help, as the backtrace is pretty clueless:

(gdb) symbol-file /home/varenet/openssh-4.3p2/sshd
Reading symbols from /home/varenet/openssh-4.3p2/sshd...done.
(gdb) set follow-fork-mode child
(gdb) set args -D -p 2222
(gdb) run
Starting program: /usr/local/test/sbin/sshd -D -p 2222

Program received signal SIGSEGV, Segmentation fault.
0x00000000 in ?? ()
(gdb) bt
#0  0x00000000 in ?? ()
#1  0x40c3a9a0 in ?? ()
Previous frame identical to this frame (corrupt stack?)

finally dmesg shows:

do_page_fault() pid=898 command='sshd' type=6 address=0x00000003

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001101111111100001011 Not tainted
r00-03  0000000000000000 0000000040c5233c 0000000040c3a9a3 00000000c00e67d4
r04-07  0000000040c5233c 0000000040c51a80 000000004069e830 0000000000000200
r08-11  0000000040c513d4 00000000000000e1 0000000080000001 0000000090000000
r12-15  00000000d0000000 000000000021fd70 00000000001a5800 00000000001a5800
r16-19  000000000004c8c0 00000000c00de698 000000000004c8c0 0000000040c5233c
r20-23  0000000000000000 0000000000000053 0000000000000000 00000000c00e66c8
r24-27  00000000c00e67d4 0000000040c401b2 00000000c00e67d7 00000000001db060
r28-31  0000000040c51a80 0000000000000213 00000000c00e6a40 0000000040c3a9a3
sr0-3   00000000001fa800 0000000000000000 0000000000000000 00000000001fa800
sr4-7   00000000001fa800 00000000001fa800 00000000001fa800 00000000001fa800

The cool thing is that i can /consistently/ reproduce this.

I'm leaving the box powered up, not touching anything until we get a
chance to investigate this a bit more.

Aside that, I /really/ believe that the fact that we can trigger the
bug that easily with some network applications isn't a coincidence.
Grant's hint of a dma think problem shouldn't be overlooked. The
"make" failures could also be I/O related...

HTH

T-Bone

PS: i tried "ssh localhost" with the 'normal' sshd (/usr/sbin/sshd) as
I told you earlier today, it dies as expected with pretty much the
same tombstones that those we've seen yesterday.

Haven't investigated that much more at that point.

Note: you and James can access that machine (provided you remember
your password) and that your ssh key on mkhppa02.esiee.fr is valid. If
there's a problem with any of these, it's easy to fix. If jda wants an
account, it's also easy

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

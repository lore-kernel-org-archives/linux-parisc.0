From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] [BUG] 2.6.9-rc2-pa5 panic in poll_freewait+0x58
Date: Sun, 19 Sep 2004 00:14:08 -0600
Message-ID: <20040919061408.GE12274@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
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

I was running dselect "update" operation when it panic'd.

Since this is a graphical console. Here are some of the data by hand.

Code 15 (addr=6f000004)

PSW: BC QPDI (bits set in PSW)

r00-03  00000000 103e3aac 1017adb8 4c4dafec
r04-07  4c4db008 6f000004 00000009 00000104
...
r20-23  10dadb78 103e3c20 0000000f 0000000f
r24-27  00000314 00000000 10dadb60 103c2010
r28-31  00000104 98a50c80 4d974280 1017b224
sr0-3   00000000 00000f13 00000000 00000efe
sr4-7   all zero

IASQ: zero
IOAQ: 1017adbc 1017ad84
IIR:  0ca81083
CR30 4d974000 CR31 10490000
IOAQ[0]: poll_freewait+0x58/0x70
IOAQ[1]: poll_freewait+0x20/0x70
RP(r2): poll_freewait+0x54/0x70


My guess is it panic'd on the delay slot of a branch insn.


I'm also wondering now how I built this kernel.
Kind of odd to file a "fails to build" (64-bit) and
a "BUG/panic" against the same revision.

But the login message (via ssh) was:
grundler@ob500:~$ ssh 192.168.3.3
Enter passphrase for key '/home/grundler/.ssh/id_rsa': 
Linux gggc3k 2.6.9-rc2-pa5 #9 Sat Sep 18 21:10:49 PDT 2004 parisc GNU/Linux
No mail.
...


hth,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

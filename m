From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] [RFC] Revamp exception handling in the kernel
Date: Tue, 14 Sep 2004 18:52:45 +0000
Message-ID: <41473DFD.7070302@tiscali.be>
References: <20040911165325.GO28659@tausq.org>	<20040913233742.GW28659@tausq.org>
	<20040914023706.GX28659@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040914023706.GX28659@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Randolph Chung wrote:
> Version 2a of the patch. Changes from the previous version:
> 
> - Fixed the comment in uaccess.h, added some more comments to fixup.S
> - Added missing r1 clobbers
> - addil/ldd should be relative to r27, not r1
> 
> i found out this is a somewhat effective way of testing this patch:
> 
> - run "make vmlinux" (or make -j4 vmlinux) in one window
> - run "while true; do ./wtest; sleep 30; done" in another window
> 
> wtest is compiled from:
> -------------------8< cut here 8<--------------------
> #include <stdio.h>
> #include <unistd.h>
> #include <errno.h>
> 
> int main(int argc, char **argv)
> {
>         char *buf = (char *)1;
>         int ret;
> 
>         ret = write(fileno(stdout), buf, 10);
>         printf("write returned ret = %d, errno = %d\n", ret, errno);
> 
>         return 0;
> }
> 
> -------------------8< cut here 8<--------------------
> 
[...]
mmm, just running wtest and:
applying fixup for 0x10100350, fixup at 0x1038e1d8
Backtrace:
  [<1024fee0>] opost_block+0x58/0x1f8
  [<10252d84>] write_chan+0x204/0x2a8
  [<1024c02c>] tty_write+0x260/0x32c
  [<1017d6b0>] vfs_write+0x100/0x148
  [<1017d7fc>] sys_write+0x5c/0xa8
  [<10110178>] syscall_exit+0x0/0x14


Kernel Fault: Code=26 regs=2a9fc3c0 (Addr=00000001)

      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001101111111100001111 Not tainted
r00-03  00000000 00000aa0 1024fee0 0000000a
r04-07  2cb89000 00000001 2cb89000 2cc95320
r08-11  00000000 00000001 00000000 2cb89948
r12-15  00000001 00000000 000aa000 000eae68
r16-19  000eaf08 000eab48 00000000 00000000
r20-23  30000001 00000fff 00000001 00000000
r24-27  0000000a 00000001 2a9fc312 103ef010
r28-31  00000fff 00000000 2a9fc3c0 102540d8
sr0-3   00000000 00000aa0 00000000 00000aa0
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 10100320 10100324
  IIR: 0f221021    ISR: 00000000  IOR: 00000001
  CPU:        0   CR30: 2a9fc000 CR31: 10454000
  ORIG_R28: 00000000
  IAOQ[0]: $lctu_loop+0x0/0xc
  IAOQ[1]: $lctu_loop+0x4/0xc
  RP(r2): opost_block+0x58/0x1f8
Kernel panic - not syncing: Kernel Fault

Is panic awaited?

TIA,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

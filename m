From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] Unaligned handler broken (kernel BUG at
	mm/mmap.c:1991!)
Date: Mon, 18 Jun 2007 21:31:06 +0200
Message-ID: <200706182131.06930.deller__6566.24798798493$1416624398$gmane$org@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
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

The following small test case - which is itself wrong - crashes 2.6.22-rc5 (32bit kernel) badly:

#include <stdio.h>
int main()
{
        int *ptr = (int *) 0xffffffff;
        printf("ptr=%x, val=%d\n", ptr, *ptr);
}

dmesg reports:
--------------------
a.out(1750): unaligned access to 0xffffffff at ip=0x000104e3
Unaligned handler failed, ret = -2
a.out (pid 1750): Unaligned data reference (code 28) at 000104e3

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001101111111000001011 Not tainted
r00-03  0006fe0b 40218aa0 40419567 c01d3780
r04-07  405349d4 00000000 00000000 c01d35a4
r08-11  c035000a 00000001 0004b6d8 000119ee
r12-15  00050ed8 00050ed8 0004b6d8 00050ed8
r16-19  c0350818 0004b6d8 0004b6d8 00000000
r20-23  00000000 00000000 000104c4 000119de
r24-27  c01d35ac c01d35a4 00000001 000119b0
r28-31  ffffffff 00000001 c01d37c0 40204277
sr00-03  00000219 00000000 00000000 00000219
sr04-07  00000219 00000219 00000219 00000219

      VZOUICununcqcqcqcqcqcrmunTDVZOUI
FPSR: 00000000000000000000000000000000
FPER1: 00000000
fr00-03  0000000000000000 0000000000000000 0000000000000000 0000000000000000
fr04-07  11b894e88f614600 000000001017ade8 00000000105d2010 0000000000000000
fr08-11  11b3ad3cfffffff4 104d524c00000003 0000000011b894e8 0000000000000002
fr12-15  00000000105d8ed0 105d201010178574 11b4422c10464300 1067d2b8105d2010
fr16-19  105d8e88fffff000 8ff150001017af24 0000000f8ff15000 106794601067ca10
fr20-23  0000000f105a3010 105a30101017aa4c 000012e000000970 00001c507188c177
fr24-27  0000000200000000 0000000000000000 00000000105d8810 105a2b3c3b9aca00
fr28-31  105d8e88fffff000 8ff15000101775f0 0000000000100000 0000000200000000

IASQ: 00000219 00000219 IAOQ: 000104e3 000104e7
 IIR: 0f801093    ISR: 00000219  IOR: ffffffff
 CPU:        0   CR30: 8c128000 CR31: 10628000
 ORIG_R28: 4021bbd8
 IAOQ[0]: 0x104e0
 IAOQ[1]: 0x104e4
 RP(r2): 0x40419564
------------[ cut here ]------------
kernel BUG at mm/mmap.c:1991!

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001100000000000001111 Not tainted
r00-03  0006000f 10268800 10127ff4 8e83bbb8
r04-07  00000000 8e83bbb8 00000001 0000000b
r08-11  8f60e5b4 8f60e3b8 8c128108 000119ee
r12-15  00050ed8 00050ed8 0004b6d8 00050ed8
r16-19  8f60e3b8 0004b6d8 0004b6d8 00000001
r20-23  1067b6a4 8c9da94c 6b6b6b6b 00000000
r24-27  00000000 0000006b 8c9da8f8 10578010
r28-31  00000000 8c9da8f0 8c128380 101775b8
sr00-03  00000000 00000000 00000000 0000021b
sr04-07  00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 1016a144 1016a148
 IIR: 03ffe01f    ISR: 10240001  IOR: 9ee7b658
 CPU:        0   CR30: 8c128000 CR31: 10628000
 ORIG_R28: 0004b6d8
 IAOQ[0]: exit_mmap+0x130/0x14c
 IAOQ[1]: exit_mmap+0x134/0x14c
 RP(r2): mmput+0x68/0x108
Backtrace:
 [<101073f0>] die_if_kernel+0x130/0x198
 [<10107544>] handle_break+0x88/0xec
 [<10107dcc>] handle_interruption+0x570/0x58c
 [<1010b078>] intr_check_sig+0x0/0x34

Fixing recursive fault but reboot is needed!
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

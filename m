Return-Path: <parisc@rkeene.org>
Received: from mail.oc9.org (unknown [209.224.199.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id C853C4880
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 19 Apr 2004 23:41:30 -0600 (MDT)
Received: from hammer.oc9.org (rkeene@localhost [127.0.0.1])
	by mail.oc9.org (8.12.11/8.12.11/Debian-3) with ESMTP id i3K5fOOi011263
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 20 Apr 2004 00:41:30 -0500
Received: from localhost (rkeene@localhost)
	by hammer.oc9.org (8.12.11/8.12.11/Debian-3) with ESMTP id
	i3K5fONC011260 for <parisc-linux@lists.parisc-linux.org>;
	Tue, 20 Apr 2004 00:41:24 -0500
Date: Tue, 20 Apr 2004 00:41:23 -0500 (CDT)
From: Roy Keene <parisc@rkeene.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.58.0404200039410.31608@hammer.oc9.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Kernel 2.4 bug (fwd)
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Btw, `submit@bugs.parisc-linux.org' doesn't work.

---------- Forwarded message ----------
Date: Tue, 20 Apr 2004 00:34:27 -0500 (CDT)
From: Roy Keene <parisc@rkeene.org>
To: submit@bugs.parisc-linux.org
Subject: Kernel 2.4 bug

I'd like to report a bug in the main kernel and parisc patched kernel, it
can be reliably reproduced:

do_page_fault() pid=10963 command='test' type=15 address=0x00042004
vm_start = 0x00021000, vm_end = 0x00042000

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001100000000000001111 Not tainted
r00-03  00000000 40183344 400a90e3 40187c50
r04-07  40186108 40187c50 00020ade 00000001
r08-11  00020ae6 000de988 00000000 00000000
r12-15  000e29c8 000a0800 000ddca8 000e1dc8
r16-19  000e29c8 00000000 00000000 40186108
r20-23  fffdf048 00000048 00020fb9 00020fb8
r24-27  00021050 00042000 00021048 000209d0
r28-31  00000000 00000000 bff00a40 400a8a93
sr0-3   0000003f 0000003f 00000000 0000003f
sr4-7   0000003f 0000003f 0000003f 0000003f

IASQ: 0000003f 0000003f IAOQ: 400aac07 400aac0b
 IIR: 0f28109d    ISR: 0000003f  IOR: 00042004
 CPU:        0   CR30: 37fb0000 CR31: 10380000
 ORIG_R28: 00021000



I'm running:
Linux hammer.oc9.org 2.4.25-pa0 #3 Fri Mar 12 19:49:36 CST 2004 parisc GNU/Linux

This is my CPU information:
processor       : 0
cpu family      : PA-RISC 2.0
cpu             : PA8500 (PCX-W)
cpu MHz         : 400.000000
model           : 9000/785/C3000
model name      : AllegroHigh W
hversion        : 0x00005bb0
sversion        : 0x00000481
I-cache         : 512 KB
D-cache         : 1024 KB (WB)
ITLB entries    : 160
DTLB entries    : 160 - shared with ITLB
bogomips        : 799.53
software id     : 2007272275

This is the source to cause the problem:
#include <unistd.h>
#include <stdlib.h>

int main(void) {
        char *x;
        x=malloc(4096);
        x[0]='0';
        x[4095]='0';
        free(x);
        free(x);
        return(0);
}



(double free() shouldn't cause the kernel to give page faults, running it
 enough times eventually crashes the kernel)

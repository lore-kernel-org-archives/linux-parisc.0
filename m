Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id C9B9D482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 25 Apr 2001 20:00:11 -0600 (MDT)
Received: (from grundler@localhost)
	by puffin.external.hp.com (8.9.3/8.9.3) id TAA04477
	for parisc-linux@lists.parisc-linux.org; Wed, 25 Apr 2001 19:53:51 -0600
Date: Wed, 25 Apr 2001 19:53:51 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
Message-Id: <200104260153.TAA04477@puffin.external.hp.com>
To: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] do_page_fault() pid=2456 command='ldd'
List-ID: <linux-parisc.vger.kernel.org>

Using a kernel built from 4/25 and "dpkg-buildpackage -b -uc" of
the iptables-1.2.1a sources.  I've built this package several times
before w/o problems but with slightly older kernels. I haven't tried
to reproduce this or checked to see how reproducible it is.
If anyone has an idea what caused this:

do_page_fault() pid=2456 command='ldd' type=15 address=0x0009d0b0
vm_start = 0x00084000, vm_end = 0x0009d000

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001100000000000001111
r0-3     0000000000000000 0000000000080068 000000000000c000 000000000009a250
r4-7     000000000009b7f0 0000000000000000 00000000ffffffff 0000000000000000
r8-11    00000000ffffffff 0000000000000000 000000000009aa10 000000000009b6b0
r12-15   0000000000000000 00000000ffffffff 000000000009b870 0000000000000000
r16-19   0000000000000000 0000000000000802 0000000000081868 0000000000000000
r20-23   000000000009ac14 00000000412e8480 0000000000000001 0000000000088868
r24-27   0000000000080080 000000000009ac10 0000000000080068 0000000000080068
r28-31   0000000000000001 0000020000000000 00000000faf01d40 000000004016ebd7
sr0-3    000000000009f100 000000000009f100 0000000000000000 000000000009f100
sr4-7    000000000009f100 000000000009f100 000000000009f100 000000000009f100

IASQ: 000000000009f100 000000000009f100 IAOQ: 000000000000c007 000000000000c00b
 IIR: 65787400    ISR: 000000000009f100  IOR: 000000000009d0b0
ORIG_R28: 000000000009ac10

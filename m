Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 876734856
	for <parisc-linux@lists.parisc-linux.org>;
	Mon,  5 Apr 2004 12:03:40 -0600 (MDT)
Received: from localhost (localhost [127.0.0.1])
	by colo.lackof.org (Postfix) with ESMTP id BA672298064
	for <parisc-linux@lists.parisc-linux.org>;
	Mon,  5 Apr 2004 12:03:39 -0600 (MDT)
Received: from colo.lackof.org ([127.0.0.1])
	by localhost (colo [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 28558-10 for <parisc-linux@lists.parisc-linux.org>;
	Mon, 5 Apr 2004 12:03:39 -0600 (MDT)
Date: Mon, 5 Apr 2004 12:03:38 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040405180338.GA28537@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] HPMC 2.6.5-rc1 kernel on c3k
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

FYI.

My c3k HPMC'd last night when I was compiling kernels.
USB was likely just the "victim" and not the culprit since
I was working remotely and wasn't using any USB devices.
Ie recent changes to SBA IOMMU code might still be suspect
(I have no ideas what, just it's the place to start looking).

I've typed in console output by hand so it may not be 100% accurate.

hth,
grant


Addresses on stack:
	__wake_up_common+0x60/0xa8
	parisc_terminate+0x60/0xb8
	__wake_up+0x20/0x38
	handle_interruption+0x144/0x560
	intr_check_sig+0x0/0xc
	roothub_a+0xc/0x5c
	dentry_open+0x160/0x230
	start_kernel

PSW  C, Q, P, D bits are set

r00-03	00000000 1039e010 10299cac 4fcd9628
...
r20-23  f9007048 4fcd4000 10299c74 1047d690
r24-27  6875b0a0 4fc26000 4fcd9400 10395010

sr3 0x5
sr4-7 0x0
IIR 0e80019c
IOAQ roothub_a+0x8
RP   ohci_hub_status_data+0x38/0x16c

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.istop.com (cpu1693.adsl.bellglobal.com [206.47.27.174])
	by dsl2.external.hp.com (Postfix) with ESMTP id E008D482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Dec 2001 14:25:56 -0700 (MST)
Received: from old@istop.magma.ca (herbr.istop.com [216.187.107.13])
	by ns.istop.com (Postfix) with ESMTP id EED8517018
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Dec 2001 16:29:12 -0500 (EST)
Message-Id: <5.1.0.14.0.20011217161541.026f40e0@mail.magma.ca>
Date: Mon, 17 Dec 2001 16:25:25 -0500
To: parisc-linux@lists.parisc-linux.org
From: Herb Radford <herbr@magma.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Subject: [parisc-linux] C110 Kernel panic while installing 0.9.3
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

I have had success and no problems installing the latest 0.9.3 on my B180L, 
so I had to be a glutton for punishment and tried on the C110.

Should not have done that. I have successfully installed the kernel and 
base for 0.9.3 and ftp'd vmlinux-32-2.4.16-pa16 kernel to the machine and 
re-booted to avoid the FWSCSI fs corruption. After that I started to 
install the X stuff. When I am doing an apt-get install xfonts-base (or 
xfonts-100dpi or xfonts-75dpi) I get a kernel panic:

ccio-dma.c:349: Assertion (*res_ptr & *mask_ptr) == * mask_ptr failed!
Kernel panic: (*res_ptr & *mask_ptr) == *mask_ptr
In interrupt handler - not syncing

I don't have the source for this and haven't yet looked at the code but I 
thought someone would like to know.

Regards, Herb

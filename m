Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA15403
	for <parisc-linux@puffin.external.hp.com>; Wed, 27 Dec 2000 13:54:14 -0700
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by atlrel2.hp.com (Postfix) with ESMTP id 078904E1
	for <parisc-linux@thepuffingroup.com>; Wed, 27 Dec 2000 15:57:25 -0500 (EST)
Received: from carmen.fc.hp.com (localhost [127.0.0.1])
	by carmen.fc.hp.com (Postfix) with ESMTP id CF5B037C97
	for <parisc-linux@thepuffingroup.com>; Wed, 27 Dec 2000 13:59:17 -0700 (MST)
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Same boot problem on a 9000/720/50 HP machine as
 on 712/60 of Niskanen
In-Reply-To: Message from Matt Taggart <taggart@carmen.fc.hp.com>
   of "Tue, 26 Dec 2000 21:34:46 MST." <20001227043446.6DCFD37C97@carmen.fc.hp.com>
References: <3A4940BF.3EB18F61@dot.at> <20001227012741.A150937C97@carmen.fc.hp.com>  <20001227043446.6DCFD37C97@carmen.fc.hp.com> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 27 Dec 2000 13:59:17 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20001227205917.CF5B037C97@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


Matt Taggart writes...

> Ok, I got bash to build static against the glibc in the xc and I setup an 
> nfsroot with bash as my init. I am using a new kernel built with the same xc.
>  
> Here's what I get when booting,
> 
> -----------------------------------------------------------------------------
> .
> .
> .
> IP-Config: Got BOOTP answer from 15.1.51.72, my address is 15.1.51.73
> NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
> kmem_create: Forcing size word alignment - nfs_fh
> Looking up port of RPC 100003/2 on 15.1.51.72
> Looking up port of RPC 100005/2 on 15.1.51.72
> VFS: Mounted root (nfs filesystem) readonly.
> 
> do_page_fault() pid=1 command='init' address=0xfffffff8
> vm_start = 0xbb000000, vm_end = 0xbb002000
> 
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001001111111100001011
> r0-3     00000000 001071d0 00088153 fffffff8
> r4-7     bb0002c8 00000023 00000000 0000003a
> r8-11    00001368 00000000 000d6884 c01456a4
> r12-15   00000000 00000000 00000000 00000000
> r16-19   c027b60c c02ac000 00000000 00000001
> r20-23   000e3848 000e384c 01010101 80808080
> r24-27   000e3828 00000023 00000000 000fd9d0
> r28-31   00000022 0000000a bb000480 0008d443
> sr0-3    00000000 00000000 00000000 00000001
> sr4-7    00000001 00000001 00000001 00000001
> 
> IASQ: 00000001 00000001 IAOQ: 00068697 0006869b
>  IIR: 0c601084    ISR: 00000001  IOR: fffffff8
> ORIG_R28: 00000003
> -----------------------------------------------------------------------------
> 
> and it keeps looping with that same error.
> 
> The bash I'm using is at
> 
> ftp://puffin.external.hp.com/pub/parisc/debug/bash-20001226.tar.gz
> 
> The xc I'm using is at
> 
> ftp://puffin.external.hp.com/pub/parisc/debug/xc-20001222.tar.gz
> 
> I think the kernel and libc have different world views. I can provide 
> different bits on request.

I also just tried booting an old nfsroot, then trying to run the static bash. 
Here's what I get,

-----------------------------------------------------------------------------
geordi:/tmp/bash/bin# ./bash

do_page_fault() pid=117 command='bash' address=0xfffffff8
vm_start = 0xbb000000, vm_end = 0xbb001000

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001011
r0-3     00000000 001071d0 00088153 fffffff8
r4-7     bb000408 00000023 00000000 0000003a
r8-11    00001368 0008b810 000d6884 00094cf0
r12-15   00000000 00000000 00094cb0 00000000
r16-19   00000000 00000001 0000b71b 00000001
r20-23   000e3848 000e384c 01010101 80808080
r24-27   000e3828 00000023 00000000 000fd9d0
r28-31   00000022 000ec839 bb0005c0 0008d443
sr0-3    00000000 00000000 00000000 00000003
sr4-7    00000003 00000003 00000003 00000003

IASQ: 00000003 00000003 IAOQ: 00068697 0006869b
 IIR: 0c601084    ISR: 00000003  IOR: fffffff8
ORIG_R28: 00000003
Segmentation fault
-----------------------------------------------------------------------------

Just to see how bad the problem was I built helloworld and it runs ok. I'll 
try to narrow it down more than that :)

-- 
Matt Taggart
taggart@fc.hp.com

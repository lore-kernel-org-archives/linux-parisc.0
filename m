Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 769CB482D
	for <parisc-linux@parisc-linux.org>; Tue, 15 Jul 2003 08:12:50 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19cQXx-0006hH-Ee; Tue, 15 Jul 2003 15:12:49 +0100
Date: Tue, 15 Jul 2003 15:12:49 +0100
From: Matthew Wilcox <willy@debian.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Message-ID: <20030715141249.GT23808@parcelfarce.linux.theplanet.co.uk>
References: <20030714124812.GF23808@parcelfarce.linux.theplanet.co.uk> <3F0C2302000015C8@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F0C2302000015C8@ocpmta2.freegates.net>
Subject: [parisc-linux] Re: 2.6.0-test1: Kernel pci bug ?
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

On Tue, Jul 15, 2003 at 03:58:36PM +0200, Joel Soete wrote:
> kernel BUG at arch/parisc/kernel/pci.c:338!

Oops, my mistake.  It's completely harmless, but I'll commit a fix
right now.

> sym53c8xx: at PCI bus 0, device 19, function 0
> sym53c8xx: 53c875 detected 
> sym53c875-0: rev 0x4 on pci bus 0 device 19 function 0 irq 99
> ERROR: SCSI host `sym53c8xx' has no error handling
> ERROR: This is not a safe way to run your SCSI host
> ERROR: The error handling must be added to this driver

Can you use the sym2 driver instead of the original sym driver?

> Freeing unused kernel memory: 524k freed
> 
> Kernel addresses on the stack:
>  [<10106008>] parisc_terminate+0x54/0xac
>  [<10106304>] handle_interruption+0x2a4/0x5b4
>  [<1013da9c>] buffered_rmqueue+0xd8/0x164
>  [<1013dbd8>] __alloc_pages+0xb0/0x368
>  [<1010a088>] intr_check_sig+0x0/0xc
>  [<1013a950>] filemap_nopage+0x35c/0x3e8
>  [<101e5698>] __canonicalize_funcptr_for_compare+0x3c/0x134
>  [<101667ec>] may_open+0x58/0x1c8
>  [<101562d8>] dentry_open+0x12c/0x1b8
>  [<101694b8>] locate_fd+0x124/0x160
>  [<10169704>] sys_dup+0x24/0x30
>  [<101562d8>] dentry_open+0x12c/0x1b8
>  [<1013063c>] do_sigaction+0xe0/0x290
>  [<101062d4>] handle_interruption+0x274/0x5b4
>  [<10130b44>] sys_rt_sigaction+0x7c/0xc4
>  [<1010afe8>] syscall_exit+0x0/0x28
>  [<1010a088>] intr_check_sig+0x0/0xc
> 
> 
> Kernel Fault: Code=15 regs=17fb8200 (Addr=00027750)
> 
>      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001101111111100001110 Not tainted
> r00-03  00000000 103ba504 1013063c 00027750
> r04-07  00000000 0000000d 0000000e 10413a20
> r08-11  17fb80c8 00000001 1037d000 10169704
> r12-15  00027174 00000000 17fbf670 1037d000
> r16-19  10368010 00027974 ffffffff 10368010
> r20-23  00001000 00027753 000000e0 0000000c
> r24-27  00000000 00000000 00027752 10368010
> r28-31  00027752 00000400 17fb8200 40061097
> sr0-3   00000001 00000001 00000000 00000001
> sr4-7   00000000 00000000 00000000 00000000
> 
> IASQ: 00000000 00000000 IAOQ: 101e5694 101e5698
>  IIR: 0c601094    ISR: 00000000  IOR: 00027750
>  CPU:        0   CR30: 17fb8000 CR31: 103bd000
>  ORIG_R28: 00000000
>  IAOQ[0]: __canonicalize_funcptr_for_compare+0x38/0x134
>  IAOQ[1]: __canonicalize_funcptr_for_compare+0x3c/0x134
>  RP(r2): do_sigaction+0xe0/0x290
> 
> Any idea?

This is the fatal one.  Dying in __canonicalize_funcptr_for_compare ...
outside my realm of expertise (since i use gcc-3.0 still).

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk

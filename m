Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5417E4864
	for <parisc-linux@lists.parisc-linux.org>; Mon,  8 Oct 2001 09:22:41 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15qcEk-0002DV-00; Mon, 08 Oct 2001 16:22:34 +0100
Date: Mon, 8 Oct 2001 16:22:34 +0100
From: Matthew Wilcox <willy@debian.org>
To: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org,
	debian-hppa@lists.debian.org, lvm-bugs@sistina.com
Message-ID: <20011008162234.D28880@parcelfarce.linux.theplanet.co.uk>
References: <1002553729.3bc1c18187924@webmail.tiscalinet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1002553729.3bc1c18187924@webmail.tiscalinet.be>; from joel.soete@freebel.net on Mon, Oct 08, 2001 at 05:08:49PM +0200
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] Re: LVM 1.0.1-rc4 on hppa
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Oct 08, 2001 at 05:08:49PM +0200, joel.soete@freebel.net wrote:
> Also I excute 'vgscan':
> Segmentation fault.
> 
> Oct  8 17:06:56 palinux kernel: do_page_fault() pid=201 command='vgscan' type=15 
> address=0xffffffec
> Oct  8 17:06:56 palinux kernel: vm_start = 0xfaf00000, vm_end = 0xfaf02000
> Oct  8 17:06:56 palinux kernel: 
> Oct  8 17:06:56 palinux kernel:      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> Oct  8 17:06:56 palinux kernel: PSW: 00000000000001000000000000001111
> Oct  8 17:06:56 palinux kernel: r0-3^I 00000000 401c757c 4003c507 faf006c0
> Oct  8 17:06:56 palinux kernel: r4-7^I 4006d0b8 0000003f 0002227c 00000001
> Oct  8 17:06:56 palinux kernel: r8-11^I 00000000 00000076 00000064 0000003f
> Oct  8 17:06:56 palinux kernel: r12-15^I 00011800 0002227c 00011800 0002227c
> Oct  8 17:06:56 palinux kernel: r16-19^I 0002227c 00000000 00014000 401c557c
> Oct  8 17:06:56 palinux kernel: r20-23^I 00000000 00000000 00000002 00000001
> Oct  8 17:06:56 palinux kernel: r24-27^I 0000001f 401c07d0 00010fff 0002227c
> Oct  8 17:06:56 palinux kernel: r28-31^I 00000000 00000000 faf00700 40154d23
> Oct  8 17:06:56 palinux kernel: sr0-3^I 00000000 000002b8 00000000 000002b8
> Oct  8 17:06:56 palinux kernel: sr4-7^I 000002b8 000002b8 000002b8 000002b8
> Oct  8 17:06:56 palinux kernel: 
> Oct  8 17:06:56 palinux kernel: IASQ: 000002b8 000002b8 IAOQ: 4015dc8b 4015dc8f
> Oct  8 17:06:56 palinux kernel:  IIR: 4a963fd9    ISR: 000002b8  IOR: ffffffec
> Oct  8 17:06:56 palinux kernel:  CPU:        0   CR30: 170d8000 CR31: 10358000
> Oct  8 17:06:56 palinux kernel:  ORIG_R28: 00000003

looks like a null pointer dereference in a shared library -- can't tell
which without seeing the maps for vgscan.  i recommend running vgscan
under gdb and seeing wht's going on.

-- 
Revolutions do not require corporate support.

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from kuolema.infodrom.north.de (kuolema.infodrom.north.de [217.89.86.35])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7FDB1482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  5 Jul 2001 12:16:28 -0600 (MDT)
Date: Thu, 5 Jul 2001 20:15:20 +0200
From: Torsten Neumann <torsten@imke.infodrom.ffis.de>
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20010705201520.A3618@imke.infodrom.ffis.de>
References: <20010704155108.H31475@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010704155108.H31475@tausq.org>
Sender: torsten@imke.infodrom.north.de
Subject: [parisc-linux] Re: unaligned memory accesses
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jul 04, 2001 at 03:51:08PM -0700, Randolph Chung wrote:
> Torsten and Peter,
> 
> I've checked in some changes to parisc kernel cvs that should address 
> the crashes you've seen. Please try picking up latest kernel files from 
> cvs and let us know if they fix the errors you've seen.

Tried latest kernel from cvs ( 2.4.0-pa51 ) and still got the same result,

pvcreate(204): unaligned access to 0x40067cf3 at ip=0x400310db
pvcreate(204): unaligned access to 0x40067cf7 at ip=0x400310e3

do_page_fault() pid=204 command='pvcreate' type=6 address=0x00400387
vm_start = 0x00024000, vm_end = 0x00025000

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000011101111111100001111
r0-3	 00000000 40067b38 4003cf23 faf00009
r4-7	 00000004 40068338 00000000 00000000
r8-11	 00000000 00000000 00000000 00000000
r12-15	 00000000 00000000 00023284 00023284
r16-19	 00023284 faf00688 ffffffff 70400683
r20-23	 00000000 00400386 40067120 ffffffff
r24-27	 faf0081c 00000010 00000004 00023284
r28-31	 00000010 00000008 faf00800 4003cf33
sr0-3	 0000021a 0000021a 00000000 0000021a
sr4-7	 0000021a 0000021a 0000021a 0000021a

IASQ: 0000021a 0000021a IAOQ: 00400387 0040038b
 IIR: 0f201090    ISR: 0000021a  IOR: 40067cf7
 ORIG_R28: 00000000

  Torsten

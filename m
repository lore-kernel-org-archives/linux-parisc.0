Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id DAB94482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Dec 2001 06:22:18 -0700 (MST)
Received: from www2.scram.de (www2.scram.de [195.226.127.84])
	by mail.scram.de (8.11.0/8.11.0) with ESMTP id fBIDMGV02084
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Dec 2001 14:22:16 +0100 (CET)
Date: Tue, 18 Dec 2001 14:22:15 +0100 (CET)
From: Jochen Friedrich <jochen@scram.de>
To: HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
Message-ID: <Pine.NEB.4.33.0112181417170.14021-100000@www2.scram.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] ISA memory access
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

Hi there,

is it necessary to perform something similar to eisa_permute for ISA
memory space? At least on IBM Token Ring cards the driver fails to get
correct data if (memory & 0x300) == 0:

eisa: irq IAR 03 8259-1 irr 00 8259-2 irr 00
eisa: irq 8259-1 isr 00 imr 73 8259-2 isr 00 imr ff
tr0: Int from tok_driver, dev : 102804c0 irq3 regs=102e45c0
tr0: ARB resp: cmd=81
tr0: rbuffer: 7876.
tr0: offsetof data: 08 lan_hdr_len: 10
tr0: llc: FC0D788E rec_buf_addr: 7876 dev->mem_start: D0000
tr0: dsap: FF, ssap: FF, llc: FF, protid: FFFFFF, ethertype: FFFF

this is garbage.

eisa: irq IAR 03 8259-1 irr 00 8259-2 irr 00
eisa: irq 8259-1 isr 00 imr 73 8259-2 isr 00 imr ff
tr0: Int from tok_driver, dev : 102804c0 irq3 regs=102e45c0
tr0: ARB resp: cmd=81
tr0: rbuffer: DFE.
tr0: offsetof data: 08 lan_hdr_len: 10
tr0: llc: FC0D0E16 rec_buf_addr: 0DFE dev->mem_start: D0000
tr0: dsap: AA, ssap: AA, llc: 03, protid: 000000, ethertype: 0800

this is correct.

At the beginning it looked like memory access fails as soon as the buffer
is > 0x400, but the same happens if i reduce the window to 16K and use
memory paging on the adapter. The adapter itself works OK (verified on an
Intel PC).

Cheers,
Jochen

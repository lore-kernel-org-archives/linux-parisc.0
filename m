Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.pangeatech.com (pxofc151-phx1.pangeatech.com [63.110.32.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 13C3A4946
	for <parisc-linux@lists.parisc-linux.org>; Wed, 10 Oct 2001 01:08:13 -0600 (MDT)
Received: from [65.192.22.133] by mail.pangeatech.com (NTMail 7.00.0018/NU8172.00.e2123c13) with ESMTP id ijgaiaaa for parisc-linux@lists.parisc-linux.org; Wed, 10 Oct 2001 00:03:39 -0700
Date: Tue, 9 Oct 2001 20:04:38 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20011009200438.F653@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] HPMC when doing sync on c3k (32 bit kernel)
List-ID: <linux-parisc.vger.kernel.org>

I noticed that when i do a manual 'sync' on my c3000 running a 32-bit
kernel, I get a HPMC:


High Priority Machine Check (HPMC): Code=1 regs=1029c080 (Addr=00000000)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001101111110100001100
r0-3     00000000 102a9010 1010e228 000000ff
r4-7     00000000 00000000 102ad010 10355074
r8-11    10355010 10354810 0004000e 102d4730
r12-15   10349810 10349010 103495dc 102ad010
r16-19   1032c580 f000017c f0000174 0000000e
r20-23   1036f140 000003fd 1010e20c 00000000
r24-27   000003fd fee003fd fee003fd 10292010
r28-31   00000000 00000205 1032cb00 1010cc2c
sr0-3    00000000 0000027c 00000000 00000009
sr4-7    00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 10207568 1020756c
 IIR: 0f40001c    ISR: a607fffb  IOR: 802003fd
 CPU:        0   CR30: 1032c000 CR31: 10330000
 ORIG_R28: 00000000

"pim hpmc" says:
A Data I/O Fetch Timeout occurred while CPU 0 was
requesting information from a device at the path 10/0/14/1/1 (built-in
PCI device)

apparently it died in _gsc_readb.

With a 64-bit kernel it works ok.

Anyone else seeing this/know what's going on?

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^

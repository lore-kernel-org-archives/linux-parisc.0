Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from silly.cloud.net.au (c20042.eburwd1.vic.optusnet.com.au [203.164.66.244])
	by dsl2.external.hp.com (Postfix) with ESMTP id 379B5482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 11 Jan 2002 16:17:59 -0700 (MST)
Date: Sat, 12 Jan 2002 10:17:51 +1100
From: Hamish Moffatt <hamish@cloud.net.au>
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] How to configure EISA network card in 715/80
Message-ID: <20020112101751.A27054@silly.cloud.net.au>
References: <3C3F06DD.6050409@verizon.net> <20020111154337.D26644@parcelfarce.linux.theplanet.co.uk> <3C3F0DD1.4040508@verizon.net> <20020111161705.E26644@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020111161705.E26644@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Fri, Jan 11, 2002 at 04:17:05PM +0000
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

On Fri, Jan 11, 2002 at 04:17:05PM +0000, Matthew Wilcox wrote:
> This is rather strange.  I see no EISA adapter.  Sure, we have Wax in
> its role as a bus adapter, with its HIL & RS-232 subdevices, but there's
> no EISA device.  Anyone know why this might be?
> 
> (iirc, it normally shows up as device 6).

FWIW, it's device #11 for me. On a 712/80:

Found devices:
1. Mirage 80 GSC Builtin Graphics (10) at 0xf8000000 [1], versions 0x10, 0x0, 0x85
2. Mirage 80 Core BA (11) at 0xf0100000 [2], versions 0x2b, 0x0, 0x81
3. Mirage 80 Core SCSI (10) at 0xf0106000 [2/0/1], versions 0x2b, 0x0, 0x82
4. Mirage 80 Core LAN (802.3) (10) at 0xf0107000 [2/0/2], versions 0x2b, 0x0, 0x8a
5. Mirage 80 Core RS-232 (10) at 0xf0105000 [2/0/4], versions 0x2b, 0x0, 0x8c
6. Mirage 80 Core Centronics (10) at 0xf0102000 [2/0/6], versions 0x2b, 0x0, 0x74
7. Mirage 80 Audio (10) at 0xf0104000 [2/0/8], versions 0x2b, 0x0, 0x7b
8. Mirage 80 Core PC Floppy (10) at 0xf010a000 [2/0/10], versions 0x2b, 0x0, 0x83
9. Mirage 80 Core PS/2 Port (10) at 0xf0108000 [2/0/11], versions 0x2b, 0x0, 0x84
10. Mirage 80 Core PS/2 Port (10) at 0xf0108100 [2/0/12], versions 0x2b, 0x0, 0x84
11. Mirage 80 Wax EISA BA (11) at 0xfc000000 [4], versions 0x2b, 0x0, 0x90
12. Pace Wax BA (11) at 0xf0200000 [5], versions 0x10, 0x0, 0x8e
13. Pace Core HIL (10) at 0xf0201000 [5/0/1], versions 0x10, 0x0, 0x73
14. Mirage 80 Wax RS-232 (10) at 0xf0202000 [5/0/2], versions 0x10, 0x0, 0x8c
15. Mirage 80  (0) at 0xfffbe000 [8], versions 0x619, 0x0, 0x4
16. Mirage 80 (1) at 0xfffbf000 [9], versions 0x4f, 0x0, 0x9

I don't have anything on the EISA bus that I'm aware of; nothing
that I need to use anyway.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>

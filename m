Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7421F482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 11 Jan 2002 09:17:06 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16P4Mb-0002F5-00; Fri, 11 Jan 2002 16:17:05 +0000
Date: Fri, 11 Jan 2002 16:17:05 +0000
From: Matthew Wilcox <willy@debian.org>
To: raffo@neuronet.pitt.edu
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] How to configure EISA network card in 715/80
Message-ID: <20020111161705.E26644@parcelfarce.linux.theplanet.co.uk>
References: <3C3F06DD.6050409@verizon.net> <20020111154337.D26644@parcelfarce.linux.theplanet.co.uk> <3C3F0DD1.4040508@verizon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3C3F0DD1.4040508@verizon.net>; from vze26vn8@verizon.net on Fri, Jan 11, 2002 at 11:07:45AM -0500
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

On Fri, Jan 11, 2002 at 11:07:45AM -0500, Rafael Herrera wrote:
> 1. Mirage 80 GSC Builtin Graphics (10) at 0xf8000000 [1], versions 0x10, 0x0, 0x85
> 2. Mirage 80 Core BA (11) at 0xf0100000 [2], versions 0x2b, 0x0, 0x81
> 3. Mirage 80 Core SCSI (10) at 0xf0106000 [2/0/1], versions 0x2b, 0x0, 0x82
> 4. Mirage 80 Core LAN (802.3) (10) at 0xf0107000 [2/0/2], versions 0x2b, 0x0, 0x8a
> 5. Mirage 80 Core RS-232 (10) at 0xf0105000 [2/0/4], versions 0x2b, 0x0, 0x8c
> 6. Mirage 80 Core Centronics (10) at 0xf0102000 [2/0/6], versions 0x2b, 0x0, 0x74
> 7. Mirage 80 Audio (10) at 0xf0104000 [2/0/8], versions 0x2b, 0x0, 0x7b
> 8. Mirage 80 Core PC Floppy (10) at 0xf010a000 [2/0/10], versions 0x2b, 0x0, 0x83
> 9. Mirage 80 Core PS/2 Port (10) at 0xf0108000 [2/0/11], versions 0x2b, 0x0, 0x84
> 10. Mirage 80 Core PS/2 Port (10) at 0xf0108100 [2/0/12], versions 0x2b, 0x0, 0x84
> 11. Pace Wax BA (11) at 0xf0200000 [5], versions 0x10, 0x0, 0x8e
> 12. Pace Core HIL (10) at 0xf0201000 [5/0/1], versions 0x10, 0x0, 0x73
> 13. Mirage 80 Wax RS-232 (10) at 0xf0202000 [5/0/2], versions 0x10, 0x0, 0x8c
> 14. Mirage 80 (0) at 0xfffbe000 [8], versions 0x619, 0x0, 0x4
> 15. Mirage 80 (1) at 0xfffbf000 [9], versions 0x4f, 0x0, 0x9

This is rather strange.  I see no EISA adapter.  Sure, we have Wax in
its role as a bus adapter, with its HIL & RS-232 subdevices, but there's
no EISA device.  Anyone know why this might be?

(iirc, it normally shows up as device 6).

-- 
Revolutions do not require corporate support.

Received: from rhirst.linuxcare.com (user-223-220.jakinternet.co.uk [212.187.223.220])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id HAA14916
	for <parisc-linux@puffin.external.hp.com>; Thu, 30 Nov 2000 07:07:07 -0700
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 0D4CCB007; Thu, 30 Nov 2000 14:03:10 +0000 (GMT)
Date: Thu, 30 Nov 2000 14:03:10 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@puffin.external.hp.com
Message-ID: <20001130140310.M22285@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 715/75 dies in pdc_iodc_read()
List-ID: <linux-parisc.vger.kernel.org>

Hi,
  My 715/75 no longer boots with cvs kernel.  It hangs while
searching for devices in PDC firmware, after finding the first
device.  The beta 0.5 cd kernel gets past this point.  The device
list is:

Searching for devices in PDC firmware... processor hpa 0xfffbe000
 an older box...
Found devices:
1. Stinger Optional Graphics (10) at 0xf4000000, versions 0x6, 0x0, 0x77, 0x0, 0x0
2. Scorpio Sr. Core BA (11) at 0xf082f000, versions 0x19, 0x0, 0x70, 0x0, 0x0
3. Scorpio Sr. Core SCSI (10) at 0xf0825000, versions 0x19, 0x0, 0x71, 0x0, 0x0
4. Scorpio Sr. Core LAN (802.3) (10) at 0xf0826000, versions 0x19, 0x0, 0x72, 0x0, 0x0
5. Scorpio Sr. Core HIL (10) at 0xf0821000, versions 0x19, 0x0, 0x73, 0x0, 0x0
6. Scorpio Sr. Core RS-232 (10) at 0xf0823000, versions 0x19, 0x0, 0x75, 0x0, 0x0
7. Scorpio Sr. Core RS-232 (10) at 0xf0822000, versions 0x19, 0x0, 0x75, 0x0, 0x0
8. Scorpio Sr. Core Centronics (10) at 0xf0824000, versions 0x19, 0x0, 0x74, 0x0, 0x0
9. Scorpio Sr. Audio (10) at 0xf1000000, versions 0x19, 0x0, 0x7b, 0x0, 0x0
10. Scorpio Sr. EISA BA (11) at 0xfc000000, versions 0x19, 0x0, 0x76, 0x0, 0x0
11. Unknown device (10) at 0xfc001000, versions 0x0, 0x0, 0xfff, 0x0, 0x0
12. Scorpio Sr.(715/75) (0) at 0xfffbe000, versions 0x316, 0x0, 0x4, 0x0, 0x81
13. Scorpio Sr. (1) at 0xfffbf000, versions 0x27, 0x0, 0x9, 0x0, 0x0
That's a total of 13 devices.
CPU(s): 1 x PA7100 (PCX-T) at 75.000000 MHz


So, with lastest cvs source, it gets in to the loop in
really_do_oldhw_inventory(), and first time through pdc_mem_map_hpa()
returns r_addr.hpa=0xf4000000 (the Stinger Optional Graphics).  Next
time round, mod=1, pdc_mem_map_hpa() returns r_addr.hpa=0xf8000000,
and the subsequent call to pdc_iodc_read() hangs.

I made the code skip the loop where mod=1, and it then goes on to
discover all the devices without problems.

At power on, the machine reports:

  Warning: one or more EISA cards could not be configured.
  Autoselect and search will ignore unconfigured cards.

Which I assume relates to an EISA SCSI card in the machine, which
I assume is item 11 in the above list.

Richard

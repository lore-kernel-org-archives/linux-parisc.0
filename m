Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA23686
	for <parisc-linux@puffin.external.hp.com>; Thu, 31 Aug 2000 14:35:58 -0600
Date: Thu, 31 Aug 2000 16:35:50 -0400 (EDT)
From: Andrew Park <apark@cdf.toronto.edu>
To: parisc-linux@thepuffingroup.com
In-Reply-To: <20000830170126.E3463@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.SOL.4.21.0008311603300.24635-100000@misty.cdf>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] getting kernel to load so far...
List-ID: <linux-parisc.vger.kernel.org>

Just wanted to report my progress publicly.
Last posting to the list was about my SCSI CD-ROM not booting the 
HP-UX INSTALL CD.  Well, it turns out that NECs are in 2048 byte sector
mode whereas HP requires 512 byte mode.  SUNs and SGIs also require 512
byte sector mode.  So I just borrowed a SUN external CD-ROM and issued

	boot pri isl

at BOOT_ADMIN> prompt and it took me right into the ISL prompt.  There
I changed the conspath to serial console.  I did not have null modem
cable (9 to 9 female), but I had a DB25 male to DB25 male cable and
a couple of DB25 male to DB9 female converters.  So I patched them up
and wired two boxes.  I fired up minicom then parisc box, and minicom
just wouldn't show a thing.  After wasting two days on it, I went out
and bought *real* DB9 female to DB9 female serial cable.  I hooked
THAT up and minicom began showing things.

But now I have bigger (I think) problem.  The kernel loading still
gets stuck at pdc_cons die!!  This is displayed on the serial console.
Anybody out there running i386 linux box as NFSROOT and serial console
server, also running bootp with combination of tftp?  Could you please
let me know what the syslog says from the booting of parisc box to
its shell?
Thanks



Andrew Park
           
________________________________________________________________________ 
CDFlab Systems Administrator                       www.cdf.utoronto.ca |
GnuPG Signature              www.cdf.utoronto.ca/~apark/public_key.txt |
------------------------------------------------------------------------

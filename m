Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id FAA17881
	for <parisc-linux@puffin.external.hp.com>; Fri, 23 Jun 2000 05:30:26 -0600
Received: from ppp-1-197.cvx3.telinco.net (HELO rhirst.linuxcare.com) (@212.1.144.197)
  by mailserv2.iuinc.com with SMTP; 23 Jun 2000 11:31:35 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 65FD2B005; Fri, 23 Jun 2000 12:31:15 +0100 (BST)
Date: Fri, 23 Jun 2000 12:31:15 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <20000623123115.K922@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] sym53c8xx.c now works with 53c875 on parisc
List-ID: <linux-parisc.vger.kernel.org>

Hi,
  I have fixed a couple of problems with parisc dynamic dma code so that
sym53c8xx.c now works on the 53c875 (on-board FWSCSI on my B180L).

The config options I used are:

CONFIG_SCSI_SYM53C8XX=y
CONFIG_SCSI_NCR53C8XX_DEFAULT_TAGS=8
CONFIG_SCSI_NCR53C8XX_MAX_TAGS=32
CONFIG_SCSI_NCR53C8XX_SYNC=20
# CONFIG_SCSI_NCR53C8XX_PROFILE is not set
CONFIG_SCSI_NCR53C8XX_IOMAPPED=y

The main problem was that xxx_alloc_consistent() should return a
virtual address that is aligned to a power of 2 boundary equivalent
to the size requested.  We used get_vm_area() which doesn't worry about
alignment of returned areas.  I have got round this by introducing a
new get_aligned_vm_area() function in mm/vmalloc.c, but I guess that
is probably only temporary until we decide on the proper solution.
Other archs use get_free_pages and so avoid this problem.

Suggestions, anyone?

Richard

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA11181
	for <parisc-linux@puffin.external.hp.com>; Fri, 18 Feb 2000 20:25:38 -0700
From: willy@thepuffingroup.com
Received: (from willy@localhost)
	by gin.ext.thepuffingroup.com (8.9.3/8.9.3) id VAA01527
	for parisc-linux@thepuffingroup.com; Fri, 18 Feb 2000 21:26:19 -0500
Date: Fri, 18 Feb 2000 21:26:19 -0500
To: parisc-linux@thepuffingroup.com
Message-ID: <20000218212619.W9944@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Weekly News [2000/02/18]
List-ID: <linux-parisc.vger.kernel.org>


PA-RISC/Linux Weekly News - 18th February 2000
	vol 2, issue 5

This Week

 * News & Announcements
 * This Week's CVS Activity
 * State of the Port Summary

News & Announcements

 * Astro and Elroy docs released
     Thanks to many people at Hewlett Packard, we now have
     documentation on the Astro and Elroy devices found in some of
     the newer PA-RISC machines, such as the C3000 and J5000. These
     documents have been converted to PostScript and are linked from
     http://www.thepuffingroup.com/parisc/documentation.html

 * NFS working
     Martin Petersen posted an NFS-Root howto on the list. If you use
     NFS root, then you don't need to use an initial ramdisk. This
     exercises quite a lot of the kernel, including the TCP/IP layer
     and the ethernet driver.

This Week's CVS Activity

 * The ELF toolchain has received some updates this week. Sammy
   contributed initial support for Linux/PARISC ELF32. Matthew contributed
   some build fixes for HP/UX and David H-D contributed Debian and Red
   Hat build support for x86.

 * John continued his low-level memory-management work by enabling the
   trapping of accidental user pointer dereferences.

 * Grant committed a bug-fix for card-mode DINOs.

State of the Port Summary

 * Kernel
     based on 2.3.42

 * Supported Hardware
    * SCSI, Lan and PS/2 on Lasi I/O controller
    * Dino PCI controller
    * Elroy PCI controller
    * Tulip ethernet
    * PCNet32 ethernet

 * Project Page
     http://www.thepuffingroup.com/parisc/

 * Latest Workable Image
     ftp://puffin.external.hp.com/pub/parisc/binaries/kernels/Image-20000218

 * Running PA-RISC/Linux "recipe"
     http://thepuffingroup.com/parisc/recipe.html

The observant will also notice there have been a few updates to the
website over the past couple of days.  I've fixed some dangling links
and typos.  I've also added some previously missing weekly updates to
the site.

-- 
Matthew Wilcox <willy@linuxcare.com> Lead Developer, Linux/PARISC

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id WAA03150
	for <parisc-linux@puffin.external.hp.com>; Sat, 4 Mar 2000 22:08:00 -0700
From: willy@thepuffingroup.com
Received: (from willy@localhost)
	by gin.ext.thepuffingroup.com (8.9.3/8.9.3) id XAA21947
	for parisc-linux@thepuffingroup.com; Sat, 4 Mar 2000 23:08:56 -0500
Date: Sat, 4 Mar 2000 23:08:56 -0500
To: parisc-linux@thepuffingroup.com
Message-ID: <20000304230856.C9944@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Weekly News [2000-03-03]
List-ID: <linux-parisc.vger.kernel.org>


PA-RISC/Linux Weekly News - 3rd March 2000

   http://www.thepuffingroup.com/parisc/
       vol 2, issue 7

   This Week:
   News & Announcements
       CVS Page
       This Week's CVS Activity
       State of the Port Summary

News & Announcements
                              
     * Hardware Database updated.
        Matthew & Dave have substantially updated the Hardware Database
            including correcting the CPU types, adding new drivers,
            adding PCI devices and fixing some of the ioscan output. If
            you have any machines running HPUX 10 or greater which aren't
            listed, please submit your ioscans to the database.
     * ELF work continuing
        Paul has put in a lot of work getting the ELF kernel booting.
            Once more people have reported success with ELF kernels,
            we'll switch all development over to ELF.
     * RPMs and DEBs available
        Thanks to Dave O'Neill and Dave Huggins-Daines, we have
            crosscompiling toolchains available from
            ftp://puffin.external.hp.com/pub/parisc/binaries for x86.
            Does anyone want to produce .depot files for us?

CVS Page

   Following on from last week's exciting look at the status page, this
       week's featured page is the CVS page. Newly updated to reflect
       reality, it tells you which repositories are available and how to
       access them.

This Week's CVS Activity

     * Grant updated the SBA IOMMU code.
     * Philipp cleaned up the header files.
     * Paul checked in a rewrite of PALO.
     * Matthew checked in the linux/parisc website.
     * Paul fixed a large number of ELF problems.
     * Gyula updated the LASI SCSI support.
     * Helge updated the LASI ethernet support.
        
State of the Port Summary
            
     * Kernel
          + based on 2.3.42
     * Supported Hardware:
          + SCSI, Lan and PS/2 on Lasi I/O controller
          + Dino PCI controller
          + Elroy PCI controller
          + Tulip ethernet
          + PCNet32 ethernet
          + Intel EEPro ethernet
     * Project Page
          + http://www.thepuffingroup.com/parisc/
     * Latest Workable Image
          + ftp://puffin.external.hp.com/pub/parisc/binaries/kernels/Imag
            e-20000218
     * Running PA-RISC/Linux "recipe":
          + http://thepuffingroup.com/parisc/recipe.html

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id XAA26634
	for <parisc-linux@puffin.external.hp.com>; Wed, 5 Apr 2000 23:31:04 -0600
From: willy@thepuffingroup.com
Received: (from willy@localhost)
	by gin.ext.thepuffingroup.com (8.9.3/8.9.3) id CAA23928
	for parisc-linux@thepuffingroup.com; Thu, 6 Apr 2000 02:31:01 -0400
Date: Thu, 6 Apr 2000 02:31:00 -0400
To: parisc-linux@thepuffingroup.com
Message-ID: <20000406023100.F30107@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Weekly News [31/Mar/2000]
List-ID: <linux-parisc.vger.kernel.org>


PA-RISC/Linux Weekly News - 31st March 2000               vol 2, issue 10
       
   This Week:
       News & Announcements
       Mailing List Descriptions
       This Week's CVS Activity
       State of the Port Summary
       
News & Announcements

     * Puffinfest Fort Collins
            From Saturday 24th of March to Wednesday 29th March, a flock of
            Linux/PARISC developers gathered at the Hewlett-Packard Fort
            Collins site to discuss various issues related to the port.
            We have pictures [http://puffin.external.hp.com/puffinfest/]
     * Linus 2.3.99pre1 merge
            While at the fest, we merged Linus' 2.3.99pre1 tree into our
            tree. Thanks to everyone who participated in the merge. This
            gets us through the softnet merge, which meant we couldn't
            pull later drivers into our tree. Hopefully there won't be
            any further drastic modifications of the internal APIs before
            2.4 is released. pre2 has been unstable for some people and
            pre3 has broken root NFS, so pre1 was as far as we wanted to
            go for the moment.
       
This Week's CVS Activity

     * The bulk of checkins came from the 2.3.99pre1 merge
     * We changed the assembler syntax slightly for compatibility with
       other ELF platforms.
     * Palo received some fixes.
     * The tulip driver from 2.3.99pre3 was pulled into our tree.
     * The glibc porting work continued.
       
State of the Port Summary

     * Kernel
          + based on 2.3.99pre1. Built as ELF.
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
          + ftp://puffin.external.hp.com/pub/parisc/binaries/kernels/
            Image-20000218
     * Running PA-RISC/Linux "recipe":
          + http://thepuffingroup.com/parisc/recipe.html

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA06395
	for <parisc-linux@puffin.external.hp.com>; Sat, 26 Feb 2000 00:07:29 -0700
From: willy@thepuffingroup.com
Received: (from willy@localhost)
	by gin.ext.thepuffingroup.com (8.9.3/8.9.3) id BAA11310
	for parisc-linux@thepuffingroup.com; Sat, 26 Feb 2000 01:08:21 -0500
Date: Sat, 26 Feb 2000 01:08:21 -0500
To: parisc-linux@thepuffingroup.com
Message-ID: <20000226010821.T9944@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Weekly News [2000-02-25]
List-ID: <linux-parisc.vger.kernel.org>


PA-RISC/Linux Weekly News - 25th February 2000

   http://www.thepuffingroup.com/parisc/
       vol 2, issue 6

   This Week:
   News & Announcements
       Status Page
       This Week's CVS Activity
       State of the Port Summary

News & Announcements

     * NFS Root Updated
        Grant updated Martin's NFS root-howto with instructions for
            setting up an HP/UX machine as your NFS server.
     * ELF32 work started
        We're currently playing with ELF32 stuff, trying to get a
            toolchain available to everyone. Once we're happy that the
            toolchain is working well enough, we'll start moving the
            kernel over to ELF.
     * Upcoming non-merge with Linus
        We were planning to merge Linus 2.3.48 into our CVS tree later
            this week, however we've decided to delay until the following
            week to give our tree a chance to settle down with the ELF
            transition and Linus a chance to splat some more
            platform-independent bugs.
     * FAQ
        I've started to maintain a FAQ, referenced from the main webpage.
            It is a little rough for the moment; contributions eagerly
            anticipated.

Status Page
        I'd just like to take this opportunity to remind everyone that we
            have a status page with some unclaimed projects at
            http://www.thepuffingroup.com/parisc/status.html

This Week's CVS Activity
          + More toolchain updates; Matthew checked in a patch to allow
            libgcc1 to build and added the .global directive to gas.
          + We decided to switch to a 16k per-process kernel stack size
            to ensure that we don't have any bugs caused by accidentally
            overrunning the kernel stack. John implemented this.
          + HP/UX compatibility gained a few new syscalls. I guess John
            was bored :-)
          + Grant made the Intel EtherExpress Pro card work.

State of the Port Summary
          + Kernel
               o based on 2.3.42
          + Supported Hardware:
               o SCSI, Lan and PS/2 on Lasi I/O controller
               o Dino PCI controller
               o Elroy PCI controller
               o Tulip ethernet
               o PCNet32 ethernet
               o Intel EEPro ethernet
          + Project Page
               o http://www.thepuffingroup.com/parisc/
          + Latest Workable Image
               o ftp://puffin.external.hp.com/pub/parisc/binaries/kernels
                 /Image-20000218
          + Running PA-RISC/Linux "recipe":
               o http://thepuffingroup.com/parisc/recipe.html

Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA00600
	for <parisc-linux@puffin.external.hp.com>; Fri, 10 Dec 1999 14:24:59 -0700
Received: from methos ([216.208.98.2]) by tomts3-srv.bellnexxia.net
          (InterMail vM.4.01.02.07 201-229-116-107) with ESMTP
          id <19991210212711.YPKO15562.tomts3-srv.bellnexxia.net@methos>
          for <parisc-linux@thepuffingroup.com>;
          Fri, 10 Dec 1999 16:27:11 -0500
Date: Fri, 10 Dec 1999 16:31:37 -0500 (EST)
From: deb <deb@thepuffingroup.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.4.10.9912101629530.1617-100000@methos.thepuffingroup.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] PA-RISC/Linux Weekly News, vol 1, iss 4
List-ID: <linux-parisc.vger.kernel.org>

=============================================
PA-RISC/Linux Weekly News - December 10, 1999
=============================================
  http://www.thepuffingroup.com/parisc/
  vol 1, iss 4 

This Week:
   News & Announcements
   This Week's CVS Activity
   State of the Port Summary
 

====================
News & Announcements
====================
------------------------------------------------
Photos of the Birth of PA-RISC/Linux Discovered!
------------------------------------------------
Once thought lost in the mists of time, a photo revealing the origins of
PA-RISC/Linux have been uncovered by a crack team of
cyberarchaeologists!

This rare and exciting photograph (taken by the forward-thinking
historian, Zach Brown) is now on public display at:

http://www.zabbo.net/showcase98/mallfood.jpg

The photo reveals the attendees of the historic occassion: Jes
Sorensen, Phil Schwan, the back of Travis Melhiser, Chris Beard
(hiding), Alex deVries, and Martin Petersen.  The photo was taken mere
moments after the discussion in which this team of developers realized
that PA-RISC was pretty much the only architecture to which Linux hadn't
yet been ported.  Catering services were provided by a lacklustre
foodcourt in a to-remain-unnamed mall somewhere in Atlanta (during the
Atlanta Linux Showcase, 1998).

-----------
Move to 2.3 
-----------
In order to advance the PA-RISC/Linux port, the development team is
working to move to a more active development tree by merging the current
tree with Linus' 2.3 tree.  Philipp Rumpf and Matthew Wilcox are the
leads for this section of the project.


========================
This Week's CVS Activity
========================

John David Anglin and Paul Bame worked on the command linker, SOM, and
real-mode changes.

The bootable image creation has been modified.

Philip I. Schwan made fixes to the CVS tree so that the revision history
isn't lost during Alex deVries' gsc-to-gecko transition.

Grant Grundler further optimized the build process.

Paul Bame added debug messages to the TLB handler, as well as made
changes so that real mode code is seperately linked into the kernel.


=========================
State of the Port Summary
=========================

Kernel: 
     based on 2.2.13

Supported Machines: 
     most of the A180c, parts of 712 Gecko and 715 workstations
     and portions of 2.0 machines

Supported Hardware: 
     SCSI, Lan and PS/2 on Lasi I/O controller, Dino PCI
     Tulip ethernet

Project Page: 
     http://www.thepuffingroup.com/parisc/

Latest Workable Image:
     ftp://puffin.external.hp.com/pub/parisc/linux-2.2.13.gz

Running PA-RISC/Linux HOWTO:
     http://thepuffingroup.com/parisc/recipe.html

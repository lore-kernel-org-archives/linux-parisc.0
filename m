Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA29367
	for <parisc-linux@puffin.external.hp.com>; Fri, 3 Dec 1999 15:21:34 -0700
Received: from thepuffingroup.com (IDENT:adevries@localhost [127.0.0.1])
	by feather.thepuffingroup.com (8.9.3/8.9.3) with ESMTP id RAA11676
	for <parisc-linux@thepuffingroup.com>; Fri, 3 Dec 1999 17:26:24 -0500
Sender: adevries@thepuffingroup.com
Message-ID: <38484390.32D26BFE@thepuffingroup.com>
Date: Fri, 03 Dec 1999 17:26:24 -0500
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] PA-RISC/Linux Weekly News - December 3, 1999
List-ID: <linux-parisc.vger.kernel.org>

============================================
PA-RISC/Linux Weekly News - December 3, 1999
============================================
  http://www.thepuffingroup.com/parisc/
  vol 1, iss 3

This Week:
   News & Announcements
   This Week's CVS Activity
   State of the Port Summary


====================
News & Announcements
====================

----------------------------
The Quest for PA 2.0 Support
----------------------------
After months of valiant programming efforts from developers around the
globe, Philip Rumpf has started the implementation of a virtual memorty
management system that should work on PA2.0 processors.  This should
enable development of PA2.0 IO infrastructure from noble developers such
as Sir Grant G Grundler and The Imperial Philip Schwan.

-----------
New Puffin!
-----------
Mr. Chris Beard and Mrs. Alex deVries are pleased to announce the
hatching of a new puffling: Matthew Richard Wilcox, weighing in at 85kg.
Mother and child are doing well, in spite of the unusual size of the
newly hatched puffball.

Matthew, once weaned, will be working primarily on PA-RISC/Linux
development efforts, in the Ottawa Ontario puffin burrow (aka: Burrow
#1).

-----------------------
Bremen mini-Puffin-Fest
-----------------------
A miniature Puffin-Fest broke out at the Bremen LinuxTag, featuring such
notable hackers as Alan Cox, Matthew Wilcox, Philipp Rumpf, Martin
Petersen, and Martin Schulze.  A 715/33 was transferred to Philipp, and
some surreptitious hacking occurred behind one of the booths on the show
floor.

-------------------------
PA-RISC Hardware Database
-------------------------

The PA-RISC database is being filled up with machine descriptions.
However, more descriptions are needed.  Please go to
http://www.thepuffingroup.com/parisc/hw.html and add your machines to
the database.  There are more improvements to the database that will
be made soon.  The goal of the PA-RISC database is to catalogue the
different possible machine configurations and the hardware that they
contain.  This information will be used to determine if a specific
machine is supported with Linux and what device drivers are needed.

========================
This Week's CVS Activity
========================

Paul Bame has fixed some problems with memcpy in real mode.

Philipp Rumpf has replaced the block TLB handler with a basic TLB insert
handler.

Philipp has also rearranged some of the real mode handling.

=========================
State of the Port Summary
=========================

Kernel:
     based on 2.2.13

Supported Machines:
     most of the A180c, parts of 712 Gecko and 715 workstations

Supported Hardware:
     SCSI, Lan and PS/2 on Lasi I/O controller, Dino PCI
     Tulip ethernet

Project Page:
     http://www.thepuffingroup.com/parisc/

Latest Workable Image:
     ftp://puffin.external.hp.com/pub/parisc/linux-2.2.13.gz

Running PA-RISC/Linux HOWTO:
     http://thepuffingroup.com/parisc/recipe.html

-- 
Alex deVries
Vice President of Engineering
The Puffin Group

Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id OAA01220
	for <parisc-linux@puffin.external.hp.com>; Fri, 26 Nov 1999 14:05:25 -0700
Received: from thepuffingroup.com (IDENT:adevries@localhost [127.0.0.1])
	by feather.thepuffingroup.com (8.9.3/8.9.3) with ESMTP id QAA05680
	for <parisc-linux@thepuffingroup.com>; Fri, 26 Nov 1999 16:08:46 -0500
Sender: adevries@thepuffingroup.com
Message-ID: <383EF6DD.8B4D77F6@thepuffingroup.com>
Date: Fri, 26 Nov 1999 16:08:45 -0500
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] PA-RISC/Linux Weekly News - November 25, 1999
List-ID: <linux-parisc.vger.kernel.org>

=============================================
 PA-RISC/Linux Weekly News - November 25, 1999
=============================================
   http://www.thepuffingroup.com/parisc/
   vol 1, iss 2
 
 This Week:
   News & Announcements
   PA-RISC/Linux Developer Profile
      David Kennedy
   State of the Port Summary
   This Week's CVS Activity


====================
News & Announcements
====================
--------------------------------
PA-RISC/Linux Bonsai now online!
--------------------------------
The Puffin Group has implemented a Bonsai system for the PA-RISC/Linux
porting project.  Bonsai is a query interface to the CVS source
repository, which you can access through:

   http://puffin.external.hp.com/bonsai/rview.cgi.
 
----------------------------------------
Hewlett-Packard releases SOM linker code
---------------------------------------
Hewlett-Packard, in co-operation with The Puffin Group, is releasing the
source code to its SOM linker product. This release is an important step
in the project to port Linux to the PA-RISC architecture, as it will
eventually allow developers to more easily test their work.

32-bit versions of the HP/UX operating system use a proprietary SOM
(Spectrum Object Model) binary format to load executables, making it a
natural choice as an object format for early PA-RISC/Linux. Until now,
there was no way to generate a SOM binary except by using HP/UX tools,
which prevented developers from building on any other platform. Once the
port of the linker is complete, developers will be able to build from a
variety of platforms, taking advantage of more computing power, and
reducing the amount of time that it takes to test new code.

Hewlett-Packard, adding to their extensive list of Linux-related
projects, has made the linker available under the GNU General Public
License, making it freely modifiable and redistributable. However,
though Hewlett-Packard encourages developers to extend and port their
linker, they do not guarantee that community modifications will be
re-integrated into their official product.

Although the linker does not yet produce functional binaries, developers
and curious hackers are invited to browse the source and commit patches.
HP's official release, as well as future snapshots, can be obtained via
FTP from ftp://puffin.external.hp.com/pub/parisc/linker, or from the
Puffin Group's CVS server.  More information regarding CVS can be found
at http://www.thepuffingroup.com/parisc/cvs.html.  Questions about the
SOM linker can be directed to linker-info@thepuffingroup.com.

---------------------------------------------
PA-RISC/Linux Hardware Database now available
---------------------------------------------
To help developers solve the eternal "will this box run Linux?"
question, The Puffin Group has made available a database of PA-RISC
hardware.  This database describes the different hardware and machine
configurations that are available.

Testers are encouraged to add their own hardware information to the
database:

   http://www.thepuffingroup.com/parisc/hw.html

--------------------------------------------------------
Linux developers get L2000 machine for PA2.0 development
--------------------------------------------------------
In order to further development of Linux on PA2.0 hardware, The Puffin
Group accepted deliver of an L2000 HP system that will be shared for
PA-RISC/Linux development work.

------------------------------------
PA-RISC/Linux Hackers invade Bremen!
------------------------------------
Perhaps "invade" is a bit strong a word for it, but Alan Cox, Matthew
Wilcox, Martin Petersen, and Philip Rumpf are all going to be at the
LinuxTag conference in Bremen this weekend.  There's a good chance that
some random hacking could erupt, as Matthew is apparently taking his 715
with him on the trip, single-handedly redefining the whole concept of a
"portable computer".  The conference page is here:

   http://linux.inbremen.de

========================
This Week's CVS Activity
========================

Alan Cox merged in the kernel 2.2.12 UFS changes.

Phillip Rumpf made numerous changes to cache code.

Grant Grundler improved the build system through a variety of fixes.
 
===============================
PA-RISC/Linux Developer Profile
===============================
This week's profile: Dave Kennedy (who, yesterday, celebrated his 23rd
birthday.  Happy Birthday, Spud! :)

David "Spud" Kennedy
--------------------
Email: dkennedy@thepuffingroup.com
Homepage: http://www.engsoc.carleton.ca/~dkennedy
Favourite colour: blue
Current age: 23
Current location: Ottawa, Canada

Q:  What's your current workplace/job:

DLK: Senior Linux Consultant at The Puffin Group.

Q:  Why did you decide to contribute to the PA-RISC/Linux porting
project?

DLK: We have a lot of cool hardware lying around The Puffin Group
offices, and I would just like to see Linux running on it.

Q:  What parts of the port have you worked on so far?

DLK: Hardware detection code, some SCSI stuff.

Q:  What do you think is your most significant contribution to date?

DLK: I brought Grant Grundler coffee once.

Q:  What bits of the port are you interested in working on the the
future?

DLK: Probably some memory management stuff.

As an aside, it should also be known that Dave also developed the
backend to the new PA-RISC/Linux Hardware Database (see "News &
Announcements" above.

=========================
State of the Port Summary
=========================

Kernel:
     based on 2.2.13

Supported Machines:
     most of the A180c, parts of 712 Gecko workstations

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

Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id QAA27262
	for <parisc-linux@puffin.external.hp.com>; Fri, 19 Nov 1999 16:03:55 -0700
Received: from thepuffingroup.com (IDENT:adevries@localhost [127.0.0.1])
	by feather.thepuffingroup.com (8.9.3/8.9.3) with ESMTP id SAA02749
	for <parisc-linux@thepuffingroup.com>; Fri, 19 Nov 1999 18:06:48 -0500
Sender: adevries@thepuffingroup.com
Message-ID: <3835D808.18274C86@thepuffingroup.com>
Date: Fri, 19 Nov 1999 18:06:48 -0500
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] HP open sourcing the SOM linker
List-ID: <linux-parisc.vger.kernel.org>


Hewlett-Packard, in co-operation with the Puffin Group, is open sourcing
their SOM linker product.  This release is an important step in the
project to port Linux to the PA-RISC architecture, as it will eventually
allow developers to more easily test their work.

32-bit versions of the HP/UX operating system use a proprietary SOM
(Spectrum Object Model) binary format to load executables, making it a
natural choice as an object format for early PA-RISC/Linux.  Until
now, there was no way to generate a SOM binary except by using HP/UX
tools, which prevented developers from building on any other platform.
Once the port of the linker is complete, developers will be able to
build from a variety of platforms, taking advantage of more computing
power, and reducing the amount of time that it takes to test new code.

Hewlett-Packard, adding to their extensive list of Linux-related
projects, has made the linker available under the GNU General Public
License, making it freely modifiable and redistributable.  However,
though Hewlett-Packard encourages developers to extend and port their
linker, they do not guarantee that community modifications will be
re-integrated into their official product.

Although the linker does not yet produce functional binaries,
developers and curious hackers are invited to browse the source and
commit patches.  HP's official release, as well as future snapshots,
can be obtained via FTP from
ftp://puffin.external.hp.com/pub/parisc/linker, or from the Puffin
Group's CVS server.  More information regarding CVS can be found at
http://www.thepuffingroup.com/parisc/cvs.html.  Questions about the
SOM linker can be directed to linker-info@thepuffingroup.com.

- Alex

-- 
Alex deVries
Vice President of Engineering
The Puffin Group

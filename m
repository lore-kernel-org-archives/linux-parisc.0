Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA19616
	for <parisc-linux@puffin.external.hp.com>; Tue, 25 Jan 2000 19:16:09 -0700
Received: from unknown (HELO smtp.linuxcare.com) (216.88.157.131)
  by mailserv2.iuinc.com with SMTP; 26 Jan 2000 01:17:00 -0000
Received: from unknown (HELO boilermaker.thepuffingroup.com) (216.208.98.2)
  by smtp.linuxcare.com with SMTP; 26 Jan 2000 01:21:34 -0000
Date: Tue, 25 Jan 2000 20:23:57 -0500 (EST)
From: "Dave O'Neill" <doneill@linuxcare.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.4.10.10001252013090.14868-100000@boilermaker.thepuffingroup.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] SOM Linker Status
List-ID: <linux-parisc.vger.kernel.org>


The SOM linker now compiles and runs on HPUX.  I've only tested it against
itself, but it can link its object files into a linker that can be used to
link its own object files, which...  you get the point.   I'll hit it with
more exhaustive tests later, but it seems to be OK at this point.  The
working code is in CVS.

To get it running on x86, I'm still tackling the byteorder issues that pop
up.  The only troublesome part of this is the huge number of bitfields
that get read from the object files as a stream of characters directly
into various structs.  There don't seem to be any more serious issues on
x86, though, so it shouldn't be long before we have a working SOM linker.

Dave
-- 
Dave O'Neill, Senior Linux Consultant, Linuxcare, Inc.
doneill@linuxcare.com, http://www.linuxcare.com/
Linuxcare. At the center of Linux.

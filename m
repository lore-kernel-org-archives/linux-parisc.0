Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA25568
	for <parisc-linux@puffin.external.hp.com>; Thu, 9 Mar 2000 18:34:23 -0700
Received: (from ncc@localhost)
	by ariadne.cs.mcgill.ca (8.9.3/8.9.3/Debian/GNU) id TAA03487
	for parisc-linux@thepuffingroup.com; Thu, 9 Mar 2000 19:35:36 -0500
Message-ID: <20000309193535.C3423@cs.mcgill.ca>
Date: Thu, 9 Mar 2000 19:35:35 -0500
From: Nick Cabatoff <ncc@cs.mcgill.ca>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] HFS linux implementation
List-ID: <linux-parisc.vger.kernel.org>

(I sent this to Alex deVries and didn't get a response, so I figured I'd
give this list a try instead.)

I'm interested in the possibility of doing a linux module to mount HFS
filesystems (read-only would satisfy me I think, and is a reasonable
target.)  

I realize that the port is still in its very early stages, so
I intend to develop the module on the i386 platform and then worry
about getting it working on pa-risc.

I'm hoping you can tell me

- if anyone else is already working on this

- if you think the man pages and the white paper might be insufficient
  for the implementation; they look adequate to me, but I've never
  written a file-system driver before

- if you think it's worth the effort, given that I expect HP-UX systems
  are using LVM now and I don't feel up to the task of trying to handle
  that

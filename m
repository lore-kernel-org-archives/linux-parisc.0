Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA30346
	for <parisc-linux@puffin.external.hp.com>; Tue, 10 Oct 2000 09:45:52 -0600
Received: from hpfrcu03.france.hp.com (hpfrcu03.france.hp.com [15.129.16.51])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id AEB9C1B90E
	for <parisc-linux@thepuffingroup.com>; Tue, 10 Oct 2000 17:46:57 +0200 (METDST)
Received: from admin.france.hp.com (ssdpc48.france.hp.com [15.129.234.2]) by hpfrcu03.france.hp.com with ESMTP (8.7.6/8.7.3 SMKit7.02) id RAA25234 for <parisc-linux@thepuffingroup.com>; Tue, 10 Oct 2000 17:46:05 +0200 (METDST)
Sender: vidal@hpfrcu03.france.hp.com
Message-ID: <39E338E5.4ED45E2B@admin.france.hp.com>
Date: Tue, 10 Oct 2000 17:42:29 +0200
From: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
MIME-Version: 1.0
To: "parisc-linux@thepuffingroup.com" <parisc-linux@thepuffingroup.com>
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Unable to compil linux kernel
List-ID: <linux-parisc.vger.kernel.org>

	Hi
I succeded to recompile all tools needed for compiling linux kernel.
(the problem was only that I was using the wrong target type).
But I've have a strange problem while compiling (I perhaps made a mistake somewhere):
#pwd
/opt/linux_hppa/src/linux/drivers/char

#type gcc
gcc is hashed (/opt/linux_hppa/hppa-linux/bin/gcc)
 
#file /opt/linux_hppa/hppa-linux/bin/gcc
/opt/linux_hppa/hppa-linux/bin/gcc:     PA-RISC1.1 shared executable dynamically linked -not stripped 

#gcc --version
2.96

while the "make palo":
#gcc -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -o conmakehash conmakehash.c
/opt/linux_hppa/lib/gcc-lib/hppa-linux/2.96/../../../../hppa-linux/bin/ld: cannot find -lc
collect2: ld returned 1 exit status
-> that the problem, where this "-lc" comes from ???

#/opt/linux_hppa/lib/gcc-lib/hppa-linux/2.96/../../../../hppa-linux/bin/ld --version
GNU ld 2.10.91
Copyright 2000 Free Software Foundation, Inc.
This program is free software; you may redistribute it under the terms of
the GNU General Public License.  This program has absolutely no warranty.
  Supported emulations:
   hppalinux

	Thanks 


-- 
	Vidal Bruno, (770-4271)
        SSD-HA Team, HP-UX & LINUX Support
	bruno_vidal@admin.france.hp.com

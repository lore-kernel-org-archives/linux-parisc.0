Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA17585
	for <parisc-linux@puffin.external.hp.com>; Tue, 17 Oct 2000 02:37:21 -0600
Received: from hpfrcu03.france.hp.com (hpfrcu03.france.hp.com [15.129.16.51])
	by bbnrel4.net.external.hp.com (Postfix) with ESMTP id 61E101CFD2
	for <parisc-linux@thepuffingroup.com>; Tue, 17 Oct 2000 10:38:37 +0200 (METDST)
Received: from admin.france.hp.com (ssdpc48.france.hp.com [15.129.234.2]) by hpfrcu03.france.hp.com with ESMTP (8.7.6/8.7.3 SMKit7.02) id KAA11513 for <parisc-linux@thepuffingroup.com>; Tue, 17 Oct 2000 10:37:44 +0200 (METDST)
Sender: vidal@hpfrcu03.france.hp.com
Message-ID: <39EC0F06.4C908926@admin.france.hp.com>
Date: Tue, 17 Oct 2000 10:34:14 +0200
From: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
MIME-Version: 1.0
To: "parisc-linux@thepuffingroup.com" <parisc-linux@thepuffingroup.com>
Subject: Re: [parisc-linux] Troubles following the 'recipe'
References: <Pine.LNX.4.21.0010162159040.27337-100000@front.linuxcare.com.au>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

	Hi
I try to completly rebuild chaintool with the last recipe. It works much more
better than the last time I try to build it. I still have some trouble with building
glibc with includes (but it's okay, I'm able to correct it). The compilation is okay,
but in the make install:
.././scripts/install-sh -c /opt/linux_hppa/src/build/glibc/elf/ld.so /opt/linux/hppa-linux/lib/ld-2.1.92.so.new
mv -f /opt/linux/hppa-linux/lib/ld-2.1.92.so.new /opt/linux/hppa-linux/lib/ld-2.1.92.so
make[2]: *** No rule to make target `/opt/linux/hppa-linux/lib/libc-2.1.92.so', needed by `/opt/linux/hppa-linux/lib/ld.so.1'.  Stop.
 
I'm not very proficient with makefiles, and I'm not able to debug this one.
The libc has been correctly build:
#ll /opt/linux_hppa/src/build/glibc/libc.so
-rwxr-xr-x   1 root       sys        4465666 Oct 17 10:05 /opt/linux_hppa/src/build/glibc/libc.so
#file /opt/linux_hppa/src/build/glibc/libc.so
/opt/linux_hppa/src/build/glibc/libc.so:        ELF-32 shared object file - PA-RISC 
#strings /opt/linux_hppa/src/build/glibc/libc.so | grep 2.1.92
2.1.92
GNU C Library development release version 2.1.92, by Roland McGrath et al.

And "ld" looks good to, and have been succesfully installed just before this error.


So, all looks okay, but makefile for install stuff seems to be wrong.
Do you have any clue ?

	Thanks.
-- 
	Vidal Bruno, (770-4271)
        SSD-HA Team, HP-UX & LINUX Support
	bruno_vidal@admin.france.hp.com

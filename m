Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA26033
	for <parisc-linux@puffin.external.hp.com>; Tue, 17 Oct 2000 14:36:46 -0600
Received: from ottawa.linuxcare.com (HELO tarwebok) (216.208.98.2)
  by mailserv2.iuinc.com with SMTP; 17 Oct 2000 20:37:59 -0000
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@thepuffingroup.com
From: David Huggins-Daines <dhd@linuxcare.com>
Date: 17 Oct 2000 16:38:02 -0400
Message-ID: <87r95f2ogl.fsf@linuxcare.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] problems with binutils and/or g++
List-ID: <linux-parisc.vger.kernel.org>

Hi,

With current binutils (as of Oct. 13) and GCC, I get the following
error when building APT:

../build/obj/cmdline/apt-get.o: In function `global destructors keyed to c0out':
/home/build/apt-0.3.19/cmdline/apt-get.cc:1429: undefined reference to `pkgArchiveCleaner type_info function'
/usr/bin/ld: ../build/obj/cmdline/apt-get.o(.gnu.linkonce.t.__tf10LogCleaner+0x1c): cannot find stub entry 00000010___tf17pkgArchiveCleaner+0
/usr/bin/ld: ../build/obj/cmdline/apt-get.o(.gnu.linkonce.t.__tf10LogCleaner+0x1c): cannot handle R_PARISC_PCREL17F for pkgArchiveCleaner type_info function
/home/build/apt-0.3.19/cmdline/apt-get.cc:1429: undefined reference to `pkgArchiveCleaner type_info node'
/home/build/apt-0.3.19/cmdline/apt-get.cc:1429: undefined reference to `pkgArchiveCleaner type_info node'

I'm not sure if this is a g++ or linker bug.  The symbol names look
really suspicious, suggesting that it might be a bug in RTTI (I'll try
recompiling with -fno-rtti, as I don't think APT uses it).  But on the
other hand we've had problems with link-once sections in the past.

Any thoughts?

-- 
dhd@linuxcare.com, http://www.linuxcare.com/
Linuxcare. Support for the revolution.

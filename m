From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: binutils change break glibc build
Date: Wed, 16 Feb 2011 19:30:33 -0500
Message-ID: <20110217003032.GA26155@hiauly1.hia.nrc.ca>
References: <20110210170033.4317E4ED8@hiauly1.hia.nrc.ca> <20110210200044.203164E01@hiauly1.hia.nrc.ca> <20110212161846.GA24076@hiauly1.hia.nrc.ca> <20110213193934.GA28834@hiauly1.hia.nrc.ca> <20110215015852.GA6615@hiauly1.hia.nrc.ca> <AANLkTimZntmJQ5msVr56=V7P8pYGXizpVGinZYrvBsSt@mail.gmail.com>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	James.Bottomley@hansenpartnership.com, linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <AANLkTimZntmJQ5msVr56=V7P8pYGXizpVGinZYrvBsSt@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Carlos,

I would like to apply the following binutils change to align data
segments to a page boundary.  However, it breaks building glibc.
Problem occurs in call_init trying to run constructors for new
libc.so.6.

Any thoughts?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

Index: emulparams/hppalinux.sh
===================================================================
RCS file: /cvs/src/src/ld/emulparams/hppalinux.sh,v
retrieving revision 1.14
diff -u -3 -p -r1.14 hppalinux.sh
--- emulparams/hppalinux.sh	22 Oct 2008 05:20:44 -0000	1.14
+++ emulparams/hppalinux.sh	15 Feb 2011 14:30:24 -0000
@@ -8,6 +8,8 @@ NO_REL_RELOCS=yes
 TEXT_START_ADDR=0x10000
 TARGET_PAGE_SIZE=0x10000
 MAXPAGESIZE="CONSTANT (MAXPAGESIZE)"
+DATA_ADDR="ALIGN(${MAXPAGESIZE})"
+SHLIB_DATA_ADDR="ALIGN(${MAXPAGESIZE})"
 ARCH=hppa
 MACHINE=hppa1.1    # We use 1.1 specific features.
 NOP=0x08000240

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA21956
	for <parisc-linux@puffin.external.hp.com>; Thu, 31 Aug 2000 11:28:49 -0600
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: JSO@europay.com (=?iso-8859-1?Q?SOETE_Jo=EBl?=),
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] FW: hpux 11.00 near success 
In-Reply-To: Your message of "Thu, 31 Aug 2000 13:19:11 EDT."
             <200008311719.NAA26316@hiauly1.hia.nrc.ca>
References: <200008311719.NAA26316@hiauly1.hia.nrc.ca> 
Date: Thu, 31 Aug 2000 11:28:57 -0600
From: Paul Bame <bame@noam.fc.hp.com>
Message-Id: <E13UY93-0005Q3-00@noam.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= > hppa-linux-gcc -g -O -I../include -I../lib -I../../linux-2.3/include  -o
= > palo diskpart.o    elf64.o	    load.o	  paloio.o      som.o
= > elf32.o	      error.o	    palo.o build.o
= > /opt/puffin/lib/gcc-lib/hppa1.1-linux/2.96/../../../../hppa1.1-linux/bin/ld
:
= > cannot open crt1.o: No such file or directory
= 
= I wonder why this isn't crt0.o?  The startup file is set by the specs file
= in /opt/puffin/lib/gcc-lib/hppa1.1-linux/2.96.  It is also internal to
= gcc.  The SPECS configuration files for the pa port are in config/pa.

I see two bizzare things.  The first is that 'hppa1.1-linux' is being
used, which is a very old convention.  The palo makefile hasn't asked
for that for a long time.

Secondly, the error suggests that an old tool chain,
or a new one built to the old recipe (without glibc etc...) is being used.

I recommend using a new tool chain.  Unfortunately we don't have
pre-compiled binaries for HPUX so you'll have to build it, which can
be VERY PAINFUL (be sure to get the LATEST version of GNU make).  The recipe
to use is in CVS under build-tools.  Make sure your palo bits are up
to date too...

Good luck!

	-P

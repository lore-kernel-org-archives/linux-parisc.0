Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id LAA21716
	for <parisc-linux@puffin.external.hp.com>; Thu, 31 Aug 2000 11:19:15 -0600
Message-Id: <200008311719.NAA26316@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] FW: hpux 11.00 near success
To: JSO@europay.com (=?iso-8859-1?Q?SOETE_Jo=EBl?=)
Date: Thu, 31 Aug 2000 13:19:11 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
In-Reply-To: <A4A5E4C468B5D11190220001FA6835DD04DD86B9@epixch003> from "=?iso-8859-1?Q?SOETE_Jo=EBl?=" at Aug 31, 2000 06:59:20 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> hppa-linux-gcc -g -O -I../include -I../lib -I../../linux-2.3/include  -o
> palo diskpart.o    elf64.o	    load.o	  paloio.o      som.o
> elf32.o	      error.o	    palo.o build.o
> /opt/puffin/lib/gcc-lib/hppa1.1-linux/2.96/../../../../hppa1.1-linux/bin/ld:
> cannot open crt1.o: No such file or directory

I wonder why this isn't crt0.o?  The startup file is set by the specs file
in /opt/puffin/lib/gcc-lib/hppa1.1-linux/2.96.  It is also internal to
gcc.  The SPECS configuration files for the pa port are in config/pa.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

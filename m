Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id BAA05795
	for <parisc-linux@puffin.external.hp.com>; Fri, 1 Sep 2000 01:49:57 -0600
Message-ID: <A4A5E4C468B5D11190220001FA6835DD04DD86BA@epixch003>
From: =?iso-8859-1?Q?SOETE_Jo=EBl?= <JSO@europay.com>
To: "'Paul Bame'" <bame@noam.fc.hp.com>,
        John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@thepuffingroup.com
Subject: RE: [parisc-linux] FW: hpux 11.00 near success 
Date: Fri, 1 Sep 2000 09:50:45 +0200 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Hi John,

> -----Original Message-----
> From: Paul Bame [mailto:bame@noam.fc.hp.com]
> Sent: Thursday, August 31, 2000 7:29 PM
> To: John David Anglin
> Cc: JSO@europay.com; parisc-linux@thepuffingroup.com
> Subject: Re: [parisc-linux] FW: hpux 11.00 near success 
> 
> 
> = > hppa-linux-gcc -g -O -I../include -I../lib 
> -I../../linux-2.3/include  -o
> = > palo diskpart.o    elf64.o	    load.o	  
> paloio.o      som.o
> = > elf32.o	      error.o	    palo.o build.o
> = > 
> /opt/puffin/lib/gcc-lib/hppa1.1-linux/2.96/../../../../hppa1.1
> -linux/bin/ld
> :
> = > cannot open crt1.o: No such file or directory
> = 
> = I wonder why this isn't crt0.o?  The startup file is set by 
> the specs file
> = in /opt/puffin/lib/gcc-lib/hppa1.1-linux/2.96.  It is also 
> internal to
> = gcc.  The SPECS configuration files for the pa port are in 
> config/pa.
> 
> I see two bizzare things.  The first is that 'hppa1.1-linux' is being

I also try to rebuild tool chain with host=hppa-hpux as recommended in the
recipe html page but it failed:
not supported platform ... ? But as I just read recipe.hpux (and
recipe.linux) I just note that host is not anymore specified. Is it perhaps
the mistake? I will advise asap.

> used, which is a very old convention.  The palo makefile hasn't asked
> for that for a long time.
> 
> Secondly, the error suggests that an old tool chain,
> or a new one built to the old recipe (without glibc etc...)
> is being used.

But glibc is not build with recipe.hpux neither recipe.linux also may I
assume that I have to use same configure options ?

> 
> I recommend using a new tool chain.  Unfortunately we don't have

The tool chain which I just reach to rebuild successfully was date 20000829
as well as palo?

> pre-compiled binaries for HPUX so you'll have to build it, which can

I would also prefer to work on a Linux box (that why I try to build it) but
it is too difficult to obtain it.
 
> be VERY PAINFUL (be sure to get the LATEST version of GNU 
> make).  The recipe

The GNU make release is 3.79. Is that exist a new one?

> to use is in CVS under build-tools.  Make sure your palo bits are up
> to date too...
> 
> Good luck!
> 
> 	-P
> 

Thank for advises,
	Joel


**********************************************************************
This e-mail and any attachments to it may contain confidential information which is strictly intended for the use of the authorised recipient.  If you have received this e-mail in error, please delete it and notify the sender by replying to this e-mail.
Thank you for your co-operation.
**********************************************************************

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA30241
	for <parisc-linux@puffin.external.hp.com>; Sun, 5 Nov 2000 00:40:18 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 5 Nov 2000 07:42:05 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id SAA04874;
	Sun, 5 Nov 2000 18:41:55 +1100
Date: Sun, 5 Nov 2000 18:41:54 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Bdale Garbee <bdale@gag.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] compiler bug?
In-Reply-To: <20001105061629.9FF2835E20@rover.gag.com>
Message-ID: <Pine.LNX.4.21.0011051831170.2082-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sat, 4 Nov 2000, Bdale Garbee wrote:

> Hacking the makefiles to remove "-O -O2" allows the compile to complete 
> cleanly.  

glibc includes are "smart", and do things like `#if defined __OPTIMIZE__'

> I assume this means something in the compiler is broken?

No, I think it's a problem with glibc, or perhaps just your include files.

> bdale@j5k:/space/debian/util-linux-2.10o/fdisk $ cc -c -O -O2 -fomit-frame-pointer -I../lib -Wall -Wmissing-prototypes -Wstrict-prototypes -DNCH=1  -DSBINDIR=\"/sbin\" -DUSRSBINDIR=\"/usr/sbin\" -DLOGDIR=\"/var/log\" -DVARPATH=\"/var\" -DLOCALEDIR=\"/usr/share/locale\" fdiskbsdlabel.c -o fdiskbsdlabel.o
> /usr/include/linux/string.h:12: parse error before "__extension__"

Your .i file had this in it:

extern char * ___strtok;
extern char * __extension__ ({ char __a0, __a1, __a2; [rest snipped]

which comes from linux/string.h

extern char * ___strtok;
extern char * strcpy(char *,const char *);

The problem being that strcpy is being replaced with an inline
expansion.  Dunno why this is happenning.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.

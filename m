Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id VAA16234
	for <parisc-linux@puffin.external.hp.com>; Wed, 25 Oct 2000 21:26:20 -0600
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 26 Oct 2000 03:27:51 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id OAA05559;
	Thu, 26 Oct 2000 14:27:44 +1100
Date: Thu, 26 Oct 2000 14:27:44 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Kailashnath V Rampure <kailasr@webcash.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] glibc problem
In-Reply-To: <5.0.0.25.0.20001025173830.00a64a30@mail.webcash.com>
Message-ID: <Pine.LNX.4.21.0010261402360.31251-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 25 Oct 2000, Kailashnath V Rampure wrote:

> Hi
> 
> I have upgraded to GNU Make version 3.79.1 but when i run make its is 
> giving following error:
> 
> Regards
> Kailas
> 
> hppa-linux-gcc -nostdlib -nostartfiles -r -o /opt/hp/build/glibc/csu/crt1.o 
> /opt/hp/build/glibc/csu/start.o /opt/hp/build/glibc/csu/abi-note.o 
> /opt/hp/build/glibc/csu/init.o
> hppa-linux-gcc -nostdlib -nostartfiles -r -o 
> /opt/hp/build/glibc/csu/gcrt1.o /opt/hp/build/glibc/csu/crt1.o 
> /opt/hp/build/glibc/csu/gmon-start.o
> cp /dev/null /opt/hp/build/glibc/csu/Mcrt1.c

Hmm, my make.log shows a difference here.  I have echo > ...Mcrt1.c, which
creates a 1 byte dummy file rather than the zero byte file you get from cp
/dev/null.  Bombing on an empty input file is a known gcc bug for the
snapshot we took of the Cygnus development gcc sources.

I suggest you update your glibc sources.

-- 
Linuxcare.  Support for the Revolution.

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA02084
	for <parisc-linux@puffin.external.hp.com>; Thu, 26 Oct 2000 15:13:48 -0600
To: Kailashnath V Rampure <kailasr@webcash.com>
Cc: Alan Modra <alan@linuxcare.com.au>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] glibc problem 
In-Reply-To: Message from Kailashnath V Rampure <kailasr@webcash.com>
   of "Thu, 26 Oct 2000 12:56:47 PDT." <5.0.0.25.0.20001026125217.00a43eb0@mail.webcash.com>
References: <5.0.0.25.0.20001025173830.00a64a30@mail.webcash.com>  
 <5.0.0.25.0.20001026125217.00a43eb0@mail.webcash.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 26 Oct 2000 15:16:59 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20001026211700.EE22A38137@carmen.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>


> I did upgrade to latest glibc from the cvs and tried I still get the same 
> error. Actually I restarted from scratch starting from binutils. I have 
> seen some warning while I built gcc. The smallpart of gcc warnings are as 
> follows:
[snip]
> /usr/include/bits/string2.h: In function `__stpcpy_small':
> In file included from /usr/include/string.h:346,
>                   from /opt/hp/gcc/gcc/system.h:176,
>                   from /opt/hp/gcc/gcc/explow.c:24:
> /usr/include/bits/string2.h:611: warning: pointer targets in return differ 

I don't think you want to be using the system includes. Perhaps you need to be 
using the --with-headers= option and point it at your include directory. You 
can get an include tarball from,

ftp://puffin.external.hp.com/pub/parisc/src/include-latest.tar.gz

Unless you really want to hack the toolchain I would recommend the prebuilt 
cross-compiler available at,

ftp://puffin.external.hp.com/pub/parisc/binaries/LinuxX86/xc-latest.tar.gz

If you *do* want to hack the toolchain the build-tools cvs module has several 
scripts that can help you with building.

-- 
Matt Taggart
taggart@fc.hp.com

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.umr.edu (mrelay.cc.umr.edu [131.151.1.89])
	by dsl2.external.hp.com (Postfix) with ESMTP id 83D8D49F9
	for <parisc-linux@lists.parisc-linux.org>; Fri, 28 Sep 2001 14:44:08 -0600 (MDT)
Message-ID: <6CAC36C3427CEB45A4A6DF0FBDABA56D86D7F5@umr-mail03.cc.umr.edu>
From: "Neulinger, Nathan" <nneul@umr.edu>
To: 
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Date: Fri, 28 Sep 2001 15:43:50 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
Subject: [parisc-linux] RE: Where to get recent parisc kernels w/o building?
List-ID: <linux-parisc.vger.kernel.org>

Never mind on the gcc problem... figured out I didn't have libc6-dev
installed. (Not quite used to debian yet.)

-- Nathan

> -----Original Message-----
> From: Neulinger, Nathan 
> Sent: Friday, September 28, 2001 3:38 PM
> Cc: parisc-linux@lists.parisc-linux.org
> Subject: Where to get recent parisc kernels w/o building?
> 
> 
> Is there any convenient place to grab a 2.4.9 (or more 
> recent) vmlinux for parisc-linux other than getting it myself 
> out of cvs? (Don't have a functional build environment at the moment.)
> 
> Also, what about a working gcc? I've apt-get upgrade'd 
> everything, and gcc complains about lots of header file 
> goofiness when compiling even a simple hello world program.
> 
> Also, does the kernel build have to be done cross-compile, or 
> can it be built on the parisc-linux machine itself?
> 
> -- Nathan
> 

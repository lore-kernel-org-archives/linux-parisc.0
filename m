Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.umr.edu (mrelay.cc.umr.edu [131.151.1.89])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6A8A64895
	for <parisc-linux@lists.parisc-linux.org>; Mon,  1 Oct 2001 07:32:48 -0600 (MDT)
Message-ID: <6CAC36C3427CEB45A4A6DF0FBDABA56D86D7F8@umr-mail03.cc.umr.edu>
From: "Neulinger, Nathan" <nneul@umr.edu>
To: "'Matthew Wilcox'" <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] Status of hp-ux binary compatibility?
Date: Mon, 1 Oct 2001 08:31:07 -0500 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

In particular - flexlm. 

We have a ton of licensed products served off an old 715, and relicensing
them to move the license server will be a nightmare. What I'd like to do is
run the lmgrd+vendor-daemon on a parisc-linux box and modload a syscall
replacement that lies about the hostid to this process.

But for testing, I've just tried very simple programs - cal, yes, echo, and
a staticly linked hello world. All of them segfault right after execution. 

As far as I know, the only system calls out of the ordinary the flexlm stuff
should use are file locking and perhaps some of the ioctl stuff for getting
interface address, but I figured on tracing to find out exactly what it's
doing. 

-- Nathan

> -----Original Message-----
> From: Matthew Wilcox [mailto:willy@debian.org]
> Sent: Monday, October 01, 2001 8:26 AM
> To: Nathan Neulinger
> Cc: Matthew Wilcox; parisc-linux@lists.parisc-linux.org
> Subject: Re: [parisc-linux] Status of hp-ux binary compatibility?
> 
> 
> On Mon, Oct 01, 2001 at 07:47:45AM -0500, Nathan Neulinger wrote:
> > Yuck... That'd be most unfortunate since that is the 
> primary reason I'm
> > looking at parisc-linux at the moment.
> 
> what application specifically are you looking at running?  We 
> only ever
> implemented a few of the hundreds of hpux syscalls.
> 
> -- 
> Revolutions do not require corporate support.
> 

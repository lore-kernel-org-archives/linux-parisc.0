Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.umr.edu (mrelay.cc.umr.edu [131.151.1.89])
	by dsl2.external.hp.com (Postfix) with ESMTP id 201614838
	for <parisc-linux@lists.parisc-linux.org>; Mon,  1 Oct 2001 08:44:13 -0600 (MDT)
Message-ID: <6CAC36C3427CEB45A4A6DF0FBDABA56D86D7FC@umr-mail03.cc.umr.edu>
From: "Neulinger, Nathan" <nneul@umr.edu>
To: "'John Marvin'" <jsm@udlkern.fc.hp.com>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Date: Mon, 1 Oct 2001 09:43:16 -0500 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
Subject: [parisc-linux] RE: Status of hp-ux binary compatibility?
List-ID: <linux-parisc.vger.kernel.org>


> -----Original Message-----
> From: John Marvin [mailto:jsm@udlkern.fc.hp.com]
> Sent: Monday, October 01, 2001 9:36 AM
> To: nneul@umr.edu
> Cc: parisc-linux@lists.parisc-linux.org
> Subject: Re: Status of hp-ux binary compatibility?
> 
> 
> Nathan,
> 
> hp-ux compatibility is definitely broken. It probably 
> wouldn't take too
> much effort to get it back to where it was before, however the best we
> ever did was to run some simple text based programs that were linked
> archive (-Wl,-aarchive). We didn't even have shared libraries working.

Would "gcc -static" be sufficient? Oh... no shared libs either? ick. I
suppose that means that anything linked against /usr/lib/libc.1 won't work.
Bummer. 

Y'all might want to clarify the FAQ, cause it sure hints at a different
story about what the status is. 

> Just out of curiosity, what type of HP-UX binaries did you 
> want to run?
> If it is 3D graphics based, or it uses a bunch of HP-UX proprietary
> kernel calls, ioctl's, etc. it isn't likely to work anytime soon ...

I sent this in another note, but I'm wanting to get flexlm running.

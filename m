Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.umr.edu (mrelay.cc.umr.edu [131.151.1.89])
	by dsl2.external.hp.com (Postfix) with ESMTP id 87B124904
	for <parisc-linux@lists.parisc-linux.org>; Fri,  5 Oct 2001 09:15:14 -0600 (MDT)
Message-ID: <6CAC36C3427CEB45A4A6DF0FBDABA56D86D869@umr-mail03.cc.umr.edu>
From: "Neulinger, Nathan" <nneul@umr.edu>
To: "'John Marvin'" <jsm@udlkern.fc.hp.com>,
	parisc-linux@lists.parisc-linux.org
Cc: "Uetrecht, Daniel J." <uetrecht@umr.edu>
Subject: RE: [parisc-linux] HP-UX binary compatibility
Date: Fri, 5 Oct 2001 10:14:49 -0500 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Hmm... Doesn't appear to be in there. At the moment, I actually could care
less about the real host id, but if the proc entry was overwritable, that
would solve my needs perfectly. At the moment, in my local kernel source, I
just wired the appropriate return values in the system call wrapper. 

-- Nathan

> -----Original Message-----
> From: Helge Deller [mailto:helge.deller@sap.com]
> Sent: Friday, October 05, 2001 3:18 AM
> To: Neulinger, Nathan; 'John Marvin';
> parisc-linux@lists.parisc-linux.org
> Cc: Uetrecht, Daniel J.
> Subject: Re: [parisc-linux] HP-UX binary compatibility
> 
> 
> Hi Nathan,
> 
> On Thursday 04 October 2001 17:07, Neulinger, Nathan wrote:
> >
> > troot-halley(11)> uname -a
> > HP-UX halley B.10.20 A 9000/735 2002000004 two-user license
> > troot-halley(12)> uname -i
> > 2002000004
> >
> > It's that 2002000004 that I need. 
> 
> I currently don't have access to a parisc-linux machine, but out of 
> my head I think you may get that number from the /proc/cpuinfo file 
> (maybe it is displayed there in hex) and may use it from the variable
> behind this output for your syscall wrapper.
> 
> Greetings,
> Helge
> 

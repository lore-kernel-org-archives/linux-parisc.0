Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.umr.edu (mrelay.cc.umr.edu [131.151.1.89])
	by dsl2.external.hp.com (Postfix) with ESMTP id 06B834904
	for <parisc-linux@lists.parisc-linux.org>; Fri,  5 Oct 2001 09:13:32 -0600 (MDT)
Message-ID: <6CAC36C3427CEB45A4A6DF0FBDABA56D86D868@umr-mail03.cc.umr.edu>
From: "Neulinger, Nathan" <nneul@umr.edu>
To: parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] Table version of syscall names patch and some
	simple wrappers
Date: Fri, 5 Oct 2001 10:13:31 -0500 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

Well, duh... Turns out it was working fine, but I was testing the apps from
a client station that couldn't resolve the host name I put in the license
file.

So, parisc-linux will fit the bill at least for this situation quite nicely.


-- Nathan

> -----Original Message-----
> From: Nathan Neulinger [mailto:nneul@umr.edu]
> Sent: Friday, October 05, 2001 9:29 AM
> To: parisc-linux@lists.parisc-linux.org
> Subject: [parisc-linux] Table version of syscall names patch and some
> simple wrappers
> 
> 
> This switches the callnames stuff into a table instead of a 
> large switch. It
> also includes a couple of simple wrappers that helped flexlm 
> get a bit further
> in it's execution. (Looks like it's working from 
> lmdiag/lmstat, but doesn't
> actually work from the applications yet unfortunately.)
> 
> -- Nathan
> 
> ------------------------------------------------------------
> Nathan Neulinger                       EMail:  nneul@umr.edu
> University of Missouri - Rolla         Phone: (573) 341-4841
> Computing Services                       Fax: (573) 341-4216
> 

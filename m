Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.umr.edu (mrelay.cc.umr.edu [131.151.1.89])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9ED934932
	for <parisc-linux@lists.parisc-linux.org>; Mon,  1 Oct 2001 09:42:30 -0600 (MDT)
Message-ID: <6CAC36C3427CEB45A4A6DF0FBDABA56D86D800@umr-mail03.cc.umr.edu>
From: "Neulinger, Nathan" <nneul@umr.edu>
To: "'Jes Sorensen'" <jes@wildopensource.com>
Cc: "'Matthew Wilcox'" <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] Status of hp-ux binary compatibility?
Date: Mon, 1 Oct 2001 10:40:47 -0500 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
List-ID: <linux-parisc.vger.kernel.org>

> I really don't think it should be that much work to get the basics
> going, it might be a bit more to get more advanced applications up and
> running.
> 
> I don't know anything really about the implementation of flexlm, but
> I'd say it should be doable with a limited effort. Time to get out
> that compiler and debugger and get hacking ;-)
> 
> Cheers
> Jes

As far as I know, flexlm should be a pretty basic socket server, nothing
fancy, other than it's retrieval of the HP host id, which I presume is just
a syscall of some sort. Unfortunately, it does require use of shared lib
libc since that's how it was linked. 

-- Nathan 

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel3.hp.com (palrel3.hp.com [156.153.255.226])
	by dsl2.external.hp.com (Postfix) with ESMTP id BE4714A19
	for <parisc-linux@parisc-linux.org>; Fri,  9 Feb 2001 10:27:42 -0700 (MST)
Message-Id: <200102091730.JAA08083@milano.cup.hp.com>
To: Andrew Shugg <andrew@neep.com.au>
Cc: Linux/HPPA List <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] minilibc CVS module 
In-reply-to: Your message of "Fri, 09 Feb 2001 21:43:57 PST."
             <20010209214354.K20585@neep.com.au>
Date: Fri, 09 Feb 2001 09:30:10 -0800
From: Grant Grundler <grundler@cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Andrew Shugg wrote:
> I have the 'minilibc' module checked out of CVS.  It doesn't seem to
> have been updated in the last 8 months.  Is this thing dead, or just
> resting?  Pining for the fjords, perhaps.

No - resting up for a ski vacation. :^O

The minilibc was used to build the first static binaries (eg sash).
sash was the first thing we could show off last year.
Since we've had a real glibc, minilibc has withered.

> Not that I can even remember why I have it checked out in the first
> place ... hmm.

Build your own static realtime, realmode application?
I'm not sure what "embedded" application parisc boxes would be good for...
but I've heard of such thing being done for dedicated NFS servers...

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA13820
	for <parisc-linux@puffin.external.hp.com>; Thu, 13 Jan 2000 14:42:26 -0700
Message-Id: <200001132042.VAA07253@pallas.spacetec.no>
From: tor@spacetec.no (Tor Arntsen)
Date: Thu, 13 Jan 2000 21:42:54 +0100
In-Reply-To: Matthew Wilcox <willy@thepuffingroup.com>
       "Re: [parisc-linux] 2.3 whining" (Jun  5, 12:25)
To: Matthew Wilcox <willy@thepuffingroup.com>,
        Paul Bame <bame@endor.fc.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 2.3 whining
List-ID: <linux-parisc.vger.kernel.org>

I'll leave the rest of the CVS discussions to you guys, however:

On Jun 5, 12:25, Matthew Wilcox wrote:
>Those $Log$ comments are a really bad idea, btw.  They grow too long
>and contain too much irrelevant crap.  If you want to write a comment,
>add it manually.

This point cannot be stressed enough. $Log$ is an *extremely* bad idea
if you use CVS (it was an ok feature for RCS).  Among other things it makes 
merges between CVS branches a nightmare: whenever you merge you will get a
conflict in the $Log$ entries which has to be fixed manually, then you 
commit the fixed file, which adds *another* $Log$ entry etc. 
You will have to manually edit *every single changed file* when you merge, 
you lose CVS's otherwise quite good merging capabilities.

It's a good idea to remove any trace of $Log$ whenever you find one
in a file.  It will raise its ugly head again in the next merge but
eventually you'll get rid of them.

-Tor

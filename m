Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id AAA01583
	for <parisc-linux@puffin.external.hp.com>; Mon, 2 Aug 1999 00:25:13 -0600
Date: Mon, 2 Aug 1999 08:26:12 +0200
From: Matthew Wilcox <Matthew.Wilcox@genedata.com>
To: LaMont Jones <lamont@security.hp.com>
Cc: Matthew Wilcox <Matthew.Wilcox@genedata.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HPUX syscall ABI?
Message-ID: <19990802082612.X25925@mencheca.ch.genedata.com>
References: <19990801215001.W25925@mencheca.ch.genedata.com> <19990802060824.878A318708@security.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <19990802060824.878A318708@security.hp.com>; from LaMont Jones on Mon, Aug 02, 1999 at 12:08:24AM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Aug 02, 1999 at 12:08:24AM -0600, LaMont Jones wrote:
> > I've just redefined the Linux syscall ABI again so we can
> > handle sys_mmap (which takes 6 arguments) cleanly.  I'm now
> > wondering what the HPUX syscall standard is.  I've searched
> > http://docs.hp.com:80/dynaweb/hpux11/dtdcen1a/b821/@Generic__BookView
> > (as mentioned earlier on this mailing list) without success.
> 
> IIRC, r22 has the syscall number, r31 (and sr0) gets trashed branching
> to 0.0xc0000004 (they probably get used as part of the return - I'm too
> lazy to go look right now, but I'm pretty sure that r31 gets copied into
> r2).  Other than that, it's a standard PA1.1 function call: arg0-3 in
> r26-21, and arg4-n at sp-52, -56, ...
> 
> Was that what you were looking for?

Yep, that's exactly what I need.  Urgh, so I have to grab the arguments
off the user-mode stack before switching to the kernel-mode stack..

What's the greatest number of parameters to an HPUX syscall?
Linux's mmap() has six parameters (and you should see the kludges some
architectures go through to support that.  We're cleaner).

-- 
Matthew Wilcox <willy@bofh.ai>
"Windows and MacOS are products, contrived by engineers in the service of
specific companies. Unix, by contrast, is not so much a product as it is a
painstakingly compiled oral history of the hacker subculture." - N Stephenson

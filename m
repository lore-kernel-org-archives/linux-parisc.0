Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA31184
	for <parisc-linux@puffin.external.hp.com>; Fri, 10 Mar 2000 09:58:21 -0700
Received: (from ncc@localhost)
	by milquetoast.cs.mcgill.ca (8.9.3/8.9.3) id KAA23296
	for parisc-linux@thepuffingroup.com; Fri, 10 Mar 2000 10:59:21 -0500 (EST)
Date: Fri, 10 Mar 2000 10:59:21 -0500
From: Nick Cabatoff <ncc@cs.mcgill.ca>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HFS linux implementation
Message-ID: <20000310105921.C23018@cs.mcgill.ca>
References: <20000309193535.C3423@cs.mcgill.ca> <yq1put3xlzd.fsf@leyland.socsci.auc.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: Martin K. Petersen's message [Re: [parisc-linux] HFS linux implementation] as of Fri, Mar 10, 2000 at 09:33:58AM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Mar 10, Martin K. Petersen wrote:
> Nick> I'm interested in the possibility of doing a linux module to
> Nick> mount HFS filesystems (read-only would satisfy me I think, and
> Nick> is a reasonable target.)
> 
> I implemented read only hfs support in the early days of the PA-RISC
> port.  It appears my ufs changes didn't get merged in when we moved
> from 2.2 to 2.3, though.  Will fix...

Could I get a copy of the 2.2 version to satisfy my curiosity?

> One of Paul Bame's colleagues looked into implementing write support
> at some point, but I don't know status on that project.  Paul?

Since (expirimental) writeable UFS exists in the current kernel, and I
assume your implementation is a patch to the existing UFS code, I
don't imagine it would be difficult.  I'll try and do it if the person
you mention doesn't have time.

Is there any point in doing ACLs if you haven't already?

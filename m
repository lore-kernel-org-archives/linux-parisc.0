Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA31952
	for <parisc-linux@puffin.external.hp.com>; Fri, 10 Mar 2000 10:34:28 -0700
Received: (from ncc@localhost)
	by milquetoast.cs.mcgill.ca (8.9.3/8.9.3) id LAA24029
	for parisc-linux@thepuffingroup.com; Fri, 10 Mar 2000 11:35:29 -0500 (EST)
Date: Fri, 10 Mar 2000 11:35:29 -0500
From: Nick Cabatoff <ncc@cs.mcgill.ca>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HFS linux implementation
Message-ID: <20000310113529.F23018@cs.mcgill.ca>
References: <20000309193535.C3423@cs.mcgill.ca> <yq1put3xlzd.fsf@leyland.socsci.auc.dk> <20000310105921.C23018@cs.mcgill.ca> <20000310110404.M27942@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: willy@thepuffingroup.com's message [Re: [parisc-linux] HFS linux implementation] as of Fri, Mar 10, 2000 at 11:04:04AM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Mar 10, willy@thepuffingroup.com wrote:
> On Fri, Mar 10, 2000 at 10:59:21AM -0500, Nick Cabatoff wrote:
> > Could I get a copy of the 2.2 version to satisfy my curiosity?
> 
> sure.  cvs co linux gets you the linux 2.2.12 tree we were working on.

Okay, I'll take a look, thanks.

> > Is there any point in doing ACLs if you haven't already?
> 
> linux doesn't currently support acls.  there's no interface for setting
> or accessing acls.

There is one that hasn't made it into the stock kernel yet at
http://acl.bestbits.at.

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA31505
	for <parisc-linux@puffin.external.hp.com>; Fri, 10 Mar 2000 10:03:23 -0700
From: willy@thepuffingroup.com
Date: Fri, 10 Mar 2000 11:04:04 -0500
To: Nick Cabatoff <ncc@cs.mcgill.ca>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HFS linux implementation
Message-ID: <20000310110404.M27942@thepuffingroup.com>
References: <20000309193535.C3423@cs.mcgill.ca> <yq1put3xlzd.fsf@leyland.socsci.auc.dk> <20000310105921.C23018@cs.mcgill.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000310105921.C23018@cs.mcgill.ca>; from Nick Cabatoff on Fri, Mar 10, 2000 at 10:59:21AM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Mar 10, 2000 at 10:59:21AM -0500, Nick Cabatoff wrote:
> Could I get a copy of the 2.2 version to satisfy my curiosity?

sure.  cvs co linux gets you the linux 2.2.12 tree we were working on.

> Is there any point in doing ACLs if you haven't already?

linux doesn't currently support acls.  there's no interface for setting
or accessing acls.

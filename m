Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA02495
	for <parisc-linux@puffin.external.hp.com>; Fri, 10 Mar 2000 16:26:50 -0700
Date: Fri, 10 Mar 2000 23:28:02 +0100
From: Dominik Kubla <dominik.kubla@uni-mainz.de>
To: Nick Cabatoff <ncc@cs.mcgill.ca>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HFS linux implementation
Message-ID: <20000310232802.A6578@uni-mainz.de>
References: <20000309193535.C3423@cs.mcgill.ca> <200003100137.RAA09015@milano.cup.hp.com> <20000310010949.A14656@cs.mcgill.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <20000310010949.A14656@cs.mcgill.ca>; from Nick Cabatoff on Fri, Mar 10, 2000 at 01:09:49AM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Mar 10, 2000 at 01:09:49AM -0500, Nick Cabatoff wrote:

> Actually, it looks like just stock UFS with ACL support, as far as I can
> see.  Even that's kind of optional; many sites don't use ACLs at all
> (hell, dump/restore don't know about them), and it looks like a
> read-only implementation that just ignored them would work fine.  I
> think that would be almost too easy given the existing linux UFS module
> though, so once that much is working I'll probably do a writeable
> version that preserves ACLs, even if it doesn't allow you to work with
> them.

Well, just talk to the linux-acl folks... they are just pushing the
(former ext2) ACL stuff up into the VFS, in order to have a generic
API to access the filesystem specific ACL implementations.  Unfortunately
the ACL development still lingers in 2.2 territory, but that's no excuse
not to think ahead and at least add the hooks for it when one touches
a file system anyway.

Web pages are at:    http://acl.bestbits.at/
Mailing list is at:  http://acl.bestbits.at/acl-devel/

Dominik
-- 
  Networking Group,  Hospital of Johannes Gutenberg-University                  
  Obere Zahlbacher Straﬂe 69, 55101 Mainz, Germany                              
  Tel: +49 (0)6131 17-2482   FAX: +49 (0)6131 17-5521                           

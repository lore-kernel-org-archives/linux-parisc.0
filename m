Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from deimos.frii.net (deimos.frii.com [216.17.128.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id CFF4F482A
	for <parisc-linux@parisc-linux.org>; Mon, 28 May 2001 10:32:25 -0600 (MDT)
Message-Id: <m154Pv9-001VltC@bame.riverrock.org>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@parisc-linux.org, bame@www.riverrock.org
Subject: Re: [parisc-linux] i hate cvs 
In-Reply-To: Message from Matthew Wilcox <matthew@wil.cx>
   of "Mon, 28 May 2001 00:48:58 BST." <20010528004858.L23718@parcelfarce.linux.theplanet.co.uk>
References: <20010528004858.L23718@parcelfarce.linux.theplanet.co.uk> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 28 May 2001 10:31:07 -0600
From: Paul Bame <bame@riverrock.org>
List-ID: <linux-parisc.vger.kernel.org>

> 
> someone want to tell me how to get a copy of our source tree from, say,
> May 19th?  cvs up -D'19 May 2001' is not the answer because it gets
> files off the vendor branch which is useless.

Well there appear to be some interesting CVS "features" here which
are independent of the magic safe-cvsimport stuff we've done:

$ date > e
$ cvs add e
cvs add: scheduling file `e' for addition
cvs add: use 'cvs commit' to add this file permanently
$ cvs commit -mno-message e
RCS file: /tmp/cvs/b/e,v
done
Checking in e;
/tmp/cvs/b/e,v  <--  e
initial revision: 1.1
done
$ cvs up -rHEAD -Dnow e
cvs update: e is no longer in the repository
$ cvs up -Dnow e
U e
$ cvs -v
Concurrent Versions System (CVS) 1.11 (client/server)
 
So it looks like specifying date and HEAD branch (alias "trunk") together is 
hosed (other date+branches i checked work fine).  If it looks easy I'll submit 
this to the CVS folks.

I can fix our repository so willy's initial command works properly (without
the -rHEAD I proposed) by commiting an unchanged 1.2 revision for certain 
files.
They will probably require back-dating if we want retroactive date-based
check-outs to work and that will probably require me to have exclusive access
to pehc for a bit.  Another way to solve the problem is to un-import 2.2.4
from the vendor branch (untested but I think it'll work).  Suggestions?

	-P

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel2.hp.com (atlrel2.hp.com [156.153.255.202])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0B9C1482A
	for <parisc-linux@parisc-linux.org>; Thu, 24 May 2001 17:14:19 -0600 (MDT)
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: amodra@one.net.au, lamont@hp.com, parisc-linux@parisc-linux.org,
	lamont@hp.com
Subject: Re: [parisc-linux] Re: still getting $$dyncall refs in shlibs 
In-reply-to: Your message of "Thu, 24 May 2001 18:59:17 EDT."
             <200105242259.SAA02789@hiauly1.hia.nrc.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Thu, 24 May 2001 17:14:17 -0600
From: LaMont Jones <lamont@hp.com>
Message-Id: <20010524231417.584391872C@security.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> That also applies to libtool which uses `ld' directly.  Gcc will run
> collect2 if needed.  This is necessary for correctly processing
> constructors and destructors.

Will someone file the defect against libtool, please?

lamont

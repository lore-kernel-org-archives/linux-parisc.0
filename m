Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 859C7482A
	for <parisc-linux@parisc-linux.org>; Thu, 24 May 2001 17:27:46 -0600 (MDT)
Message-Id: <200105242326.TAA02859@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: still getting $$dyncall refs in shlibs
To: lamont@hp.com (LaMont Jones)
Date: Thu, 24 May 2001 19:26:50 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: amodra@one.net.au, lamont@hp.com, parisc-linux@parisc-linux.org
In-Reply-To: <20010524231417.584391872C@security.hp.com> from "LaMont Jones" at May 24, 2001 05:14:17 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> Will someone file the defect against libtool, please?

Done.  There is a PR (objc/2902) against gcc 3.0 (prerelease).  This
is where I noticed the problem first.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from oliver.internal.sjdjweis.com (dsl.75.131.networkiowa.com [209.234.75.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 37EAF482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  9 Aug 2001 12:36:24 -0600 (MDT)
Date: Thu, 9 Aug 2001 13:38:41 -0500 (CDT)
From: Dave Weis <djweis@sjdjweis.com>
To: Kirk Bresniker <kirkb@chrome.rose.hp.com>
Cc: grundler@puffin.external.hp.com,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] more serial console problems on D310 
In-Reply-To: <200108091550.IAA08745@chrome.rose.hp.com>
Message-ID: <Pine.LNX.4.21.0108091337290.11782-100000@oliver.internal.sjdjweis.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Thu, 9 Aug 2001, Kirk Bresniker wrote:

> Check the system to see if there is an AP card. If there is, then you 
> might need to remove it. When I played with some d-classes very early on 
> in the port, I had to take the AP card out.  The inside door of your 
> d-class system should have a nice diagram showing you how to find the 
> AP card. It's an HSC card with two small extra connectors and on the
> bulkhead is an LED, a small switch, an serial connector and a tiny
> modem connector.

Yes, it does have one of those cards. I'll yank it tonite and see what
happens. It also has an 8 port serial card, would that make a
difference? I'll yank it also, anyway.

thanks
dave

-- 
Dave Weis             "I believe there are more instances of the abridgement
djweis@sjdjweis.com   of the freedom of the people by gradual and silent
                      encroachments of those in power than by violent 
                      and sudden usurpations."- James Madison

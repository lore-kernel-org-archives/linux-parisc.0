Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id WAA29524
	for <parisc-linux@puffin.external.hp.com>; Thu, 28 Oct 1999 22:50:51 -0600
Received: from vodka.thepuffingroup.com (IDENT:adevries@vodka.thepuffingroup.com [192.168.1.1])
	by vodka.thepuffingroup.com (8.9.3/8.9.3) with ESMTP id AAA03780
	for <parisc-linux@thepuffingroup.com>; Fri, 29 Oct 1999 00:57:54 -0400
Date: Fri, 29 Oct 1999 00:57:54 -0400 (EDT)
From: Alex deVries <adevries@thepuffingroup.com>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.4.10.9910290054070.3734-100000@vodka.thepuffingroup.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] booting on PA2.0 machines
List-ID: <linux-parisc.vger.kernel.org>


So I think we've determined that PA2.0 booting problems are related to the
PDC_BTLB call which isn't implemented in 2.0 processors.  

My thought would be to try such a call, and if it fails, then configure
cache lines in a way specific to 2.0 processors.  Am I right?

How should we be configuring this?

We've now got some puffins and HP people with 2.0 boxes, so it'd be really
nice to get these boxes booting.

- Alex

-- 
Alex deVries <adevries@thepuffingroup.com>
Vice President Engineering
The Puffin Group

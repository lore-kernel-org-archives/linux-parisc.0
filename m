Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id OAA09839
	for <parisc-linux@puffin.external.hp.com>; Wed, 19 Jul 2000 14:43:44 -0600
Date: Wed, 19 Jul 2000 16:45:15 -0400 (EDT)
From: "Brian S. Julin" <bri@mojo.calyx.net>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HIL support on 715/old ?
In-Reply-To: <20000719103952.18203.qmail@web510.mail.yahoo.com>
Message-ID: <Pine.BSO.4.21.0007191640530.18782-100000@mojo.calyx.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>


I haven't had the time yet to look at the code, which
I really honestly truthfully do hope to work on :-),
but someone at some point fixed it for the 715/64,
which meant changing HIL_BASE.  Someone else mentioned
that there's no PCIish bus/device tree yet, so maybe they j
ust re#defined it rather than probing.  The 715/64 used to 
hang there and it was because the HIL_BASE was wrong.

--
Brian S. Julin

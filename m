Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA28820
	for <parisc-linux@puffin.external.hp.com>; Fri, 17 Nov 2000 20:54:34 -0700
Received: from storm.ca (ppp002.ottawa.storm.ca [209.87.255.2])
	by mail.storm.ca (8.9.3+Sun/8.9.3) with ESMTP id WAA17326
	for <parisc-linux@thepuffingroup.com>; Fri, 17 Nov 2000 22:56:11 -0500 (EST)
Message-ID: <3A15FD92.DEB522FE@storm.ca>
Date: Fri, 17 Nov 2000 22:54:58 -0500
From: Sandy Harris <sandy@storm.ca>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Host for 712/60 compiles
List-ID: <linux-parisc.vger.kernel.org>

A couple of us have 16 diskless 712/60s which we want to use for distributed
processing on easily parallelized tasks like factoring and perhaps crypto
cracking. A few questions arise.

Is PARISC Linux far enough along to be useful for that? We need no monitor or
console (except perhaps for initial debugging), no devices except ethernet,
and expect to run only one process per machine, but we need stability.

We'll need a host for cross-compiling. We have a 256 meg 715/100 with HP/UX
which we expect to use as the host for booting, handing out chunks of work,
storing results, etc. Should we compile there under HP/UX or would we get
better tools on one of our Intel Linux boxes?

Or is PARISC Linux far enough along we should put it on the 715 and get
native compilation?

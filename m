Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 11C8E482A
	for <parisc-linux@parisc-linux.org>; Tue, 17 Jul 2001 16:39:01 -0600 (MDT)
Sender: marteaut@esiee.fr
Message-ID: <3B54BB9B.2D49FDCF@esiee.fr>
Date: Wed, 18 Jul 2001 00:26:35 +0200
From: Thomas Marteau <marteaut@esiee.fr>
MIME-Version: 1.0
To: Christian Suder <csuder@cisco.com>,
	"parisc-linux@parisc-linux.org" <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] 0.9.2 missing compiler ?
References: <3B54BB51.8CF43B05@cisco.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hi Christian,

	If you have your box connected to the web (that should be true
regarding where you work :), you just have to add this line to your
/etc/apt/sources.list
deb http://http.us.debian.org/debian unstable main

If you have a proxy to get http working, you have to create the file
/etc/apt/apt.conf which containts this:
Acquire::http::Proxy "http://your.proxy.fqdn:port/";

And then just a little apt-get update where you should see that it
downloads the files.

For your information, I just had a look to the big ISO and I get that:

spqr:/cdrom1/dists/sid/main/binary-hppa/more_packages# ls gcc
gcc-3.0-base_3.0-3_all.deb
gcc-hppa64_3.0-0pre010427.0.0.1_hppa.deb
gcc_3.0-6_hppa.deb

So, it seems to be there. Perhaps, you have the little one without it.
Try to download the big one, if the instructions above do not work.

Regards, Thomas
ESIEE Team

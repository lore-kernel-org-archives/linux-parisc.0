Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id CC0A2482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 Aug 2001 12:18:38 -0600 (MDT)
Sender: marteaut@esiee.fr
Message-ID: <3B796C1B.C87DCD0C@esiee.fr>
Date: Tue, 14 Aug 2001 20:21:15 +0200
From: Thomas Marteau <marteaut@esiee.fr>
MIME-Version: 1.0
To: "TOLAND,CHRISTOPHER (HP-USA,ex1)" <christopher_toland@hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Telnetd ?
References: <EF3C37D1121CD511894800A0C9E3AE7DA99C7B@xatl04.atl.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Hi Christopher,

By default, telnetd is not installed. You have to do it with apt-get
install telnetd

The point is during the install, you should have been asked to give some
info in order to download automatically the packages via apt-get.

If the command is not working, go into /etc/apt and add the following
line to sources.list:
deb http://http.us.debian.org/debian unstable main

And if you have a proxy, do not forget to create apt.conf file
containing this line:
Acquire::http::Proxy "http://your.proxy.fqdn:port/";

Good luck, Thomas.
ESIEE Team

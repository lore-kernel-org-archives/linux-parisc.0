Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 47B6A4894
	for <parisc-linux@parisc-linux.org>; Tue,  5 Jun 2001 07:55:25 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 7D656B007; Tue,  5 Jun 2001 14:51:56 +0100 (BST)
Date: Tue, 5 Jun 2001 14:51:56 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: djweis@sjdjweis.com
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] D310 boot messages
Message-ID: <20010605145156.J25745@linuxcare.com>
References: <20010605104655.H25745@linuxcare.com> <Pine.LNX.4.21.0106050723380.21394-100000@oliver.internal.sjdjweis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0106050723380.21394-100000@oliver.internal.sjdjweis.com>; from djweis@sjdjweis.com on Tue, Jun 05, 2001 at 07:26:52AM -0500
List-ID: <linux-parisc.vger.kernel.org>

So with the nfsroot you have the D310 booting, but with the 0.9 ISO
it stops after serial driver initialisation.

What kernel are you using with the nfsroot?

What parameters is it booted with?

Richard

> I grabbed the bigger nfsroot and got my machine booting from it last
> night. telnet/rlogin/rsh wouldn't work, so I used the script kiddie remote
> login method and added 
> 3333	stream	tcp	nowait	root	/bin/sh sh -i
> to inetd.conf and can get in to the machine. If there's anything I can do
> on there to help in debugging the serial problem, let me know. 

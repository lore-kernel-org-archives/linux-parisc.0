Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from post.webmailer.de (natwar.webmailer.de [192.67.198.70])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9EDF54829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  8 Oct 2002 01:59:04 -0600 (MDT)
Received: from visoel.de (dialin-145-254-078-185.arcor-ip.net [145.254.78.185])
	by post.webmailer.de (8.9.3/8.8.7) with ESMTP id JAA11300
	for <parisc-linux@lists.parisc-linux.org>; Tue, 8 Oct 2002 09:58:59 +0200 (MEST)
Message-ID: <3DA29141.3030802@visoel.de>
Date: Tue, 08 Oct 2002 10:03:13 +0200
From: Tilo Riemer <t.riemer@visoel.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] ksoftirqd eats 100% cpu :-(
References: <3DA1A6F3.8030707@visoel.de> <3DA1A641.1090306@esiee.fr> <200210072152.04775.deller@gmx.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hello list,

>>>I use Debian 3.0 on an HP9000/710. Almost all works fine, but the
>>>ksoftirqd eats all cpu time. I read that it's a bug in the kernel. Is
>>>there a patch for fixing this problem?

> It's a bug/feature related to the HIL drivers. 
> Since we have to poll the HIL ports the whole time
> the bunch of running timers increase the ksoftirqd load a lot.

Btw, if the mouse and keyboard are attached, the ksoftirqd needs about 
50-60%, without mouse and keyboard, it needs 100%.


Best regards, Tilo

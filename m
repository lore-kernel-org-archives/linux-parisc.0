Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id E6E654843
	for <parisc-linux@lists.parisc-linux.org>; Mon,  7 Oct 2002 09:23:09 -0600 (MDT)
Message-ID: <3DA1A641.1090306@esiee.fr>
Date: Mon, 07 Oct 2002 17:20:33 +0200
From: Thibaut VARENE <varenet@esiee.fr>
MIME-Version: 1.0
To: Tilo Riemer <t.riemer@visoel.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] ksoftirqd eats 100% cpu :-(
References: <3DA1A6F3.8030707@visoel.de>
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

Tilo Riemer wrote:
> Hello list,
> 
> I use Debian 3.0 on an HP9000/710. Almost all works fine, but the 
> ksoftirqd eats all cpu time. I read that it's a bug in the kernel. Is 
> there a patch for fixing this problem?
It's a well known bug. on 7x0 and 7x5 boxes.

Maybe we should add a faq entry ?


-- 
Thibaut VARENE
PA/Linux ESIEE Team
http://pateam.esiee.fr/

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from post.webmailer.de (natpost.webmailer.de [192.67.198.65])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8983E4829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  7 Oct 2002 09:19:23 -0600 (MDT)
Received: from visoel.de (dialin-145-254-078-194.arcor-ip.net [145.254.78.194])
	by post.webmailer.de (8.9.3/8.8.7) with ESMTP id RAA05853
	for <parisc-linux@lists.parisc-linux.org>; Mon, 7 Oct 2002 17:19:19 +0200 (MET DST)
Message-ID: <3DA1A6F3.8030707@visoel.de>
Date: Mon, 07 Oct 2002 17:23:31 +0200
From: Tilo Riemer <t.riemer@visoel.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] ksoftirqd eats 100% cpu :-(
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

I use Debian 3.0 on an HP9000/710. Almost all works fine, but the 
ksoftirqd eats all cpu time. I read that it's a bug in the kernel. Is 
there a patch for fixing this problem?


Best regards, Tilo

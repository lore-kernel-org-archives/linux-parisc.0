Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel3.hp.com (palrel3.hp.com [156.153.255.226])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3A5084A19
	for <parisc-linux@parisc-linux.org>; Tue, 20 Mar 2001 13:03:54 -0700 (MST)
Message-Id: <200103202003.MAA09125@adlmail.cup.hp.com>
Subject: Re: [parisc-linux] Efficient Pthread Implementation
Date: Tue, 20 Mar 2001 12:02:41 -0800
From: Cary Coutant <cary@cup.hp.com>
To: "Matthew Wilcox" <matthew@wil.cx>,
	<parisc-linux@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
List-ID: <linux-parisc.vger.kernel.org>

>I propose we could use %cr27.
>It's readable from userspace, and we could have a 2-insn stub on the
>gateway page which sets %cr27 as necessary.  We then have to switch its
>value across context switch, which doesn't seem like a big deal to me.

This is what HP-UX does. We provide a lightweight system call for setting 
it. I believe that we recommend reading it at most once per procedure and 
caching it in a GR, because of the latency reading from a CR.

-cary

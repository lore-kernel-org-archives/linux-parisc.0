Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from delenn.fl.net.au (int-mail.syd.fl.net.au [202.181.0.28])
	by dsl2.external.hp.com (Postfix) with ESMTP id 136244855
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Mar 2002 19:38:35 -0700 (MST)
Received: from simplex (idesign.fl.net.au [203.30.61.17])
	by delenn.fl.net.au (Postfix) with ESMTP id 6EBEE17FD5A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  9 Mar 2002 13:39:45 +1100 (EST)
From: "Duraid Madina" <duraid@fl.net.au>
To: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Swap space limitions for Linux on parisc
Date: Sat, 9 Mar 2002 13:38:35 +1100
Message-ID: <000201c1c713$82ecfd40$022a17ac@simplex>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
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

John wrote:

>P.S. Note that we don't support 64 bit user space processes yet, so you
>would probably find it difficult to consume extreme amounts of swap
>space, since each process can only address ~4Gb of memory.	

(!!!)

*ponders tearing up his code into multiple processes*

The 'yet' above gives me hope; will 64 bit user space processes be
supported anytime soon? Being able to malloc(1<<36) would be nice!

	Duraid

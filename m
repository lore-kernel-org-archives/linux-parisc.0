Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from delenn.fl.net.au (int-mail.syd.fl.net.au [202.181.0.28])
	by dsl2.external.hp.com (Postfix) with ESMTP id 236BD482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 29 May 2002 16:00:44 -0600 (MDT)
Received: from fl.net.au (idesign.fl.net.au [203.30.61.17])
	by delenn.fl.net.au (Postfix) with ESMTP id 9D4E9180157
	for <parisc-linux@lists.parisc-linux.org>; Thu, 30 May 2002 08:04:27 +1000 (EST)
Message-ID: <3CF54F85.7070106@fl.net.au>
Date: Thu, 30 May 2002 08:00:37 +1000
From: Duraid Madina <duraid@fl.net.au>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] A400-6X always crashes after a while
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

Using the 2.4.18-pa26 kernel on my A400-6X, the machine doesn't want to 
stay alive for more than about a day. The console log shows this:

~~~
Kernel panic: sba_iommu.c: I/O MMU @ fffffffffed22000 is out of mapping 
resources

 <6>sym53c896-3-<15,0>: extraneous data discarded.
sym53c896-3-<15,0>: COMMAND FAILED (89 0) @0000000016c95800.
Kernel panic: sba_iommu.c: I/O MMU @ fffffffffed22000 is out of mapping 
resources

In interrupt handler - not syncing
~~~

    Does anyone know what might be causing this?

    tia,
    Duraid

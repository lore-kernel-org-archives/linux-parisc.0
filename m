Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from picard.corpconnect.com.au (picard.corpconnect.com.au [203.34.58.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 43428482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 14 May 2002 19:53:34 -0600 (MDT)
Received: from klingon.corpconnect.com.au (ppro.corpconnect.com.au [203.34.58.17])
	by picard.corpconnect.com.au (8.8.7/8.8.7) with ESMTP id LAA26146
	for <parisc-linux@lists.parisc-linux.org>; Wed, 15 May 2002 11:53:18 +1000
Message-Id: <5.1.0.14.2.20020515114933.04d138b8@pop01.corpconnect.com.au>
Date: Wed, 15 May 2002 11:53:19 +1000
To: parisc-linux@lists.parisc-linux.org
From: Richard Muratti <rick@ccoz.com>
Subject: Re: [parisc-linux] Re: tftp boot
In-Reply-To: <1021396202.3ce144ea30690@webmail.tiscalinet.be>
References: <002501c1fb5b$48459540$02c1a8c0@james.co.uk>
 <002501c1fb5b$48459540$02c1a8c0@james.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
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

At 07:10 PM 14/05/2002 +0200, joel.soete@freebel.net wrote:
>Hey James,
>
>CUT--


>Linux version 2.4.18-pa12-lvm-1.0.3-evms-1.0.0-jfs-1.0.17 (root@palinux) (gcc
>version 3.0.4) #13 Tue May 14 15:42:21 CEST 2002
CUT--

NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
>Looking up port of RPC 100003/2 on 172.16.248.169
                                                         ^^^^^^^^^^^^^^^^^
Are you running nfsd on this machine and have you exported
the root file system on it.

Cheers
Rick

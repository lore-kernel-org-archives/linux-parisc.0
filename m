Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from intro.peace.co.nz (ns1.peace.co.nz [202.14.141.227])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9B281483B
	for <parisc-linux@lists.parisc-linux.org>; Mon,  8 Jul 2002 15:41:28 -0600 (MDT)
From: "James Braid" <james.braid@peace.com>
To: <parisc-linux@lists.parisc-linux.org>
Date: Tue, 9 Jul 2002 09:50:12 +1200
Message-ID: <022c01c226c9$6fd0ebc0$5e01000a@bongo>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Subject: [parisc-linux] L2000 stable with SMP and RAID
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

Hi list,

FYI, I downloaded the latest CVS kernel and compiled it on my L2000 and
it magically seems have fixed most of the stability problem's I have
been having with the box. Before the box would crap out randomly when
doing pretty much *any* I/O stuff. SMP was also very flaky.

SMP seems to be working fine, and top even seems to report the correct
values for load average and CPU utilization :-) It's been running
distributed.net for several days now with no worries.

I have got 2 disks in a RAID 0 config and have been testing them with
dbench and bonnie and so far the box seems to be pretty stable.

Cheers, James

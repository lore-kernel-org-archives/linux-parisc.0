Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id E181C4829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 25 Sep 2002 18:23:33 -0600 (MDT)
Received: from hiauly1.hia.nrc.ca (localhost [127.0.0.1])
	by hiauly1.hia.nrc.ca (8.12.0.Beta16/8.12.0.Beta16) with ESMTP id g8PKDg00000910
	for <parisc-linux@lists.parisc-linux.org>; Wed, 25 Sep 2002 16:13:43 -0400 (EDT)
Message-Id: <200209252013.g8PKDfD4000908@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] netacct-mysql compilation problem
To: stephan@itp.bg
Date: Wed, 25 Sep 2002 16:13:41 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020925195914.081FA4829@dsl2.external.hp.com> from "Stephan" at Sep 25, 2002 11:00:40 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> <P>Sep 25 22:54:02 obzor kernel: do_page_fault() pid=25917 command='nacctd'
> type=15 address=0x00000000<BR>Sep 25 22:54:02 obzor kernel: <BR>Sep 25

Looks like a NULL pointer.

> IASQ: 000024e0 000024e0 IAOQ: 00017c83 00017c87<BR>Sep 25 22:54:02 obzor

The instruction causing the fault is at 0x00017c80.  This is probably
a coding problem in the source.  Some systems are more tolerant of
NULL pointers than others.  You would need to use a debugger to
investigate further.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

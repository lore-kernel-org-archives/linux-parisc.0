Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 94A574866
	for <parisc-linux@lists.parisc-linux.org>; Thu, 29 Aug 2002 08:28:52 -0600 (MDT)
Received: from hiauly1.hia.nrc.ca (localhost [127.0.0.1])
	by hiauly1.hia.nrc.ca (8.12.0.Beta16/8.12.0.Beta16) with ESMTP id g7TESn00024112
	for <parisc-linux@lists.parisc-linux.org>; Thu, 29 Aug 2002 10:28:50 -0400 (EDT)
Message-Id: <200208291428.g7TESm9l024111@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Back to evms-1.0.1 && unaligne access && gdb
To: jsoe0708@tiscali.be
Date: Thu, 29 Aug 2002 10:28:48 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3D53B3B700008876@ocpmta1.be.tiscali.com> from "jsoe0708@tiscali.be" at Aug 29, 2002 04:21:41 pm
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

> >Program received signal SIGINT, Interrupt.
> >0x4020a0e4 in isa_null_partition_record (p=0x3fe0ff) at checks.c:65

You can see from the value of p above that it is not properly aligned
for a 4 byte access.  Put a break on isa_null_partition_record and

cond n p==0x3fe0ff

where n is the breakpoint number of the break at isa_null_partition_record.
Then, run the program and it should stop at isa_null_partition_record
when the fault is about to occur.  You will then have to do a bt to
determine why p is incorrectly aligned (last hex digit should be 0,
4, 8 or c).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

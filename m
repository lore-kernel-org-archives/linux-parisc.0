Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6D43C482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 29 Jan 2002 09:03:14 -0700 (MST)
Date: Tue, 29 Jan 2002 17:03:00 +0100 (CET)
From: Jochen Friedrich <jochen@scram.de>
To: Randolph Chung <randolph@tausq.org>
Cc: HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] IPv6
In-Reply-To: <20020129071642.GP21816@tausq.org>
Message-ID: <Pine.NEB.4.33.0201291643080.14788-100000@www2.scram.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Hi Randolph,

> > ICMPv6 checksum failed [3ffe:0400:0470:0004:0000:0000:0000:0001 >
> > ff02:0000:0000:0000:0000:0001:ff00:0002]
> > NET: 4 messages suppressed.
>
> should be fixed now.... pls give it a try. it was not adding proto
> correctly.

It's OK now. However, there still seems to be a problem with the socket
interface. From the HP, i can't ping6 anything (no response), although i
can see the packets on the line (with correct checksum) and the reply from
my Intel box (or anything behind it). A ping from Intel to HP works just
fine. Also, i can't even ping6 ::1.

3ffe:400:470:4::2 is the (current) 6bone address of the HP :-)

# ping6 3ffe:400:470:4::2
PING6(56=40+8+8 bytes) 3ffe:400:470:1::dead:fffe --> 3ffe:400:470:4::2
16 bytes from 3ffe:400:470:4::2, icmp_seq=0 hlim=61 time=85.938 ms
16 bytes from 3ffe:400:470:4::2, icmp_seq=1 hlim=61 time=78.125 ms
16 bytes from 3ffe:400:470:4::2, icmp_seq=2 hlim=61 time=82.032 ms

Cheers,
Jochen

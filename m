Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id CF81B4842
	for <parisc-linux@lists.parisc-linux.org>; Tue, 29 Apr 2003 09:00:54 -0600 (MDT)
Message-Id: <200304291500.h3TF0otE002237@hiauly1.hia.nrc.ca>
To: taner@freebirdairlines.com (=?windows-1254?Q?Taner_Pilavc=FD?=)
Date: Tue, 29 Apr 2003 11:00:50 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: jsoe0708@tiscali.be, parisc-linux@lists.parisc-linux.org
In-Reply-To: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAA2KbLcZMh1xGqcgACRGSCYsKAAAAQAAAA29sB0iN61xGqcgACRGSCYgEAAAAA@freebirdairlines.com> from "=?windows-1254?Q?Taner_Pilavc=FD?=" at Apr 29, 2003 10:54:02 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] Re: Kernel Compilation error 2.4.20
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

Questions on parisc-linux should be sent to the list.  This is a FAQ.

> In file included from ide-cd.c:318:
> ide-cd.h: At top level:
> ide-cd.h:440: error: long, short, signed or unsigned used invalidly for
                ^^^^^

The problem is that the types "__u8" and "short" can't be used together:

	__u8 short slot_tablelen;

I'd remove the __u8 from the above line in ide-cd.h and retry your build.

Dave

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4B998482D
	for <parisc-linux@lists.parisc-linux.org>; Tue, 22 Oct 2002 09:51:23 -0600 (MDT)
Date: Tue, 22 Oct 2002 08:54:35 -0700
From: Randolph Chung <randolph@tausq.org>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: EWOULDBLOCK vs. EAGAIN
Message-ID: <20021022155435.GB5602@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <200210221534.JAA28679@udlkern.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200210221534.JAA28679@udlkern.fc.hp.com>
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

In reference to a message from John Marvin, dated Oct 22:
> OK, I should have checked the archives first. It looks like this issue
> has already come up. In that case we fixed the app. But I'm not comfortable
> with the fact that we are different from every other architecture here.

John, I was refering to the suggestion Carlos made that we can "fix up"
the return value in the syscall return path in glibc. Looks like there
is already precedence for this sort of thing, and that way we retain
binary compatibility with both hppa-linux and potentially with hpux.

> P.S. I know most of you don't care, but the broken app in this case is
> telnetd. It drops connections if you blast too much to stdout.

heh, now that you mention it, this explains some things...:-)

randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

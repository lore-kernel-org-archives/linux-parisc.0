Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: buytenh@gnu.org
Cc: parisc-linux@lists.parisc-linux.org
Message-Id: <20020102234211.15C23482A@dsl2.external.hp.com>
Date: Wed,  2 Jan 2002 16:42:11 -0700 (MST)
From: grundler@dsl2.external.hp.com (Grant Grundler)
Subject: [parisc-linux] Re: [PATCH][RFC][CFT] remove global errno from the kernel
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

Lennert Buytenhek wrote:
> Thanks!  I've found that it's very hard to motivate people for these
> kinds of changes (I've only had two reactions so far), so your reply is
> really appreciated!

heh - it's too much like work ;^)

BTW, the parisc code in Linus' tree is horribly stale.
We are slowly cleaning up and getting changes back to the
various upstream maintainers.  I think it's fair to mostly ignore
parisc until linus' 2.4 tree is more in sync ours.  If you
have time and/or interest, look at http://cvs.parisc-linux.org.

In any case, DTRT and we'll deal with those changes in a future merge.

thanks,
grant

grundler at parisc-linux.org

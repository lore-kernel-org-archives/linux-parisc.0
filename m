Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from fep04-mail.bloor.is.net.cable.rogers.com (fep04-mail.bloor.is.net.cable.rogers.com [66.185.86.74])
	by dsl2.external.hp.com (Postfix) with ESMTP id 81F3E4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 May 2003 17:15:15 -0600 (MDT)
Date: Mon, 19 May 2003 19:16:20 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4 and semtimedop - need kernel compat?
Message-ID: <20030519231620.GA1489@systemhalted>
References: <20030519201224.GB542@systemhalted> <20030519220631.GA31518@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030519220631.GA31518@parcelfarce.linux.theplanet.co.uk>
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

> Uh, you don't need to do anything.  If you call an unassigned syscall,
> you get -ENOSYS.

The idea was that it might be able to provide the required compat
functionality in 2.4. If we feel it's not possible then we can eliminate
all the entries in sys_parisc.c/sys32_parisc.c and leave the syscall as
ENTRY_SAME(nisyscall) in entry.S.

The glibc side of the code is done.

c.

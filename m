Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 03F89482D
	for <parisc-linux@lists.parisc-linux.org>; Sun, 13 Jul 2003 23:41:01 -0600 (MDT)
Date: Sun, 13 Jul 2003 22:44:58 -0700
From: Randolph Chung <randolph@tausq.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: Joel Soete <joel.soete@tiscali.be>,
	parisc-linux@lists.parisc-linux.org, Helge Deller <deller@gmx.de>
Message-ID: <20030714054458.GC30257@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20030713162054.GF20673@tausq.org> <3F0BEA8300000F7B@ocpmta1.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F0BEA8300000F7B@ocpmta1.freegates.net>
Subject: [parisc-linux] Re: Xfree-server and Xhp ?
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

> > >      ldo 0x40(sp),sp
> ^^^^^^^^^^^^^^^^^^^^^^^^^^That was I suspected to be 'som' specific

that means a 64-byte stack.. should be fine on palinux as well.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6D83C4839
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Feb 2003 09:07:36 -0700 (MST)
Date: Thu, 20 Feb 2003 08:04:43 -0800
From: Randolph Chung <randolph@tausq.org>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Solved [was: Help, help testing Debian hppa unusable??]
Message-ID: <20030220160443.GF11363@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <3E53490E0000066B@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3E53490E0000066B@ocpmta2.freegates.net>
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

> I temporary copy libc-2.3.1.so into /lib of this system.

Eep, that is a *BAD* idea...

> What I found erronious is that ldconfig changed on its own (without querying
> what todo) the link /lib/libc.so.6 -> libc-2.2.5.so (as install by libc6
> dpkg) to -> libc-2.3.1.so??

This is correct behavior, ldconfig creates a symlink between the SONAME
of a library to the library itself. This is documented in the ldconfig
manpage.....

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

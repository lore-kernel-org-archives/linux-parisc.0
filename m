Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2602D4829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  3 Jun 2003 08:18:06 -0600 (MDT)
Message-Id: <200306031418.h53EI399028101@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] compiler & kernel
To: jsoe0708@tiscali.be (Joel Soete)
Date: Tue, 3 Jun 2003 10:18:03 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: joel.soete@tiscali.be, xam@cs.ucc.ie,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <3ED70CF100001190@ocpmta2.freegates.net> from "Joel Soete" at Jun 3, 2003 09:14:40 am
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

> # file vmlinux-2.4.21-rc4-pa35
> vmlinux-2.4.21-rc4-pa35: ELF 64-bit MSB ..., dynamically linked (uses share
> libs), ...
> 
> In the 32-bits case I well understand that kernel was staticaly linked but
> I but surprised that 64-bit kernel is dynamically linked? 

This is a limitation of the 64-bit linker.  Binaries still need an
interpreter for startup even when linked with -static.  This probably
could be fixed but the use of static binaries under 64-bit hpux is
discouraged.  Under hpux, the linker needs to define some extra symbols
when a static binary is created.

> Anyway could you let me know how to 'generate this profile'

Look at the -Q, -ftime-report and -fmem-report options.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

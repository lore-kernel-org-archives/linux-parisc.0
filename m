Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 36B6448D0
	for <parisc-linux@parisc-linux.org>; Tue, 16 Jul 2002 11:27:04 -0600 (MDT)
Message-Id: <200207161727.g6GHR0j2023590@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc-3.2 bootstrap?
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Date: Tue, 16 Jul 2002 13:27:00 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: joel.soete@freebel.net, parisc-linux@parisc-linux.org
In-Reply-To: <no.id> from "John David Anglin" at Jul 16, 2002 11:16:35 am
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

> > but when I try to use it to compile kernel-2.4.18-pa54 I got following error:
> > `gcc -print-libgcc-file-name`
> > /Develop/parisc-linux/src/linux-2.4.18-pa54/arch/parisc/lib/lib.a
> > /Develop/parisc-linux/src/linux-2.4.18-pa54/lib/lib.a  \
> >         --end-group \
> >         -o vmlinux
> > arch/parisc/kernel/kernel.o(__ksymtab+0x258): undefined reference to `$$mulU'  

> $$mulU is a millicode routine in libgcc.a.

Sorry, this routine is no longer in libgcc.a.  It was in the 32-bit
library for 3.0.x.  However, we have switched to the "64-bit" millicode
for both 32 and 64 bit code.  Gcc doesn't use it anymore but I see there
are a couple of remnants to clean up.

Your problem appears to be with arch/parisc/kernel/parisc_ksyms.c.
It imports the symbol.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

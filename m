Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8BBE0489E
	for <parisc-linux@parisc-linux.org>; Tue, 16 Jul 2002 09:16:38 -0600 (MDT)
Message-Id: <200207161516.g6GFGZ8C023053@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc-3.2 bootstrap?
To: joel.soete@freebel.net
Date: Tue, 16 Jul 2002 11:16:35 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <1026831840.3d3435e0d908a@webmail.tiscalinet.be> from "joel.soete@freebel.net" at Jul 16, 2002 05:04:00 pm
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

> I just modify to match my develop env and mainly I added --host=hppa-linux (I am
> building gcc-3.2 on a b2000) in the configure:
> '$GCC_SRC/gcc/configure --prefix=$TOOLS --enable-languages=c --host=hppa-linux'
> 
> Should I had to prefer --target=hppa-linux to build a native bootstrap?

That's unnecessary for native build.

> Well this produce well a gcc (bootstrap?).
> 
> but when I try to use it to compile kernel-2.4.18-pa54 I got following error:
> `gcc -print-libgcc-file-name`
> /Develop/parisc-linux/src/linux-2.4.18-pa54/arch/parisc/lib/lib.a
> /Develop/parisc-linux/src/linux-2.4.18-pa54/lib/lib.a  \
>         --end-group \
>         -o vmlinux
> arch/parisc/kernel/kernel.o(__ksymtab+0x258): undefined reference to `$$mulU'  
> make: *** [vmlinux] Error 1
> 
> (after a make distclean; make oldconfig)
> 
> What is it wrong?

Possibilities are:

  1) you either didn't install what you built.
  2) you moved stuff around so libgcc couldn't be found.
  3) libgcc.a didn't build when you built your cross.
  4) linker script didn't link in libgcc.a.

$$mulU is a millicode routine in libgcc.a.

> Or would it be better to continue with xcompiler hppa->hppa?

You are just adding more complication to the process trying to use
ia64.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id A93374829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Dec 2002 09:57:18 -0700 (MST)
Date: Wed, 11 Dec 2002 17:57:07 +0100
Subject: Re: [parisc-linux] another kernel compilation error
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v548)
Cc: <parisc-linux@lists.parisc-linux.org>
To: "Tim Kemna" <t.kemna@student.utwente.nl>
From: Thibaut VARENE <varenet@esiee.fr>
In-Reply-To: <006e01c2a11c$71745200$4fe85982@kabel.utwente.nl>
Message-Id: <952B7432-0D29-11D7-A153-0030656F07A2@esiee.fr>
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

Le mercredi, 11 d=E9c 2002, =E0 14:51 Europe/Paris, Tim Kemna a =E9crit =
:
>
> drivers/char/char.o: In function `hp_diva_check':
> drivers/char/char.o(.text.hp_diva_check+0x60): undefined reference to
> `rs_interr
> upt'
> make: *** [vmlinux] Error 1
>
Weird I'm also having an error on char.o:

         -o vmlinux
drivers/char/char.o: In function `.L1757':
drivers/char/char.o(.text.vt_ioctl+0x51c): undefined reference to=20
`key_maps'
drivers/char/char.o: In function `handle_scancode':
drivers/char/char.o(.text.handle_scancode+0x25c): undefined reference=20
to `key_maps'
drivers/char/char.o: In function `handle_diacr':
drivers/char/char.o(.text.handle_diacr+0x1c): undefined reference to=20
`accent_table_size'
drivers/char/char.o: In function `do_fn':
drivers/char/char.o(.text.do_fn+0x8): undefined reference to=20
`func_table'
drivers/char/char.o: In function `compute_shiftstate':
drivers/char/char.o(.text.compute_shiftstate+0x90): undefined reference=20=

to `key_maps'
drivers/char/char.o: In function `do_slock':
drivers/char/char.o(.text.do_slock+0x74): undefined reference to=20
`key_maps'
make: *** [vmlinux] Error 1

same kernel; 64bit UP for a B2600 in graphic mode (SuckyIO/STIcon...)

I'm gonna investigate soon...
Mail me for .config...=

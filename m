Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from the-village.bc.nu (lightning.swansea.linux.org.uk [194.168.151.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id ED5DC482C
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 Nov 2001 04:01:06 -0700 (MST)
Subject: Re: Betr.: Re: [parisc-linux] Linux/PA-RISC speed (was Re: C240
To: Jurriaan.Kalkman@zrt.nl (Jurriaan Kalkman)
Date: Fri, 16 Nov 2001 11:08:49 +0000 (GMT)
Cc: alan@lxorguk.ukuu.org.uk, parisc-linux@lists.parisc-linux.org
In-Reply-To: <sbf4faad.062@ms-zrt1> from "Jurriaan Kalkman" at Nov 16, 2001 11:28:50 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E164grZ-0003fd-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
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

> In what way? It's not like the ./configure script will produce very =
> different
> results on alpha vs parisc, it doesn't even check for 64 bits/32 bits
> differences. All this just demonstrated my gut feeling that compiling (
> the kernel, for example) feels slower on parisc than it should be.

The amount of work to build a kernel for a given platofrm depends a lot on
the CPU, the number of instructions and the number of combinations of
optimisations

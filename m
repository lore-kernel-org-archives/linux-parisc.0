Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 21822482B
	for <parisc-linux@lists.parisc-linux.org>; Tue,  8 Jul 2003 08:06:18 -0600 (MDT)
Date: Tue, 8 Jul 2003 16:06:14 +0200
Message-ID: <3F056E9500000F91@ocpmta4.freegates.net>
In-Reply-To: <200307022213.58129.deller@gmx.de>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] stifb
To: "Helge Deller" <deller@gmx.de>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

Hi Helge,

I comeback to you with stifb in kernel 2.5.74-pa0 this time.

I think I have the bad idea to compile it as builtin; unfortuantely I got
following compiling error:

  LD      vmlinux
drivers/built-in.o(.init.text+0xa778): In function `stifb_init':
: undefined reference to `sti_get_rom'
drivers/built-in.o(.exit.text+0x5d8): In function `stifb_cleanup':
: undefined reference to `sti_get_rom'
make: *** [vmlinux] Error 1

Any idea?

Thanks in advance,
    Joel


------------------------------------------------------
Soldes Tiscali ADSL : 27,50 euros/mois jusque fin 2003.
On s'habitue vite à payer son ADSL moins cher!
Plus d'info? Cliquez ici... http://reg.tiscali.be/default.asp?lg=fr 

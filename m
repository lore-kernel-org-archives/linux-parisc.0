Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 32E3B482D
	for <parisc-linux@lists.parisc-linux.org>; Sun, 13 Jul 2003 23:39:49 -0600 (MDT)
Date: Mon, 14 Jul 2003 07:39:41 +0200
Message-ID: <3F0BEA8300000F7B@ocpmta1.freegates.net>
In-Reply-To: <20030713162054.GF20673@tausq.org>
From: "Joel Soete" <jsoe0708@tiscali.be>
To: "Randolph Chung" <randolph@tausq.org>,
	"Joel Soete" <joel.soete@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org,
	"Helge Deller" <deller@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

>well, not that i know of, but it should work almost as is. most of these
>are actually differences between the HP assembler and the GNU assembler,
>rather than differences between SOM and ELF.
>
>> >      .space  $TEXT$
>> >      .subsp
>> $CODE$
>
>change to ".text"
>
That was my main question, nice :)

>> >
>> >ngleDepth8_CopyAreaFromToScreen
>add colon (:) at end
Ok

> >      ldo 0x40(sp),sp
^^^^^^^^^^^^^^^^^^^^^^^^^^That was I suspected to be 'som' specific

> >      stw arg0,-0x64(sp)
> >      stw arg1,-0x68(sp)
> >      stw arg2,-0x6c(sp)
> >      stw arg3,-0x70(sp)
> >      ldw -0x68(sp),r1
> [...]
> (arg[0..3], r[0..], t[1..4] beeing labels defined <machine/asm.h>)

>shouldn't need the labels, the assembler recognizes these. but you need
>to put % in front of all the register names in order for the GNU
>assembler to accept the input. (ldo 0x40(%sp),%sp, etc)

HTH,

A lot you just answers to all my questions,

Thanks a lot,
    Joel



------------------------------------------------------
Soldes Tiscali ADSL : 27,50 euros/mois jusque fin 2003.
On s'habitue vite à payer son ADSL moins cher!
Plus d'info? Cliquez ici... http://reg.tiscali.be/default.asp?lg=fr 

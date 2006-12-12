From: "Jeff Bailey" <jbailey@raspberryginger.com>
Subject: Re: [parisc-linux] kernel BUG at mm/mmap.c:1990
Date: Mon, 11 Dec 2006 19:18:54 -0500
Message-ID: <5b2e36650612111618v55753f4fi54684fb478f1943b__31103.4403778196$1416624230$gmane$org@mail.gmail.com>
References: <200612112338.13980.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8;
  format=flowed
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Helge Deller" <deller@gmx.de>
Return-Path: <jbailey@raspberryginger.com>
In-Reply-To: <200612112338.13980.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

On 11/12/06, Helge Deller <deller@gmx.de> wrote:
> Maybe someone has an idea ?
>
> The "adjtimex02" test from the Linux Test Project (http://ltp.sf.net) seems to pass all test, but triggers a kernel BUG in mm/mmap.c:1990 when exiting.
> strace is attached below.
>
>
> kernel BUG at mm/mmap.c:1990!

8< (snip)

I posted a reduced testcase to trigger this several months ago, if
that would be useful to you.  I don't have it handy, though.

-- 
Jeff Bailey - http://www.raspberryginger.com/jbailey/

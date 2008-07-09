From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [PATCH] drop superfluous .align 16
Date: Wed, 9 Jul 2008 08:14:13 -0400
Message-ID: <119aab440807090514o282301a9g6ef05149dbca3efb@mail.gmail.com>
References: <200807082206.36288.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: "Kyle McMartin" <kyle@mcmartin.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	"Randolph Chung" <tausq@parisc-linux.org>
To: "Helge Deller" <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200807082206.36288.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Jul 8, 2008 at 4:06 PM, Helge Deller <deller@gmx.de> wrote:
> This .align 16 is misplaced and should be in front of the ENTRY(lws_lock_start).
> Works because of pure luck since we have a .align PAGE_SIZE before it instead.

This is not true, the .align 16 aligns almost any object in the
subsection including .word.

However, it is superfluous since we have a .align PAGE_SIZE, but I was
probably being safe in the event that someone put an object before
lws_lock_start.

> Signed-off-by: Helge Deller <deller@gmx.de>
>
> --- a/arch/parisc/kernel/syscall.S
> +++ b/arch/parisc/kernel/syscall.S
> @@ -640,7 +640,6 @@ END(sys_call_table64)
>        .align  PAGE_SIZE
>  ENTRY(lws_lock_start)
>        /* lws locks */
> -       .align 16
>        .rept 16
>        /* Keep locks aligned at 16-bytes */
>        .word 1

Cheers,
Carlos.

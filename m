Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4D8894841
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Nov 2003 02:51:37 -0700 (MST)
Date: Mon, 10 Nov 2003 10:51:32 +0100
Message-ID: <3F969FFE00009D32@ocpmta2.freegates.net>
In-Reply-To: <20031110044556.GB16478@colo.lackof.org>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] fdisk problems 2.4 <-> 2.6
To: "Grant Grundler" <grundler@parisc-linux.org>
Cc: "Matthew Wilcox" <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org,
	"Grant Grundler" <grundler@parisc-linux.org>
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

That is Ok for me, Do you still have the patch to revert it?

Joel

>-- Original Message --
>From: Grant Grundler <grundler@parisc-linux.org>
>To: Joel Soete <soete.joel@tiscali.be>
>Cc: Matthew Wilcox <willy@debian.org>,
>	parisc-linux@lists.parisc-linux.org,
>	Grant Grundler <grundler@parisc-linux.org>
>Date: Sun, 9 Nov 2003 21:45:56 -0700
>Subject: Re: [parisc-linux] fdisk problems 2.4 <-> 2.6
>
>
>On Sun, Nov 09, 2003 at 06:59:48PM +0000, Joel Soete wrote:
> Just for remainder here is the alignement of uaccess.h (i just finished

> to test on my c110 :)):
> ----------><----------
> --- uaccess.h.orig      2004-04-20 21:03:59.000000000 +0200

>> +++ uaccess.h   2003-11-09 18:47:06.000000000 +0100
> @@ -42,8 +42,8 @@
>  #if BITS_PER_LONG == 32
>  #define LDD_KERNEL(ptr) __get_kernel_bad();
>  #define LDD_USER(ptr) __get_user_bad();
> -#define STD_KERNEL(x, ptr) __put_kernel_asm64((u32)x,
>tr)
> -#define STD_USER(x, ptr) __put_user_asm64((u32)x,ptr)
> +#define STD_KERNEL(x, ptr) __put_kernel_asm64((u64)x,ptr)
> +#define STD_USER(x, ptr) __put_user_asm64((u64)x,ptr)

willy just removed the (u32) cast and things seem to work for him.

>Do you need the (u64) cast?

...
> -static inline void __put_kernel_asm64(u64 x, void *ptr)
...
> +#define __put_kernel_asm64(x, ptr)                         \
...

Why replace the static inline with a macro?
static inline provides type checki
>g and
type "coercion" when it's not exactly right.

> +       __asm__ __volatile__ (                              \
> +               "\n1:\tstw\t%2,0(%1)\n"                     \
> +               "2:\tstw\t%R2,4(%1)\n"                      \


>hat is "%R2" intended to be?
Randolph pointed out this is broken before and I was wrong
to commit this chunk to the 2.4 tree (I'm working on
removing it now).

thanks,
grant
_______________________________________________
parisc-linux mailing l
>st
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux



-------------------------------------------------------------------------
Tiscali ADSL: 3 mois GRATUITS! L'Internet rapide, c'est pour tout le monde.

http://reg.tiscali.be/default.asp?lg=fr

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id SAA29897
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 Jan 2001 18:59:23 -0700
Sender: rbrad@mailserv2.iuinc.com
Message-ID: <3A6F8964.86BA78A2@uswest.net>
Date: Wed, 24 Jan 2001 19:03:16 -0700
From: Ryan Bradetich <rbradetich@uswest.net>
MIME-Version: 1.0
To: Greg Ingram <ingram@symsys.com>
CC: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] [PATCH] typo fix
References: <Pine.LNX.4.21.0101240943360.25434-100000@maestro.symsys.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Greg,

I can apply this patch if it really bothers you :)

Otherwise I am hoping to have the hack removed out of the ccio driver
with in a week.  I have already taken it out of my local tree, and just need
to finish up one small part of the I/O tree before committing it.

- Ryan

Greg Ingram wrote:

> That patch I sent last week has a letter O instead of a zero in the 'C100'
> string in the comment.  Only one.  What were my fingers doing?
>
> --- ccio-dma.c.orig     Wed Jan 24 09:39:22 2001
> +++ ccio-dma.c  Wed Jan 24 09:39:38 2001
> @@ -1523,7 +1523,7 @@
>  ** that can't be detected by PA/EISA/PCI bus walks.
>  */
>         switch((unsigned long)d->hpa) {
> -        case 0xf5fbf000L:       /* C1O0 (wild guess!) */
> +        case 0xf5fbf000L:       /* C100 (wild guess!) */
>         case 0xf3fbf000L:       /* C110 IOA0 LBC (aka GSC port) */
>         case 0xf7fbf000L:       /* C110 IOA0 LBC (aka GSC port) */
>         case 0xf203f000L:       /* C180/C200/240/C360 IOA0 LBC (aka GSC port) */
>
> - Greg
>
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.

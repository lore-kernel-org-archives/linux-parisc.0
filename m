Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail-ob01.one.net.au (mail-ob01.one.net.au [61.12.0.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 65695482A
	for <parisc-linux@parisc-linux.org>; Wed,  2 May 2001 03:05:05 -0600 (MDT)
Received: Received: [from squeak.local (async152-ade-isp-7.nas.one.net.au [203.101.92.153])
	by mail-ob01.one.net.au  with SMTP id f42958K04758
	for <parisc-linux@parisc-linux.org>; Wed, 2 May 2001 19:05:09 +1000 (EST)]
From: amodra@one.net.au
Date: Wed, 2 May 2001 18:35:50 +0930
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Bizarre linking problems with glibc
Message-ID: <20010502183550.A5494@squeak.one.net.au>
References: <20010502085517.J18144@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010502085517.J18144@parcelfarce.linux.theplanet.co.uk>; from matthew@wil.cx on Wed, May 02, 2001 at 08:55:17AM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Wed, May 02, 2001 at 08:55:17AM +0100, Matthew Wilcox wrote:
> --- elf/dl-error.c      2001/04/25 18:39:32     1.6.2.1
> +++ elf/dl-error.c      2001/05/01 23:10:34
> @@ -154,6 +154,8 @@ _dl_catch_error (const char **objname, c
>        return 0;
>      }
>  
> +printf("_dl_catcherror: we longjmped\n");
> +
> 
Use _dl_sysdep_output (int fd, const char *msg, ...).

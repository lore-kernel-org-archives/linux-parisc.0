Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id FAA12966
	for <parisc-linux@puffin.external.hp.com>; Wed, 6 Dec 2000 05:21:03 -0700
Received: from sleepie.demon.co.uk (HELO rhirst.linuxcare.com) (194.222.23.208)
  by mailserv2.iuinc.com with SMTP; 6 Dec 2000 12:23:39 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 15AA8B005; Wed,  6 Dec 2000 12:18:55 +0000 (GMT)
Date: Wed, 6 Dec 2000 12:18:55 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] hppa64 gcc sizeof() bug?
Message-ID: <20001206121855.S7166@linuxcare.com>
References: <20001206115203.Q7166@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20001206115203.Q7166@linuxcare.com>; from rhirst@linuxcare.com on Wed, Dec 06, 2000 at 11:52:03AM +0000
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Dec 06, 2000 at 11:52:03AM +0000, Richard Hirst wrote:
> Hi Alan,
>   The following shows the compiler getting confused over the size
> of a struct.  This is with a gcc/binutils built since the last
> fix you did for me.
> 
> Richard
> 
> 
> [rhirst@rhirst play]$ cat tc.c
> 
> 
> typedef unsigned int u32;
> #define NULL ((void *)0)
> 
> struct kernel_sym32 {
>         u32 value;
>         char name[60];
> };
> 
> extern int sys_get_kernel_syms(void *);
> extern int thing(struct kernel_sym32 *table);
> 
> int sys32_get_kernel_syms(struct kernel_sym32 *table)
> {
>         int len, i;
> 
>         len = sizeof (struct kernel_sym32);
>         for (i = 0; i < len; i++, table += sizeof (struct kernel_sym32)) {
>                 if (thing(table))
>                         break;
>         }
>         return i;
> }

Just changed it to 'table += 64' and it still generates code that
adds 4096, so sizeof is not relevant.

Richard

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA25030
	for <parisc-linux@puffin.external.hp.com>; Fri, 17 Nov 2000 13:11:14 -0700
Received: from sleepie.demon.co.uk (HELO rhirst.linuxcare.com) (194.222.23.208)
  by mailserv2.iuinc.com with SMTP; 17 Nov 2000 20:13:10 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 6BA46B007; Fri, 17 Nov 2000 20:10:34 +0000 (GMT)
Date: Fri, 17 Nov 2000 20:10:34 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Ulrich Drepper <drepper@cygnus.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] SEGV signal handling bug (dynamic linking)
Message-ID: <20001117201034.J32715@linuxcare.com>
References: <20001117153954.H32715@linuxcare.com> <m3hf5634qx.fsf@otr.mynet.cygnus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <m3hf5634qx.fsf@otr.mynet.cygnus.com>; from drepper@redhat.com on Fri, Nov 17, 2000 at 09:09:10AM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Nov 17, 2000 at 09:09:10AM -0800, Ulrich Drepper wrote:
> Richard Hirst <rhirst@linuxcare.com> writes:
> 
> >         mem = malloc(8192);
> >         if (mem == NULL) {
> >                 perror("malloc");
> >                 exit(1);
> >         }
> >         mem = (char *)(((int)mem + 4095) & ~0x0fff);
> >         res = mprotect(mem, 4096, PROT_READ);
> 
> Read the Unix standard:
> 
>   The behavior of this function is unspecified if the mapping was not
>   established by a call to mmap().

Changed my prog to use mmap and get the same problem.

Richard

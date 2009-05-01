From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] fix ldcw inline assembler
Date: Fri, 1 May 2009 17:37:18 -0400
Message-ID: <20090501213717.GA19522@hiauly1.hia.nrc.ca>
References: <49FA1AA1.3060104@gmx.de> <119aab440905011118lbc3bcectfd5862477c2598a8@mail.gmail.com>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>,
	Thibaut VARENE <varenet@debian.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440905011118lbc3bcectfd5862477c2598a8@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 01 May 2009, Carlos O'Donell wrote:

> Historical note...
> 
> We clobber all of memory in userspace, like this:
> ~~~
> #define __ldcw(a) \
> ({                                                                      \
>   unsigned int __ret;                                                   \
>   __asm__ __volatile__("ldcw 0(%1),%0"                                  \
>                        : "=r" (__ret) : "r" (a) : "memory");            \
>   __ret;                                                                \
> })
> ~~~
> I wonder if I should change that to match the kernel?

The above is perfectly safe.  I believe the kernel provides a memory
barrier when necessary.  There's a discussion somewhere in the mail
archives.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

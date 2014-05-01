From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] parisc,metag: Do not hardcode maximum userspace stack
 size
Date: Thu, 01 May 2014 10:50:36 -0700
Message-ID: <1398966636.2174.21.camel@dabdike>
References: <20140430212602.GA20601@p100.fritz.box>
	 <53622DBA.807@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Cc: Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	John David Anglin <dave.anglin@bell.net>,
	linux-metag@vger.kernel.org
To: James Hogan <james.hogan@imgtec.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <53622DBA.807@imgtec.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


> +
> +config MAX_STACK_SIZE_MB
> +	int "Maximum user stack size (MB)"
> +	default 80
> +	range 8 256 if METAG
> +	range 8 2048
> +	depends on STACK_GROWSUP
> +	help
> +	  This is the maximum stack size in Megabytes in the VM layout of user
> +	  processes when the stack grows upwards (currently only on parisc and
> +	  metag arch). The stack will be located at the highest memory address
> +	  minus the given value, unless the RLIMIT_STACK hard limit is changed
> +	  to a smaller value in which case that is used.
> +
> +	  A sane initial value is 80 MB.

There's one final issue with this: placement of the stack only really
matters on 32 bits.  We have three expanding memory areas: stack, heap
and maps.  On 64 bits these are placed well separated from each other on
64 bits, so an artificial limit like this doesn't matter.

Also, even on 32 bits, I can't help feeling we could simply layout the
binary better ... the problem is we have three upward growing regions:
stack, maps and   heap.  However, if you look at the current standard elf
layout for downward growing stacks, the maps grow up from the bottom
until it hits the mapped binary, the heap grows up from the mapped
binary and the stack grows down from the top.  You run out of memory
when the stack and heap cross or when the maps hits the binary.
Obviously with three upwardly growing regions, it's problematic, but we
could do something like make the maps grow down (can't, unfortunately,
make the heap grow down since sbrk depends on the upward behaviour).


James



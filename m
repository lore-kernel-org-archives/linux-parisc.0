Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Enrik Berkhan <Enrik.Berkhan@planb.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] serial baud_base, high baud rates and divisors 
In-Reply-To: Message from Enrik Berkhan <Enrik.Berkhan@planb.de>
   of "Thu, 07 Feb 2002 13:08:52 +0100." <20020207130852.C3306@electra.intern.planb.de>
References: <20020207130852.C3306@electra.intern.planb.de> 
Date: Thu, 07 Feb 2002 09:31:07 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020207163107.5E08A482A@dsl2.external.hp.com>
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

Enrik Berkhan wrote:
> Investigating on
> that I've found some oddities concerning setserial, baud_base and
> the divisor calculation in the serial driver ...

good work.

...
>   Memory mapped parisc ports all have port == 0, so this has to fail.
>   Temporary workaround: `setserial /dev/ttyS1 port 0x10000 ...' once
>   will prevent the above loop from finding conflicts.
> 
> So, the following things have to be fixed:
> 
> - get/set_serial_info have to be enhanced for memory mapped ports
> - setserial should be enhanced accordingly

If other non-intel architectures don't have a solution for this.
My first thought was to assign fake port addresses.

Do PCI serial cards also use MMIO?

> - divisor calculation should be changed at least to round to nearest,
>   not round towards zero, or LASI ports might still suffer from the first
>   problem _if_ they really have baud_base 454545
> - baud_base should be initialized correctly for other gsc based ports.

We'd have to dig a bit for documentation on this.
Please poke me offline if that doesn't happen in the next week or so.

> If someone can confirm my analysis and tell me the direction of how to
> fix these things I would be willing to work on it (shouldn't be hard,
> maybe boring ;-).

cool - thanks,

grant

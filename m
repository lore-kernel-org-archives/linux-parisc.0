Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.planb.de (aldebaran.planb.de [212.227.14.26])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0C924482B
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Feb 2002 04:14:08 -0700 (MST)
Date: Fri, 8 Feb 2002 12:14:05 +0100
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] serial baud_base, high baud rates and divisors
Message-ID: <20020208121405.C5128@electra.intern.planb.de>
References: <20020207130852.C3306@electra.intern.planb.de> <20020207163107.5E08A482A@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <20020207163107.5E08A482A@dsl2.external.hp.com>
From: Enrik Berkhan <Enrik.Berkhan@planb.de>
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

On Thu, Feb 07, 2002 at 09:31:07AM -0700, Grant Grundler wrote:
> > - get/set_serial_info have to be enhanced for memory mapped ports
> > - setserial should be enhanced accordingly
> 
> If other non-intel architectures don't have a solution for this.
> My first thought was to assign fake port addresses.

Looks like most other architectures have their own code even when
using 16450 like UARTs (e.g. arch/mips/au1000/common/serial.c).
Especially set_serial_info is architecture dependent, because it just
doesn't make much sense to fiddle with irq and port settings on
parisc, does it? Faking port adresses could be a workaround, but it's
not clean as it might make the ports show up in /proc/ioports ...

But enhancing the test for doubly assigned ports to

      if ((rs_table[i].port == port) &&
          (rs_table[i].iomem_base == req->iomem_base))

might be ok. This code can be found in register_serial().

BTW, drivers/gsc/serial.c does no request_mem_region(). Is this in-
tentional?

> Do PCI serial cards also use MMIO?

I don't know.

> > - baud_base should be initialized correctly for other gsc based ports.
> 
> We'd have to dig a bit for documentation on this.
> Please poke me offline if that doesn't happen in the next week or so.

The hardball ers states a 7.3728MHz (== 16 * 460800) baud rate clock,
which confirms the output of my DMM. So we would need a table holding
the baud_base for each device?

Enrik
-- 
Enrik Berkhan                                         plan b. GmbH
                                                      Rüppurrer Straße 4
+49-721-388582 (voice)                                76137 Karlsruhe
+49-721-388581 (fax)                                  Germany

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Enrik Berkhan <Enrik.Berkhan@planb.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] serial baud_base, high baud rates and divisors 
In-Reply-To: Message from Enrik Berkhan <Enrik.Berkhan@planb.de>
   of "Fri, 08 Feb 2002 12:14:05 +0100." <20020208121405.C5128@electra.intern.planb.de>
References: <20020207130852.C3306@electra.intern.planb.de> <20020207163107.5E08A482A@dsl2.external.hp.com>  <20020208121405.C5128@electra.intern.planb.de> 
Date: Sat, 09 Feb 2002 23:50:20 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020210065020.DCE6A482A@dsl2.external.hp.com>
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
> But enhancing the test for doubly assigned ports to
> 
>       if ((rs_table[i].port == port) &&
>           (rs_table[i].iomem_base == req->iomem_base))
> 
> might be ok. This code can be found in register_serial().

Yeah - you are right.

> BTW, drivers/gsc/serial.c does no request_mem_region(). Is this in-
> tentional?

probably. Check if an entry for serial exists in /prc/iomem.
At one point, the device discover code was changed to automatically
do the request_mem_region() devics firmware told us about.

> The hardball ers states a 7.3728MHz (== 16 * 460800) baud rate clock,
> which confirms the output of my DMM. So we would need a table holding
> the baud_base for each device?

Dunno. We might given different generations of HW.

grant

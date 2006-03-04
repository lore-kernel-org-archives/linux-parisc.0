From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] alternate insn for parisc (ccio/sba)
Date: Sat, 04 Mar 2006 11:21:41 +0800
Message-ID: <440907C5.7050503@tausq.org>
References: <20060303201428.GA25283@quicksilver.road.mcmartin.ca>
	<20060304003802.GB18473@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
Cc: parisc-linux@lists.parisc-linux.org,
 Kyle McMartin <kyle@parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060304003802.GB18473@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Anyplace we use asm that could be different for PA20 vs PA11.
> __ffs() in include/asm/bitops.h probaby isn't the best example
> but it might be good enough to give an idea.
> Ie kernel built for PA11 could be optimized for PA20-32bit.

Just my 2 cents, but unless it is code that is performance critical and
we can demonstrate a significant difference on a particular measurement,
and it is not something that can be determined at compile time, I think
we should do runtime code patching sparingly. If nothing else, it makes
the code harder to read and perhaps to debug.

>> Also, if you want to test it, you'll need to remove the & ~_PAGE_WRITE from
>> PAGE_KERNEL_RO in asm/pgtable.h until we write protect the kernel at a
>> later stage.

Right - it seems we should re-map the kernel read-only after you patch
the insns.

> very cool! ++kyle. :)

it is cool, thanks for working on this, Kyle.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

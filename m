Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] iodc call and HPMC: dump driver. 
In-Reply-To: Message from Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
   of "Mon, 02 Sep 2002 08:12:26 +0200." <3D73014A.15ED96ED@admin.france.hp.com>
References: <3D73014A.15ED96ED@admin.france.hp.com> 
Date: Mon, 02 Sep 2002 22:50:49 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020903045049.E268F4829@dsl2.external.hp.com>
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

Bruno Vidal wrote:
> ret =  real32_call(PAGE0->mem_boot.iodc_io,
	ARG0	(unsigned long)PAGE0->mem_boot.hpa,
	ARG1	DUMPDEV_WRITE,
	ARG2	PAGE0->mem_boot.spa
	ARG3	__pa(PAGE0->mem_boot.dp.layers)
	ARG4	__pa(pdc_result)
	ARG5	devaddr
	ARG6	__pa(iodc_dbuf)
	ARG7	2048);

The parameters "look" ok.

> DUMPDEV_WRITE = 1
> static unsigned long pdc_result[32] __attribute__ ((aligned (8))); 
> static char __attribute__((aligned(64))) iodc_dbuf[DUMP_PAGE_SZ];
> 
> and devaddr=191889408

except the value of this one. I'm pretty sure now it's wrong.

IO ACD, page 520 of 646 (aka 13-48) says:
Description:    The argument reqsize specifies the amount of data that the
	caller would like to write. It must be a multiple of 2 Kbytes, but
	is otherwise unconstrained. The data to write is in memory at the
	address specified by memaddr. The value of memaddr must be a multiple
	of 64 bytes. The address on the device medium, devaddr, must be 2
	Kbyte aligned. If the call returns a nonnegative status, the return
	parameter count is the number of bytes actually output; it must be a
	multiple of 2 Kbytes. If the call returns a negative status, the
	value of count and the data written are HVERSION dependent.

IO ACD, page 491 of 646 (aka 13-19) says:
13.3.8  Data Types
The data types of the standard arguments and return parameters are as follows:
· All signed integers are represented in two's complement (32-bit) format.
· The status value returned by all IODC entry points in GR28 is a signed integer.
· All addresses, which are passed as arguments, or returned as parameters, are 32-bit unsigned integers.
· The data type of ARG0 in all IODC entry points is a 32-bit unsigned integer.
· The data type of ARG1 in all IODC entry points is a 32-bit unsigned integer.

One might assume devaddr is treated as an "unsigned" integer.
But most older IODC are broken and treat it as a signed value.
(ie anything shipped before ~1996-1998)

I wouldn't trust newer boxes to get it right either.
Once you get ENTRY_IO_BOOT_OUT working, I suggest trying to
use ENTRY_IO_BBLOCK_OUT that's now defined in <asm/pdc.h> first
and if that fails (not implemented), fall back to ENTRY_IO_BOOT_OUT.

hth,
grant

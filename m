From: Helge Deller <deller@gmx.de>
Subject: Re: [RFC] fix the relative jump problem on large modules
Date: Sun, 20 Jun 2010 00:21:10 +0200
Message-ID: <4C1D42D6.9050606@gmx.de>
References: <1276873407.2850.35.camel@mulgrave.site> <4C1BD9B9.200@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4C1BD9B9.200@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 06/18/2010 10:40 PM, Helge Deller wrote:
> On 06/18/2010 05:03 PM, James Bottomley wrote:
>> Part of this arguing with ksplice about their plan for
>> -ffunction-sections and -fdata-sections got me thinking about how we do
>> modules.  Right at the moment we have one section for every function in
>> a module, which leads to a massive amount of relocation overhead in the
>> in-kernel module loader.  Plus for some modules (ipv6, I believe), we
>> lack the relative jumps to get out of the function because we only put
>> the stubs after all the text sections.
>>
>> The way to fix all of this, I think, is to make the real linker do more
>> work.  It should be beneficial to us because the linker *should* be able
>> to rearrange the sections to get the maximum number of jumps satisfiable
>> relatively.
>>
>> I've tested that this works on pa8800 systems, but I'd really like
>> someone to try a failing module on a 32 bit platform (since 64 bits has
>> 22 bit relative jumps, all the modules actually work).
> 
> Hi James,
> 
> I think there is no failing module on 32bit right now.
> The biggest modules were ipv6.ko and xfs.ko, which do work now
> since the latest module changes.
> 
> But if your patch saves relocations it's a win nevertheless.
> I can't test your patch right now, but will try tomorrow evening....

Hi James,

I just tested your patch on a 32bit kernel.

The wins wrt module size is good:
ipv6.ko:	415K -> 357K
xfs.ko:		902K -> 747K
(btw, what is the command you ran to count the sections and relocs?).

But your patch doesn't work on 32bit.
root@c3000:~# modprobe xfs
FATAL: Error inserting xfs (/lib/modules/2.6.35-rc3-32bit+/kernel/fs/xfs/xfs.ko): Invalid module format

dmesg says:
module xfs relocation of symbol memcpy is out of range (0x3ffeffaa in 17 bits)

That's exactly the problem, and this reminded me on what my latest patch to
the linux kernel module loader on hppa did.

Just look at the weak function arch_mod_section_prepend() in arch/parisc/kernel/module.c,
and at the top of that file:

 *    Notes:
 *    - PLT stub handling
 *      On 32bit (and sometimes 64bit) and with big kernel modules like xfs or
 *      ipv6 the relocation types R_PARISC_PCREL17F and R_PARISC_PCREL22F may
 *      fail to reach their PLT stub if we only create one big stub array for
 *      all sections at the beginning of the core or init section.
 *      Instead we now insert individual PLT stub entries directly in front of
 *      of the code sections where the stubs are actually called.
 *      This reduces the distance between the PCREL location and the stub entry
 *      so that the relocations can be fulfilled.
 *      While calculating the final layout of the kernel module in memory, the
 *      kernel module loader calls arch_mod_section_prepend() to request the
 *      to be reserved amount of memory in front of each individual section.

So, your patch merges all text sections, which then let the new kernel
module loader fail on 32bit since it's only one big section with too long distances...

Helge


>> You can see some
>> of the savings in the scsi_mod.ko
>>
>> Before: 325 sections, 6366 relocation symbols
>> After: 23 sections, 5244 relocation symbols
>>
>> James
>>
>> ---
>>
>> diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
>> index 55cca1d..ab88f11 100644
>> --- a/arch/parisc/Makefile
>> +++ b/arch/parisc/Makefile
>> @@ -21,6 +21,7 @@ KBUILD_DEFCONFIG := default_defconfig
>>  
>>  NM		= sh $(srctree)/arch/parisc/nm
>>  CHECKFLAGS	+= -D__hppa__=1
>> +LDFLAGS_MODULE	+= -T $(srctree)/arch/parisc/kernel/module.lds
>>  
>>  MACHINE		:= $(shell uname -m)
>>  ifeq ($(MACHINE),parisc*)
>> diff --git a/arch/parisc/kernel/module.lds b/arch/parisc/kernel/module.lds
>> new file mode 100644
>> index 0000000..42ee3eb
>> --- /dev/null
>> +++ b/arch/parisc/kernel/module.lds
>> @@ -0,0 +1,6 @@
>> +SECTIONS {
>> +	.text : {
>> +		/* Gather all function sections */
>> +		*(.text.*)
>> +	}
>> +}

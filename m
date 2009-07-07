From: Helge Deller <deller@gmx.de>
Subject: Re: parisc: unwind tables and backtraces broken?
Date: Tue, 07 Jul 2009 20:01:46 +0200
Message-ID: <4A538D8A.70002@gmx.de>
References: <4A527397.7060306@gmx.de> <4A52B98E.2070708@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	Carlos O'Donell <carlos@systemhalted.org>
To: Randolph Chung <randolph@tausq.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4A52B98E.2070708@tausq.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 07/07/2009 04:57 AM, Randolph Chung wrote:
> Helge,
>
>> but the unwind table when running the kernel with the attached patch
>> (see below) shows:
>> ...
>> unwind_init: start = 0x105fb3c0, end = 0x10634f30, entries = 14775
>> unwind 1: 100ff900 - 100ffa80, len=385
>> unwind 2: 100ffa84 - 100ffad4, len=81
>> unwind 3: 100ffad8 - 100ffb2c, len=85
>> unwind 4: 100ffb30 - 100ffbc8, len=153
>> unwind 5: 100ffbcc - 100ffc38, len=109
>> unwind 6: 100ffc3c - 100ffc9c, len=97
>> unwind 7: 100ffca0 - 100ffd00, len=97
>> unwind 8: 100ffd04 - 100ffd64, len=97
>> unwind 9: 100ffd68 - 100ffdc8, len=97
>> unwind 10: 100ffdcc - 100ffdec, len=33
>>
>> From this table I don't even understand the values of the very first
>> entry (unwind 1: 100ff900 - 100ffa80).
>> This does not resolve to any entry in the assembly.
> I am a little fuzzy on the details, but the numbers printed above are
> what is stored in the unwind table. This does not correspond with the
> actual address in memory, which is adjusted by an offset. In the case of
> kernel symbols, this offset is KERNEL_START (this is a parameter passed
> to unwind_table_init()

The addresses given above already got the offset added. They are wrong
nevertheless.

>> My assumption:
>> When the linker creates the long-distance jump table, it does not adjusts
>> the values in the unwind table.
> this used to work.....

Yes.
Interestingly, this problem showed up to me now since I updated my 32- and
64bit crosscompilers to 4.3.3 (and binutils of course).
I used (on 32bit) the gcc-3.3 before and this one doesn't exibited the
problem of buggy unwind tables (with the existing/same kernel source code).

>> Second, when the linker discards attribute-weak functions,
>> it doesn't deletes/adjusts the unwind table entries of the deleted
>> functions either.
> can you try this with a userspace program? gdb uses this same unwind
> information to do backtraces. if the unwind info is wrong gdb will be
> very broken.

I'll try, but I assume userspace is ok. If it wouldn't be, Dave probably
won't be able to debug the other userspace issues (the segv-thread on debian's
buildds).
  
> On the other hand, the kernel does use a more complex linker script so
> it is possible that some options in the linker script is triggering some
> bug.

Yes, maybe. But again, I think gcc-3.3 (and the old binutils) could handle this gracefully.

Helge

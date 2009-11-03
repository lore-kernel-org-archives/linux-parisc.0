From: Helge Deller <deller@gmx.de>
Subject: Re: Out of order unwind entry warning
Date: Tue, 03 Nov 2009 23:04:43 +0100
Message-ID: <4AF0A8FB.2000504@gmx.de>
References: <20091103215408.7B0AD4E0B@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org,
	carlos@systemhalted.org, randolph@tausq.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091103215408.7B0AD4E0B@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 11/03/2009 10:54 PM, John David Anglin wrote:
>> On 11/03/2009 10:36 PM, John David Anglin wrote:
>>>> Unwind section '.PARISC.unwind' at offset 0x11c contains 3 entries:
>>>>
>>>> <libcrc32c_mod_fini>: [0x0-0x2c]
>>>>            Entry_GR=1 Save_SP Save_RP Total_frame_size=8
>>>> <libcrc32c_mod_init>: [0x0-0x44]
>>>>            Entry_GR=1 Save_SP Save_RP Total_frame_size=8
>>>> <crc32c>: [0x0-0x6c]
>>>>            Entry_GR=2 Save_SP Save_RP Total_frame_size=8
>>>
>>> What do you see for '.rela.PARISC.unwind'?
>>>
>>> I suspect that this is a problem in handling the R_PARISC_SEGREL32
>>> relocations is the kernel loader.  The above would be fine if
>>> libcrc32c_mod_fini and libcRc32c_mod_init are in different sections
>>> (.exit.text and .inti.text).
>>
>> Relocation section '.rela.PARISC.unwind' at offset 0x9b8 contains 6 entries:
>>    Offset     Info    Type            Sym.Value  Sym. Name + Addend
>> 00000000  00000231 R_PARISC_SEGREL32 00000000   .exit.text + 0
>> 00000004  00000231 R_PARISC_SEGREL32 00000000   .exit.text + 2c
>> 00000010  00000331 R_PARISC_SEGREL32 00000000   .init.text + 0
>> 00000014  00000331 R_PARISC_SEGREL32 00000000   .init.text + 44
>> 00000020  00000431 R_PARISC_SEGREL32 00000000   .text.crc32c + 0
>> 00000024  00000431 R_PARISC_SEGREL32 00000000   .text.crc32c + 6c
>
> That's exactly what I expected.  There's no overlap.  The module
> loader needs to sort the unwind entries after doing the relocations.

It's already sorting the entries, but creating the relocation is currently a hack.

See top of arch/parisc/kernel/module.c:
  *    - SEGREL32 handling
  *      We are not doing SEGREL32 handling correctly. According to the ABI, we
  *      should do a value offset, like this:
  *                      if (in_init(me, (void *)val))
  *                              val -= (uint32_t)me->module_init;
  *                      else
  *                              val -= (uint32_t)me->module_core;
  *      However, SEGREL32 is used only for PARISC unwind entries, and we want
  *      those entries to have an absolute address, and not just an offset.
  *
  *      The unwind table mechanism has the ability to specify an offset for
  *      the unwind table; however, because we split off the init functions into
  *      a different piece of memory, it is not possible to do this using a
  *      single offset. Instead, we use the above hack for now.

If we change this, don't we require a binutils update then at the same time from the users?

Helge

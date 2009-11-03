From: Helge Deller <deller@gmx.de>
Subject: Re: Out of order unwind entry warning
Date: Tue, 03 Nov 2009 22:43:05 +0100
Message-ID: <4AF0A3E9.6060302@gmx.de>
References: <20091103213603.9576D4FB2@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org,
	carlos@systemhalted.org, randolph@tausq.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091103213603.9576D4FB2@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 11/03/2009 10:36 PM, John David Anglin wrote:
>> Unwind section '.PARISC.unwind' at offset 0x11c contains 3 entries:
>>
>> <libcrc32c_mod_fini>: [0x0-0x2c]
>>           Entry_GR=1 Save_SP Save_RP Total_frame_size=8
>> <libcrc32c_mod_init>: [0x0-0x44]
>>           Entry_GR=1 Save_SP Save_RP Total_frame_size=8
>> <crc32c>: [0x0-0x6c]
>>           Entry_GR=2 Save_SP Save_RP Total_frame_size=8
>
> What do you see for '.rela.PARISC.unwind'?
>
> I suspect that this is a problem in handling the R_PARISC_SEGREL32
> relocations is the kernel loader.  The above would be fine if
> libcrc32c_mod_fini and libcRc32c_mod_init are in different sections
> (.exit.text and .inti.text).

Relocation section '.rela.PARISC.unwind' at offset 0x9b8 contains 6 entries:
  Offset     Info    Type            Sym.Value  Sym. Name + Addend
00000000  00000231 R_PARISC_SEGREL32 00000000   .exit.text + 0
00000004  00000231 R_PARISC_SEGREL32 00000000   .exit.text + 2c
00000010  00000331 R_PARISC_SEGREL32 00000000   .init.text + 0
00000014  00000331 R_PARISC_SEGREL32 00000000   .init.text + 44
00000020  00000431 R_PARISC_SEGREL32 00000000   .text.crc32c + 0
00000024  00000431 R_PARISC_SEGREL32 00000000   .text.crc32c + 6c



From: Helge Deller <deller@gmx.de>
Subject: Re: 4.14 git: massive linker failures: cannot reach anything
Date: Mon, 11 Sep 2017 20:42:21 +0200
Message-ID: <93a0f9de-b175-2278-6ef1-ef0b0d796580@gmx.de>
References: <alpine.LRH.2.21.1709111713220.23935@math.ut.ee>
 <bd823006-04ae-0af3-30fb-10989a9729cc@bell.net>
 <alpine.LRH.2.21.1709111730140.23935@math.ut.ee>
 <a1de44d2-0557-45d9-60cf-31c0570ffe88@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>,
        Meelis Roos <mroos@linux.ee>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <a1de44d2-0557-45d9-60cf-31c0570ffe88@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 11.09.2017 16:51, John David Anglin wrote:
> On 2017-09-11 10:45 AM, Meelis Roos wrote:
>>>> hppa64-linux-ld: init/main.o(.text+0x22c): cannot reach
>>>> __ubsan_handle_type_mismatch
>>>> init/main.o: In function `initcall_blacklisted':(.text+0x22c): relocation
>>>> truncated to fit: R_PARISC_PCREL22F against symbol
>>>> `__ubsan_handle_type_mismatch' defined in .text.__ubsan_handle_type_mismatch
>>>> section in lib/ubsan.o
>>>>
>>>> and so on for pages, more than my terminal scrollback provides.
>>> As far as gcc goes, you need to add -mlong-calls to avoid these errors.  I
>>> think there is a config option. The kernel is too big and some "b,l" branches
>>> can't reach their targets.
>> Thank you, yes, I found CONFIG_MLONGCALLS for that.
>>
>> However, the next strange thing is why did custom kernels of multiple
>> different machines grew so much (A500 UP and RP3440 SMP kernels)? My
>> kernel configs are quite minimalistic anyway, except I include
>> everything needed for booting (no dependenc on initramfs, so sd, scsi
>> driver and ext4 are in). Perhaps a binary format or two, PDC stable
>> storage and anothe IO schaduler too, and some kernel debugging options
>> like UBSAN.

> UBSAN is huge.

Yes, UBSAN is huge and is probably the reason why you see so many linker errors.
Beside enabling CONFIG_MLONGCALLS in the kernel, you probably need to
update palo [1] to version 1.99 as well. Please remember to update palo in the
boot sector on the harddisc too (run: "palo -v" once), otherwise
palo may refuse to load your kernel because of it's size (even if it's
compressed with gzip).

Helge

[1] https://git.kernel.org/pub/scm/linux/kernel/git/deller/palo.git/

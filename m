From: John David Anglin <dave.anglin@bell.net>
Subject: Re: failure to link kernel 3.0.3 with cross binutils-2.21.1/gcc-4.6.1
Date: Tue, 13 Sep 2011 10:03:08 -0400
Message-ID: <4E6F629C.2040705@bell.net>
References: <CAFk90B8F17-o3HqRGygu8OUb-Ncurqi-Ui+_u9kfaqmQG5nK4Q@mail.gmail.com> <19867f38b905e3efcd5cb2d254dc5aa6.squirrel@webmail.sf-mail.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: Graham Gower <graham.gower@gmail.com>, linux-parisc@vger.kernel.org
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <19867f38b905e3efcd5cb2d254dc5aa6.squirrel@webmail.sf-mail.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 9/13/2011 3:48 AM, Rolf Eike Beer wrote:
>> grg@eye7:/mnt/1T/hppa/linux-3.0$ make vmlinux ARCH=parisc
>> CROSS_COMPILE=/tmp/hppa64/bin/hppa64-linux-
>>    CHK     include/linux/version.h
>>    CHK     include/generated/utsrelease.h
>>    CALL    scripts/checksyscalls.sh
>>    CHK     include/generated/compile.h
>>    LD      vmlinux.o
>>    MODPOST vmlinux.o
>>    GEN     .version
>>    CHK     include/generated/compile.h
>>    UPD     include/generated/compile.h
>>    CC      init/version.o
>>    LD      init/built-in.o
>>    LD      .tmp_vmlinux1
>>    KSYM    .tmp_kallsyms1.S
>>    AS      .tmp_kallsyms1.o
>>    LD      .tmp_vmlinux2
>> /tmp/hppa64/bin/hppa64-linux-ld:
>> arch/parisc/mm/built-in.o(.init.text+0xed0): cannot reach
>> flush_tlb_all_local
>> /tmp/hppa64/bin/hppa64-linux-ld: BFD (GNU Binutils) 2.21.1 internal
>> error, aborting at ../../binutils-2.21.1/bfd/elf64-hppa.c line 3956 in
>> elf64_hppa_relocate_section
>>
>> /tmp/hppa64/bin/hppa64-linux-ld: Please report this bug.
>>
>> make: *** [.tmp_vmlinux2] Error 1
>>
>> Any clues?
> Maybe related to this:
>
> http://sourceware.org/bugzilla/show_bug.cgi?id=13168
>
>
No, the 64-bit linker is different and doesn't have stub support for 
long calls.  The above
bug is a section merging problem (specifically comdat groups).  The 
merging prevents
the normal insertion of stub sections.  It wouldn't happen if cmake 
didn't use vague linking.

Dave

-- 
John David Anglin    dave.anglin@bell.net


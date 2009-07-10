From: Artem Alimarine <artem.alimarine@stromasys.com>
Subject: Re: Wierd code in Entry.S
Date: Fri, 10 Jul 2009 09:31:05 +0200
Message-ID: <4A56EE39.7040906@stromasys.com>
References: <4A55EC77.4040402@stromasys.com> <20090709225511.GE10979@lackof.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------040608030001050706060501"
Cc: linux-parisc@vger.kernel.org
To: unlisted-recipients:; (no To-header on input)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090709225511.GE10979@lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a multi-part message in MIME format.
--------------040608030001050706060501
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Grant,

My point is that IDTLBT (see page 7-65 in the PA-RISC 2.0w spec) expects 
the U-bit in 12th bit of the 64-bit DWORD, thus, in the upper part 
instead of the lower part (see the code at dtlb_miss_20w). As you said, 
the bit is set in the lower part. I still suspect that the wrong bit is 
set on a 64-bit machine.

The confusion comes from the fact that the The PA1.1 instruction IDTLBP 
expects  U-bit in the bit 12 of the WORD, whereas PA2.0 IDTLBT expects 
it in bit 12 of the DWORD.

Best regards,
Artem

Grant Grundler wrote:
> On Thu, Jul 09, 2009 at 03:11:19PM +0200, Artem Alimarine wrote:
>   
>> Hi guys,
>>
>> I am new to PARISC and to this forum. I have a small question. There is  
>> an instruction in entry.S that I do not understand. It is in the the  
>> macro make_insert_tlb
>>
>> Kernel 2.6.26.2:
>>
>> 537        /* Enforce uncacheable pages.
>> 538         * This should ONLY be use for MMIO on PA 2.0 machines.
>> 539         * Memory/DMA is cache coherent on all PA2.0 machines we support
>> 540         * (that means T-class is NOT supported) and the memory controllers
>> 541         * on most of those machines only handles cache transactions.
>> 542         */
>> 543        extrd,u,*=      \pte,_PAGE_NO_CACHE_BIT+32,1,%r0
>> 544        depi            1,12,1,\prot
>>
>>
>>     
>
> The "*=" in line 543 will determine if "depi" instruction (line 544)
> gets executed or not. You'll need the "PA-RISC 2.0 Architecture":
>     http://www.parisc-linux.org/documentation/index.html
>     http://ftp.parisc-linux.org/docs/arch/parisc2.0.pdf
>
> And read page 7-47, 7-48, and Table D-14.
>
>
>   
>> The DEPI instruction on a 64-bit machine sets bit 44=32+12,
>> whereas we use the value as the argument to IDTLBT, which expects bit 12  
>> to be used instead.
>>
>> Does it mean that the U-bit is never set and the  
>> authorization id gets corrupted???
>>     
>
> U-bit will get set only if _PAGE_NO_CACHE_BIT+32 is also set.
>
> The bit enumeration is *reverse* with MSb being 0 for all ASM instructions
> and all references in the PA2.0 Arch manual.
>
> Because this is a 64 bit build, "+32" is needed to refer to the lower half
> of the double word (word == 32 bits).
>
>   
>> Is it a bug or my misunderstanding of the code???
>>     
>
> It looks correct to me. "12" here always seems to refer to the U-bit as
> defined in the PA2.0 Arch manual.
>
> hth,
> grant
>
>   


--------------040608030001050706060501
Content-Type: text/x-vcard; charset=utf-8;
 name="artem_alimarine.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="artem_alimarine.vcf"

begin:vcard
fn:dr. Artem Alimarine
n:Alimarine;Artem
org:STROMASYS SA
adr:;;De Zaale 11;Eindhoven;;5612AJ;The Netherlands
email;internet:artem.alimarine@stromasys.com
title:Software Architect
tel;work:+31-40-2390863
tel;fax:+31-40-2390800
x-mozilla-html:FALSE
version:2.1
end:vcard


--------------040608030001050706060501--

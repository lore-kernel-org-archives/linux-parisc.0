From: Artem Alimarine <artem.alimarine@stromasys.com>
Subject: Re: unaligned accesses in apply_relocate_add
Date: Wed, 26 Aug 2009 16:41:20 +0200
Message-ID: <4A954990.7070007@stromasys.com>
References: <4A94F439.6010301@stromasys.com> <20090826131749.GE19494@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020705040506040408060702"
Cc: linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090826131749.GE19494@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a multi-part message in MIME format.
--------------020705040506040408060702
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

One point is that in the function apply_relocate_add a 4-byte aligned 
address is created:

627                dot = (Elf64_Addr)loc & ~0x03;
628                loc64 = (Elf64_Xword *)loc;

and used as a 64-bit location

711                case R_PARISC_DIR64:
712                        /* 64-bit effective address */
713                        *loc64 = val + addend;
714                        break;

So, 8-byte word is read with a 4-byte alignment.

I am busy building a parisc hardware emulator. It boots Linux, but it is 
unstable yet. There are unaligned accesses in the emulation trace. I was 
wandering whether it is normal behavior or caused by a bug in the 
emulation.

The emulation trace gives a lot of accesses like this:
0-4011f968: translate_virtual_write unaligned_trap, va=0:416a20c 
pa=1db1820c
0-4011f968: translate_virtual_write unaligned_trap, va=0:416a21c 
pa=1db1821c
0-4011f968: translate_virtual_write unaligned_trap, va=0:416a224 
pa=1db18224

They are indeed 4-byte aligned. The PC address matches 
apply_relocate_add in the kernel map.

Thanks,
Artem

Kyle McMartin wrote:
> On Wed, Aug 26, 2009 at 10:37:13AM +0200, Artem Alimarine wrote:
>  
>> Hi guys,
>>
>> I see unaligned access happening in apply_relocate_add. Is this 
>> normal  expected behavior?
>>
>> Kernel 2.6.26.2, single CPU (Standard Debian 5.0.2). Address 0x4011f968.
>>
>>     
>
> No, definitely not. relocations are applied to instructions, which
> should always be instruction-width (4 bytes) aligned... Since we do
> modify-replace on placeholders, it should never be using anything other
> than a store-word to do it... do you have any more data on this?
>
> regards, Kyle
>
>   


	
dr. Artem Alimarine <artem.alimarine@stromasys.com 
<mailto:artem.alimarine@stromasys.com>>
Software Architect
STROMASYS SA



Kyle McMartin wrote:
> On Wed, Aug 26, 2009 at 10:37:13AM +0200, Artem Alimarine wrote:
>   
>> Hi guys,
>>
>> I see unaligned access happening in apply_relocate_add. Is this normal  
>> expected behavior?
>>
>> Kernel 2.6.26.2, single CPU (Standard Debian 5.0.2). Address 0x4011f968.
>>
>>     
>
> No, definitely not. relocations are applied to instructions, which
> should always be instruction-width (4 bytes) aligned... Since we do
> modify-replace on placeholders, it should never be using anything other
> than a store-word to do it... do you have any more data on this?
>
> regards, Kyle
>
>   


--------------020705040506040408060702
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


--------------020705040506040408060702--

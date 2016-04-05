From: Helge Deller <deller@gmx.de>
Subject: Re: kernel 4.6-rc unbootable due to module changes
Date: Tue, 5 Apr 2016 20:54:18 +0200
Message-ID: <570409DA.1060508@gmx.de>
References: <alpine.LRH.2.02.1604051326470.14606@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.1604051332280.25453@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020504010304000507010802"
Cc: linux-parisc@vger.kernel.org
To: Mikulas Patocka <mpatocka@redhat.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.02.1604051332280.25453@file01.intranet.prod.int.rdu2.redhat.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a multi-part message in MIME format.
--------------020504010304000507010802
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 05.04.2016 19:36, Mikulas Patocka wrote:
> On Tue, 5 Apr 2016, Mikulas Patocka wrote:
> 
>> Hi
>>
>> The patch "parisc: Use generic extable search and sort routines" makes the 
>> kernel unable to load any modules. It fails with:
>>
>> module unix: Unknown relocation: 9
>> modprobe: FATAL: Error inserting unix (/lib/modules/4.6.0-rc2/kernel/net/unix/unix.ko): Invalid module format
>>
>> When I revert the patch, the kernel 4.6-rc2 boots fine.
>>
>> Apparently, the function apply_relocate_add in arch/parisc/kernel/module.c 
>> doesn't handle the new relocation type.
>>
>> Mikulas
> 
> BTW. I'm using hppa64 binutils 2.21 to build the kernel. It generates the 
> R_PARISC_PCREL32 relocation that the kernel module loader doesn't handle:


Can you try attached patch (untested) ?

Helge

 
> RELOCATION RECORDS FOR [__ex_table]:
> OFFSET           TYPE              VALUE
> 0000000000000000 R_PARISC_PCREL32  .text.unix_ioctl+0x0000000000000064
> 0000000000000004 R_PARISC_PCREL32  fixup_put_user_skip_1+0x0000000000000008
> 0000000000000008 R_PARISC_PCREL32  .text.unix_ioctl+0x00000000000000a8
> 000000000000000c R_PARISC_PCREL32  fixup_put_user_skip_1+0x0000000000000008
> 0000000000000010 R_PARISC_PCREL32  .text.unix_ioctl+0x00000000000000b4
> 0000000000000014 R_PARISC_PCREL32  fixup_put_user_skip_1+0x0000000000000008
> 0000000000000018 R_PARISC_PCREL32  .text.unix_ioctl+0x00000000000000c0
> 000000000000001c R_PARISC_PCREL32  fixup_put_user_skip_1+0x0000000000000008


--------------020504010304000507010802
Content-Type: text/x-diff;
 name="module.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="module.patch"

diff --git a/arch/parisc/kernel/module.c b/arch/parisc/kernel/module.c
index b9d75d9..f3bfd6a 100644
--- a/arch/parisc/kernel/module.c
+++ b/arch/parisc/kernel/module.c
@@ -660,6 +660,10 @@ int apply_relocate_add(Elf_Shdr *sechdrs,
 			}
 			*loc = (*loc & ~0x3ff1ffd) | reassemble_22(val);
 			break;
+		case R_PARISC_PCREL32:
+			val -= (uint32_t) loc;
+			*loc = val;
+			break;
 
 		default:
 			printk(KERN_ERR "module %s: Unknown relocation: %u\n",

--------------020504010304000507010802--

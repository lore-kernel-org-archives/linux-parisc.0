From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Issue booting v2.6.39 .. v3.4-rc6 on hp712/100
Date: Wed, 23 May 2012 19:09:29 -0400
Message-ID: <BLU0-SMTP604D3208C7D6BE30CD5AF297030@phx.gbl>
References: <4FA9975C.5060708@bergerie>
     <41786065.U2qKzXR3uX@donald.sf-tec.de> <4FAA9382.7040802@bell.net>
     <4FAADE2A.9080803@bergerie>
   <BLU0-SMTP65CF901B170B044925E85897160@phx.gbl>   <4FAEE943.2030203@gmx.de>
   <BLU0-SMTP93504AF1AF0414C90D1EFB971A0@phx.gbl> <4FB182F8.2040403@gmx.de>
   <BLU0-SMTP728EA90F4400504B2AF7A4971A0@phx.gbl>
     <1337069366.3005.10.camel@dabdike.lan>
    <1337073212.3005.12.camel@dabdike.lan> <4FB29F13.5070801@bell.net>
    <4FB2A58A.9050706@gmx.de> <4FB2AD78.1020002@bell.net>
    <4FB2B2A2.2020207@bell.net> <4FB2B5B1.7000604@gmx.de>
    <4FB2B71B.7090602@bell.net> <4FB2BC5F.3080905@gmx.de>
    <4FB2C129.90307@bell.net> <4FB550F1.7080104@gmx.de>
   <1337328744.2938.5.camel@dabdike.int.hansenpartnership.com>
   <4FB6BA76.6010101@gmx.de>
 <1337508060.2682.13.camel@dabdike.int.hansenpartnership.com>
  <4FB941EF.4060304@gmx.de>
 <1337544924.2682.21.camel@dabdike.int.hansenpartnership.com>
 <4FB95D75.1020705@gmx.de>
 <alpine.LNX.2.02.1205231026560.26323@chalice.crownest.nephros.org>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed	delsp=yes
Cc: Helge Deller <deller@gmx.de>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Vincent <vincent.stehle@laposte.net>,
	Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc@vger.kernel.org
To: Peter Gantner (nephros) <gentoo@nephros.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.02.1205231026560.26323@chalice.crownest.nephros.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

I haven't seen the RTC problem.  I have the following RTC options in =20
my rp3440 config:

CONFIG_HP_SDC_RTC=3Dm

CONFIG_RTC_LIB=3Dy
CONFIG_RTC_CLASS=3Dy
CONFIG_RTC_HCTOSYS=3Dy
CONFIG_RTC_HCTOSYS_DEVICE=3D"rtc0"

CONFIG_RTC_INTF_SYSFS=3Dy
CONFIG_RTC_INTF_PROC=3Dy
CONFIG_RTC_INTF_DEV=3Dy

CONFIG_RTC_DRV_GENERIC=3Dy

Dave

On 23-May-12, at 4:47 AM, Peter Gantner (nephros) wrote:

> Hodie XIII Kal. Iun. MMXII AUC quidam/qu=E6dam/quoddam 'Helge Deller'=
 =20
> inquit:
>
>> On 05/20/2012 10:15 PM, James Bottomley wrote:
>>> On Sun, 2012-05-20 at 21:11 +0200, Helge Deller wrote:
>>>> On 05/20/2012 12:01 PM, James Bottomley wrote:
>>>>> On Fri, 2012-05-18 at 23:09 +0200, Helge Deller wrote:
>>>>>> James, here is the full kernel log. Does this help?
>>>>> Yes and no: it shows clearly we got all the way through the =20
>>>>> initrd, so
>>>>> we've gone through the alias region thousands of times doing =20
>>>>> flushes.
>>>>>> Kernel Fault: Code=3D26 regs=3D8fc30940 (Addr=3D0f2ff000)
>>>>> It's an access rights trap, presumably on the alias tlb, since th=
e
>>>>> address is definitely in the alias region.  The obvious =20
>>>>> candidate is the
>>>>> protection id deposit in do_alias
>>>>>
>>>>> 	depw,z		\prot,8,7,\prot
>>>>> but that all checks out fine (you can compare it with
>>>>> make_insert_tlb_11). So the page should have read, write and =20
>>>>> dirty set.
>>>>> The interesting thing is that the only way to get an access =20
>>>>> rights trap
>>>>> in the kernel is if the protection type is zero and I just can't =
=20
>>>>> see how
>>>>> do_alias would zero out \prot in a way that functions on your =20
>>>>> C3000
>>>>> (PA2.0) but not on the PA1.1 systems.
>>>>> Are you sure this is booting the same kernel?
>>>> Yes, since I use tftboot to deliver same vmlinux kernel to all my =
=20
>>>> machines
>>>> for bootup.
>>> The penny finally dropped on Dave's last comment.  The _20 path =20
>>> needs to
>>> use wide instructions even though it's executing narrow code =20
>>> because we
>>> have to use the PA2.0 tlb insertion instruction, so it's not
>>> CONFIG_64BIT that's the differentiator, but which interruption path
>>> we're on.
>>> Does this fix it?
>> Yes, this fixed the crash. No segfaults at all on all my =20
>> machines  :-)
>
> Just checking in to report that I did the same patch dance on my =20
> C180 (after
> spending about a week on getting its ancient Gentoo installation up =20
> to date.
> Many many thanks to whoever provides the binaries on =20
> tinderbox.dev.gentoo.org):
>
> # uname -a
> Linux hydralisk 3.4.0-rc7-hyT #11 Wed May 23 10:00:17 CEST 2012 =20
> parisc PA8000 (PCX-U) 9000/780/C180 GNU/Linux
>
> and these patches work here as well (also I get the same oopses =20
> without them).
>
> You can see all relevant files here:
> https://public.nephros.org/~nephros/stuff/hppa/linux-2.6-d6c77973/
>
> In addition after a suggestion by Mikulas I applied the NO_IRQ patch =
=20
> from here:
> http://www.spinics.net/lists/linux-parisc/msg03894.html
> and it did not seem to have adverse effect.
>
> Let me know if I can test anything else.
>
> On a side note, I get a warning while booting about RTC being =20
> registered, in the dmesg here:
> https://public.nephros.org/~nephros/stuff/hppa/linux-2.6-d6c77973/=20
> try4/
> as well as some warnings during compile (don't have a log of them =20
> right now, sorry)
>
> Is that something peculiar to my config, or is there something amiss =
=20
> in the current source?
>
> ------------[ cut here ]------------
> WARNING: at fs/proc/generic.c:586
> Modules linked in:
>
>     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> PSW: 00000000000001000000000000001111 Not tainted
> r00-03  0004000f 104c4800 101e100c 6ecc6940
> r04-07  6fc05240 6ecc6b40 6ecc698d 6ecb52b8
> r08-11  00000000 104fe000 104fe000 00000048
> r12-15  10578b18 1055c45c 000000fd f0100000
> r16-19  f000168c f000020c f0000204 104c4d38
> r20-23  00000000 0000000a 102b6efc 102b7ab0
> r24-27  ffffffff 00002358 104c4f88 104aa000
> r28-31  00000035 000000b4 6fc2c5c0 102b8d28
> sr00-03  00000000 00000000 00000000 00000000
> sr04-07  00000000 00000000 00000000 00000000
>
> IASQ: 00000000 00000000 IAOQ: 101e100c 101e1010
> IIR: 03ffe01f    ISR: 00000000  IOR: 00000000
> CPU:        0   CR30: 6fc2c000 CR31: ffffffff
> ORIG_R28: 10418800
> IAOQ[0]: proc_register+0x13c/0x190
> IAOQ[1]: proc_register+0x140/0x190
> RP(r2): proc_register+0x13c/0x190
> Backtrace:
> [<101e10ec>] proc_create_data+0x8c/0xb4
> [<102ff488>] rtc_proc_add_device+0x30/0x3c
> [<102fd0d8>] rtc_device_register+0x1d8/0x264
> [<10555b78>] generic_rtc_probe+0x28/0x4c
> [<102c4adc>] platform_drv_probe+0x1c/0x28
> [<102c392c>] driver_probe_device+0xac/0x1c0
> [<102c3aa8>] __driver_attach+0x68/0x9c
> [<102c20f8>] bus_for_each_dev+0x60/0xa0
> [<102c2fac>] bus_add_driver+0xac/0x230
> [<102c3e80>] driver_register+0xa4/0x13c
> [<102c4e40>] platform_driver_probe+0x20/0x6c
> [<10112850>] do_one_initcall+0x180/0x24c
> [<10540ae4>] kernel_init+0x134/0x1fc
> [<1010305c>] ret_from_kernel_thread+0x1c/0x24
>
> ---[ end trace a48b844e905b2419 ]---
>
> Best Wishes,
>  Peter G.

--
John David Anglin	dave.anglin@bell.net



--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

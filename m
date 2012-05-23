From: "Peter Gantner \(nephros\)" <gentoo@nephros.org>
Subject: Re: Issue booting v2.6.39 .. v3.4-rc6 on hp712/100
Date: Wed, 23 May 2012 10:47:18 +0200 (CEST)
Message-ID: <alpine.LNX.2.02.1205231026560.26323@chalice.crownest.nephros.org>
References: <4FA9975C.5060708@bergerie>     <41786065.U2qKzXR3uX@donald.sf-tec.de> <4FAA9382.7040802@bell.net>     <4FAADE2A.9080803@bergerie>   <BLU0-SMTP65CF901B170B044925E85897160@phx.gbl>   <4FAEE943.2030203@gmx.de>   <BLU0-SMTP93504AF1AF0414C90D1EFB971A0@phx.gbl>
   <4FB182F8.2040403@gmx.de>   <BLU0-SMTP728EA90F4400504B2AF7A4971A0@phx.gbl>     <1337069366.3005.10.camel@dabdike.lan>    <1337073212.3005.12.camel@dabdike.lan> <4FB29F13.5070801@bell.net>    <4FB2A58A.9050706@gmx.de> <4FB2AD78.1020002@bell.net>   
 <4FB2B2A2.2020207@bell.net> <4FB2B5B1.7000604@gmx.de>    <4FB2B71B.7090602@bell.net> <4FB2BC5F.3080905@gmx.de>    <4FB2C129.90307@bell.net> <4FB550F1.7080104@gmx.de>   <1337328744.2938.5.camel@dabdike.int.hansenpartnership.com>   <4FB6BA76.6010101@gmx.de>
  <1337508060.2682.13.camel@dabdike.int.hansenpartnership.com>  <4FB941EF.4060304@gmx.de> <1337544924.2682.21.camel@dabdike.int.hansenpartnership.com> <4FB95D75.1020705@gmx.de>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="-1463809792-503765717-1337762020=:26323"
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	John David Anglin <dave.anglin@bell.net>,
	Vincent <vincent.stehle@laposte.net>,
	Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4FB95D75.1020705@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---1463809792-503765717-1337762020=:26323
Content-Type: TEXT/PLAIN; CHARSET=ISO-8859-15; FORMAT=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <alpine.LNX.2.02.1205231035001.26323@chalice.crownest.nephros.org>

Hodie XIII Kal. Iun. MMXII AUC quidam/qu=E6dam/quoddam 'Helge Deller' inqui=
t:

> On 05/20/2012 10:15 PM, James Bottomley wrote:
>> On Sun, 2012-05-20 at 21:11 +0200, Helge Deller wrote:
>>> On 05/20/2012 12:01 PM, James Bottomley wrote:
>>>> On Fri, 2012-05-18 at 23:09 +0200, Helge Deller wrote:
>>>>> James, here is the full kernel log. Does this help?
>>>> Yes and no: it shows clearly we got all the way through the initrd, so
>>>> we've gone through the alias region thousands of times doing flushes.
>>>>=20
>>>>> Kernel Fault: Code=3D26 regs=3D8fc30940 (Addr=3D0f2ff000)
>>>>>=20
>>>> It's an access rights trap, presumably on the alias tlb, since the
>>>> address is definitely in the alias region.  The obvious candidate is t=
he
>>>> protection id deposit in do_alias
>>>>
>>>> =09depw,z=09=09\prot,8,7,\prot
>>>>=20
>>>> but that all checks out fine (you can compare it with
>>>> make_insert_tlb_11). So the page should have read, write and dirty set=
=2E
>>>>=20
>>>> The interesting thing is that the only way to get an access rights tra=
p
>>>> in the kernel is if the protection type is zero and I just can't see h=
ow
>>>> do_alias would zero out \prot in a way that functions on your C3000
>>>> (PA2.0) but not on the PA1.1 systems.
>>>>=20
>>>> Are you sure this is booting the same kernel?
>>> Yes, since I use tftboot to deliver same vmlinux kernel to all my machi=
nes
>>> for bootup.
>> The penny finally dropped on Dave's last comment.  The _20 path needs to
>> use wide instructions even though it's executing narrow code because we
>> have to use the PA2.0 tlb insertion instruction, so it's not
>> CONFIG_64BIT that's the differentiator, but which interruption path
>> we're on.
>>=20
>> Does this fix it?
> Yes, this fixed the crash. No segfaults at all on all my machines  :-)

Just checking in to report that I did the same patch dance on my C180 (afte=
r
spending about a week on getting its ancient Gentoo installation up to date=
=2E
Many many thanks to whoever provides the binaries on tinderbox.dev.gentoo.o=
rg):

# uname -a
Linux hydralisk 3.4.0-rc7-hyT #11 Wed May 23 10:00:17 CEST 2012 parisc=20
PA8000 (PCX-U) 9000/780/C180 GNU/Linux

and these patches work here as well (also I get the same oopses without=20
them).

You can see all relevant files here:
https://public.nephros.org/~nephros/stuff/hppa/linux-2.6-d6c77973/

In addition after a suggestion by Mikulas I applied the NO_IRQ patch from h=
ere:
http://www.spinics.net/lists/linux-parisc/msg03894.html
and it did not seem to have adverse effect.

Let me know if I can test anything else.

On a side note, I get a warning while booting about RTC being registered, i=
n the dmesg here:
https://public.nephros.org/~nephros/stuff/hppa/linux-2.6-d6c77973/try4/
as well as some warnings during compile (don't have a log of them right now=
, sorry)

Is that something peculiar to my config, or is there something amiss in the=
 current source?

------------[ cut here ]------------
WARNING: at fs/proc/generic.c:586
Modules linked in:

      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001000000000000001111 Not tainted
r00-03  0004000f 104c4800 101e100c 6ecc6940
r04-07  6fc05240 6ecc6b40 6ecc698d 6ecb52b8
r08-11  00000000 104fe000 104fe000 00000048
r12-15  10578b18 1055c45c 000000fd f0100000
r16-19  f000168c f000020c f0000204 104c4d38
r20-23  00000000 0000000a 102b6efc 102b7ab0
r24-27  ffffffff 00002358 104c4f88 104aa000
r28-31  00000035 000000b4 6fc2c5c0 102b8d28
sr00-03  00000000 00000000 00000000 00000000
sr04-07  00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 101e100c 101e1010
  IIR: 03ffe01f    ISR: 00000000  IOR: 00000000
  CPU:        0   CR30: 6fc2c000 CR31: ffffffff
  ORIG_R28: 10418800
  IAOQ[0]: proc_register+0x13c/0x190
  IAOQ[1]: proc_register+0x140/0x190
  RP(r2): proc_register+0x13c/0x190
Backtrace:
  [<101e10ec>] proc_create_data+0x8c/0xb4
  [<102ff488>] rtc_proc_add_device+0x30/0x3c
  [<102fd0d8>] rtc_device_register+0x1d8/0x264
  [<10555b78>] generic_rtc_probe+0x28/0x4c
  [<102c4adc>] platform_drv_probe+0x1c/0x28
  [<102c392c>] driver_probe_device+0xac/0x1c0
  [<102c3aa8>] __driver_attach+0x68/0x9c
  [<102c20f8>] bus_for_each_dev+0x60/0xa0
  [<102c2fac>] bus_add_driver+0xac/0x230
  [<102c3e80>] driver_register+0xa4/0x13c
  [<102c4e40>] platform_driver_probe+0x20/0x6c
  [<10112850>] do_one_initcall+0x180/0x24c
  [<10540ae4>] kernel_init+0x134/0x1fc
  [<1010305c>] ret_from_kernel_thread+0x1c/0x24

---[ end trace a48b844e905b2419 ]---

Best Wishes,
   Peter G.
---1463809792-503765717-1337762020=:26323--

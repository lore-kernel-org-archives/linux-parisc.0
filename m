From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Gentoo boot on C8000 (was: Re: PARISC Linux website and status
 update)
Date: Wed, 24 Apr 2013 16:28:24 -0400
Message-ID: <51784068.10103@bell.net>
References: <201304241944.r3OJirJv009740@arbas.nms.ulrich-teichert.org> <1725746.7h2TmhW5F7@eto>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Cc: Ulrich Teichert <krypton@ulrich-teichert.org>,
	Jeroen Roovers <jer@gentoo.org>, linux-parisc@vger.kernel.org
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1725746.7h2TmhW5F7@eto>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 4/24/2013 4:08 PM, Rolf Eike Beer wrote:
> Am Mittwoch 24 April 2013, 21:44:52 schrieb Ulrich Teichert:
>> Hi,
>>
>> [del]
>>
>>> have been kept up to date quite well. That said, we recently releas=
ed a
>>> new set of boot images (CD[2] and netboot[3]) with support for
>>> recent hardware, filesystems and (yes!) SMP.
>>>
>>>      jer
>>>
>>> [1] http://distfiles.gentoo.org/releases/hppa/autobuilds/current-st=
age3/
>>> [2] http://distfiles.gentoo.org/experimental/hppa/livecd/
>>> [3] http://distfiles.gentoo.org/experimental/hppa/netboot/
>> Tried [2] on my C8000 dual CPU, on a serial line just now:
>>
>> ...
>> HARD Booted.
>> <Cpu0> 0000109800e00000  0000000000000000  CC_BOOT_LAUNCH_IPL_OTHR
>> <Cpu0> 0100142900e00000  fffffff0f0e0ac00  CC_CPU_INTRIGUE_LDB
>> <Cpu0> 3400082100e00000  0000000000000001  CC_BOOT_BOOT_COMPLETE
>> palo ipl 1.5 root@hope Sat Apr 23 18:06:47 CEST 2005
>> ...
>>
>> [    0.000000] Kernel command line:  root=3D/dev/ram0
>> init=3D/linuxrc cdroot dokeymap looptype=3Dsquashfs loop=3D/image.sq=
uashfs
>> console=3DttyB0 palo_kernel=3D0/livecd
> [=E2=80=A6]
>> [   12.256000] radeonfb 0000:80:00.0: enabling SERR and PARITY (0107=
 ->
>> 0147) <Cpu1> e800009801e00000  00000000401173e8  CC_ERR_CHECK_HPMC
>> <Cpu1> 37000f7301e00000  8040004000000000  CC_ERR_CPU_CHECK_SUMMARY
>> <Cpu1> f600105e01e00000  fffffff0f0c00000  CC_MC_HPMC_MONARCH_SELECT=
ED
>> <Cpu1> 140003b201e00000  000000000000000b  CC_ERR_HPMC_STATE_ENTRY
>> <Cpu1> 5600100b01e00000  0000000000000194  CC_MC_OS_HPMC_LEN_ERR
>> <Cpu1> 5600106401e00000  fffffff0f0436fc0  CC_MC_BR_TO_OS_HPMC_FAILE=
D
>> <Cpu1> e800009801e00000  00000000401173e8  CC_ERR_CHECK_HPMC
>> <Cpu0> ec000c9600e00000  0000000000000000  CC_ERR_CHECK_FALL_THROUGH
>> <Cpu1> 37000f7301e00000  8040004000000000  CC_ERR_CPU_CHECK_SUMMARY
>> <Cpu1> 4000109f01e00000  0000000000000000  CC_MC_HPMC_INITIATED
>> <Cpu1> 4000101901e00000  0000000000000000  CC_MC_MULTIPLE_HPMCS
>> <Cpu1> 030010d501e00000  0000000000000000  CC_CPU_STOP
>> [   72.356000] INFO: rcu_sched detected stalls on CPUs/tasks: { 1} (=
detected
>> by 0, t=3D15002 jiffies) [   72.356000] Backtrace:
>> [   72.356000]  [<0000000040136238>] dump_stack+0x18/0x28
>> [   72.356000]  [<00000000401badec>] rcu_check_callbacks+0x824/0x840
>> [   72.356000]  [<000000004016c6fc>] update_process_times+0x64/0xb0
>> [   72.356000]  [<00000000401378c8>] timer_interrupt+0x198/0x1f8
>> [   72.356000]  [<00000000401b1c4c>] handle_irq_event_percpu+0xbc/0x=
2f8
>> [   72.356000]  [<00000000401b62ec>] handle_percpu_irq+0x9c/0xd0
>> [   72.356000]  [<00000000401b10b4>] generic_handle_irq+0x44/0x58
>> [   72.356000]  [<000000004013839c>] do_cpu_irq_mask+0x1ac/0x290
>> [   72.356000]  [<0000000040105074>] intr_return+0x0/0x4
>> [   72.356000]  [<000000004013f428>] cpu_idle+0x80/0xb0
>>
>> And that's it. Well, the ISO *is* an experimental one ;-) Any idea w=
hat
>> to try?
> video=3Dradeonfb:off

I think this is a thread stack overrun.  See this patch:
http://www.spinics.net/lists/linux-parisc/msg04680.html
but increase THREAD_SIZE_ORDER to 4.

There are various manifestations of this but they all involve crashes=20
during interrupt handling.

Dave

--=20
John David Anglin    dave.anglin@bell.net

--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

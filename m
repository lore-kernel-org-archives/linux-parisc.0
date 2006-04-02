From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Strange newest LAB msg?
Date: Sun, 02 Apr 2006 14:29:23 +0000
Message-ID: <442FDFC3.8070408@tiscali.be>
References: <IX008E$FF5F5C221189CADA64719030F0E34D37@scarlet.be>	<200604021129.31095.deller@gmx.de> <442FB31A.5040308@tiscali.be> <200604021515.04424.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: Helge Deller <deller@gmx.de>
Return-Path: <soete.joel@tiscali.be>
In-Reply-To: <200604021515.04424.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>



Helge Deller wrote:
> On Sunday 02 April 2006 13:18, Joel Soete wrote:
> 
[snip]
> 
>>EXT3-fs: mounted filesystem with ordered data mode.
>>VFS: Mounted root (ext3 filesystem) readonly.
>>Freeing unused kernel memory: Badness in smp_call_function at /usr/src/linux-2.6.16.1-pa10/arch/parisc/kernel/smp.c:348
>>Backtrace:
>>  [<0000000010112900>] dump_stack+0x18/0x28
>>  [<000000001011d9b4>] smp_call_function+0x37c/0x3c0
>>  [<0000000010111c5c>] flush_data_cache+0x2c/0x48
>>  [<00000000101109a8>] free_initmem+0x68/0x2f8
>>  [<000000001010fb20>] init+0x858/0x8c8
>>  [<000000001010347c>] ret_from_kernel_
>>(this latest 'Badness in smp_call_function ...' was there but seems to be harmless and the boot continue without showing any more 
>>IOREMAP info ;-) )
> 
> 
> WHAT'S THAT ?
> Do we have some __init too much ?
     337 smp_call_function (void (*func) (void *info), void *info, int retry, int wait)
     338 {
     339         struct smp_call_struct data;
     340         unsigned long timeout;
     341         static DEFINE_SPINLOCK(lock);
     342         int retries = 0;
     343
     344         if (num_online_cpus() < 2)
     345                 return 0;
     346
     347         /* Can deadlock when called with interrupts disabled */
     348         WARN_ON(irqs_disabled());
     349

> I never tested SMP.
> 
No pb ;-)

> 
> 
>>PS: btw, rm CONFIG_DETECT_SOFTLOCKUP in the config doesn't help on this system ;<(:
>>still hanging (this time without Softlockup msg) after only:
>>top - 09:04:58 up 1 day, 16:26,  3 users,  load average: 2.40, 2.26, 2.20
> 
> 
> I think the softlockups don't really matter.
> Does your box hangs without SMP as well ?
> 
well it did with b2k and n4k runing 64bit kernel with CONFIG_DETECT_SOFTLOCKUP=y && # CONFIG_SMP is not set

but I need to verify now without CONFIG_DETECT_SOFTLOCKUP.
(sorry I couldn't do it now but tomorrow morming; ok?

Thanks,
	Joel

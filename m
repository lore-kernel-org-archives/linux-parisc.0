From: Helge Deller <deller@gmx.de>
Subject: Re: kernel 4.6-rc unbootable due to module changes
Date: Fri, 8 Apr 2016 00:48:00 +0200
Message-ID: <5706E3A0.2020902@gmx.de>
References: <alpine.LRH.2.02.1604051326470.14606@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.1604051332280.25453@file01.intranet.prod.int.rdu2.redhat.com>
 <570409DA.1060508@gmx.de>
 <alpine.LRH.2.02.1604051612310.32758@file01.intranet.prod.int.rdu2.redhat.com>
 <alpine.LRH.2.02.1604061014490.30369@file01.intranet.prod.int.rdu2.redhat.com>
 <57058332.8050204@gmx.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080101040304080909040901"
Cc: linux-parisc@vger.kernel.org
To: Mikulas Patocka <mpatocka@redhat.com>,
	John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <57058332.8050204@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

This is a multi-part message in MIME format.
--------------080101040304080909040901
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 06.04.2016 23:44, Helge Deller wrote:
> On 06.04.2016 16:30, Mikulas Patocka wrote:
>>>>>> The patch "parisc: Use generic extable search and sort routines" makes the 
>>>>>> kernel unable to load any modules. It fails with:
>>>>>>
>>>>>> module unix: Unknown relocation: 9
>>>>>> modprobe: FATAL: Error inserting unix (/lib/modules/4.6.0-rc2/kernel/net/unix/unix.ko): Invalid module format
>>>>>>
>>>>>> When I revert the patch, the kernel 4.6-rc2 boots fine.
>>>>>>
>>>>>> Apparently, the function apply_relocate_add in arch/parisc/kernel/module.c 
>>>>>> doesn't handle the new relocation type.

>> Hmm - it's even more strange.
>>
>> I created a test kernel module that triggers an exception by using 
>> get_user with an invalid address (see the attached file exception.tar)
> 
> I see there is a kernel module <sourcetree>/lib/test_user_copy.c as well.
> It seems to crash too.

>> So, it seems that handling exceptions from modules never worked on 
>> pa-risc, it was just masked by the fact that exceptions from modules don't 
>> happen during normal use.

Sadly you seem to be right :-(
I did more testing with the test_user_copy module (with vanilla kernel 4.5 and without the relative extable support).
 
The attached patch fixes most of the issues:
1. Kernel doesn't crash any longer on the "illegal reversed copy_to_user" testcase.
2. It fixes the R_PARISC_DIR64 ex_table entries to create absolute addresses for the exceptions in the module instead of trying to refer to function pointers.

BUT:
It then crashes afterwards.
What happens is that the exception fixup handler now jumps from the module directly to fixup_get_user_skip_1() in the kernel code.
In arch/parisc/lib/fixup.S we have:
ENTRY(fixup_get_user_skip_1)
        get_fault_ip %r1,%r8
....
which expands to:
0000000040a5aab0 <fixup_get_user_skip_1>:
    40a5aab0:   2b 76 50 00     addil L%6c800,dp,r1
    40a5aab4:   50 21 02 f0     ldd 178(r1),r1
    40a5aab8:   03 c0 08 a8     mfctl tr6,r8
    40a5aabc:   49 08 00 28     ldw 14(r8),r8

and the kernel then crashes at 40a5aab4 because dp still has the value of the module and not of the kernel. 

I wonder how we should avoid that.

Maybe the easiest way is to not inline the get_user()/put_user() code in modules, but instead jumping into the kernel and call functions like
- get_user_1(), get_user_2(), get_user_4()...
and so on.

What shall we do?
- Skip the exception handling in modules (as mentioned above by get_user_1()) with the drawback of less performance due to additional calls,
- rewrite the exception table code to use function pointers, or  
- rewrite get_fault_ip() macro to temporary set dp to %r0 (if possible at all?),
- other ideas / opinions ?

Helge


FYI, here is my current log while loading the test_copy_user module:

[  289.900000] Non local DIR64 Symbol fixup_get_user_skip_1 loc 00000000020b16a0 val 40a5aab0 points to 0x40a5aab0
[  290.020000] --- local DIR64 Symbol  loc 00000000020b16a8 val 20b32c0 points to 0x20b34e4
[  290.120000] Non local DIR64 Symbol fixup_get_user_skip_1 loc 00000000020b16b0 val 40a5aab0 points to 0x40a5aab0
[  290.240000] --- local DIR64 Symbol  loc 00000000020b16b8 val 20b32c0 points to 0x20b3558
[  290.336000] Non local DIR64 Symbol fixup_put_user_skip_1 loc 00000000020b16c0 val 40a5ab20 points to 0x40a5ab20
[  290.456000] --- local DIR64 Symbol  loc 00000000020b16c8 val 20b32c0 points to 0x20b3564
[  290.552000] Non local DIR64 Symbol fixup_put_user_skip_1 loc 00000000020b16d0 val 40a5ab20 points to 0x40a5ab20
[  290.676000] --- local DIR64 Symbol  loc 00000000020b16d8 val 20b32c0 points to 0x20b3808
[  290.772000] Non local DIR64 Symbol fixup_get_user_skip_1 loc 00000000020b16e0 val 40a5aab0 points to 0x40a5aab0
[  290.892000] --- local DIR64 Symbol  loc 00000000020b16e8 val 20b32c0 points to 0x20b3814
[  290.988000] Non local DIR64 Symbol fixup_get_user_skip_1 loc 00000000020b16f0 val 40a5aab0 points to 0x40a5aab0
[  291.112000] --- local DIR64 Symbol  loc 00000000020b16f8 val 20b32c0 points to 0x20b3898
[  291.208000] Non local DIR64 Symbol fixup_put_user_skip_1 loc 00000000020b1700 val 40a5ab20 points to 0x40a5ab20
[  291.328000] --- local DIR64 Symbol  loc 00000000020b1708 val 20b32c0 points to 0x20b38a4
[  291.424000] Non local DIR64 Symbol fixup_put_user_skip_1 loc 00000000020b1710 val 40a5ab20 points to 0x40a5ab20
[  291.548000] test_user_copy: Testing: legitimate copy_from_user failed
[  291.624000] test_user_copy: FINISHED: result = 0
[  291.680000] test_user_copy: Testing: legitimate copy_to_user failed
[  291.756000] test_user_copy: FINISHED: result = 0
[  291.808000] test_user_copy: Testing: legitimate get_user failed
[  291.880000] test_user_copy: FINISHED: result = 0
[  291.936000] test_user_copy: Testing: legitimate put_user failed
[  292.008000] test_user_copy: FINISHED: result = 0
[  292.064000] test_user_copy: Testing: illegal all-kernel copy_from_user passed
[  292.148000] fault at 0x406d671c ... found !  fixup = 0x406d6844
[  292.220000] test_user_copy: FINISHED: result = 0
[  292.272000] test_user_copy: Testing: illegal reversed copy_from_user passed
[  292.356000] fault at 0x406d671c ... found !  fixup = 0x406d6844
[  292.428000] test_user_copy: FINISHED: result = 0
[  292.484000] test_user_copy: Testing: illegal all-kernel copy_to_user passed
[  292.568000] fault at 0x406d672c ... found !  fixup = 0x406d684c
[  292.640000] test_user_copy: FINISHED: result = 0
[  292.692000] test_user_copy: Testing: illegal reversed copy_to_user passed
[  292.776000] fault at 0x406d671c ... found !  fixup = 0x406d6844
[  292.844000] test_user_copy: FINISHED: result = 0
[  292.900000] test_user_copy: Testing: illegal get_user passed
[  292.968000] fault at 0x020b3814 ... found !  fixup = 0x40a5aab0
[  293.040000] fault at 0x40a5aab4 ... not found !
[  293.096000] Backtrace:
[  293.096000] fault at 0x40223eac ... found !  fixup = 0x40a5aab0
[  293.096000] 
[  293.096000] 
[  293.096000] Kernel Fault: Code=15 regs=00000000b12946a0 (Addr=000000000211d978)
[  293.096000] CPU: 0 PID: 1320 Comm: modprobe Not tainted 4.5.0-64bit+ #290
[  293.096000] task: 00000000b290a700 ti: 00000000b1294000 task.ti: 00000000b1294000
[  293.096000] 
[  293.096000]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[  293.096000] PSW: 00001000000001001111110000001111 Not tainted
[  293.096000] r00-03  000000ff0804fc0f 000000000211d800 00000000020b37f4 00000000b12945b0
[  293.096000] r04-07  00000000020b1000 00000000b2b3a000 00000000fa6fa000 00000000020b1478
[  293.096000] r08-11  0000000000000000 00000000020b15d0 00000000020b1430 0000000000000000
[  293.096000] r12-15  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[  293.096000] r16-19  0000000000000000 0000000000000000 00000000020b15d0 0000000000000000
[  293.096000] r20-23  0000000000000000 00000000000002f5 0000000000000000 00000000000002ee
[  293.096000] r24-27  0000000000000000 000000000800000f 0000000040d62080 00000000020b1000
[  293.096000] r28-31  0000000000000001 00000000b12949c0 00000000b12946a0 0000000040dce928
[  293.096000] sr00-03  00000000003eb800 0000000000000000 0000000000000000 00000000003eb800
[  293.096000] sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[  293.096000] 
[  293.096000] IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040a5aab4 0000000040a5aab8
[  293.096000]  IIR: 502102f0    ISR: 0000000000000000  IOR: 000000000211d978
[  293.096000]  CPU:        0   CR30: 00000000b1294000 CR31: 00000000fffff5ff
[  293.096000]  ORIG_R28: 0000000040e24df0
[  293.096000]  IAOQ[0]: fixup_get_user_skip_1+0x4/0x38
[  293.096000]  IAOQ[1]: fixup_get_user_skip_1+0x8/0x38
[  293.096000]  RP(r2): test_user_copy_init+0x534/0x6e8 [test_user_copy]
[  293.096000] Backtrace:
[  293.096000] fault at 0x40223eac ... found !  fixup = 0x40a5aab0
[  293.096000] 
[  293.096000] Kernel panic - not syncing: Kernel Fault

--------------080101040304080909040901
Content-Type: text/x-diff;
 name="fixup.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="fixup.patch"

diff --git a/arch/parisc/kernel/parisc_ksyms.c b/arch/parisc/kernel/parisc_ksyms.c
index 568b2c6..4b18a04 100644
--- a/arch/parisc/kernel/parisc_ksyms.c
+++ b/arch/parisc/kernel/parisc_ksyms.c
@@ -48,10 +48,14 @@ EXPORT_SYMBOL(lclear_user);
 EXPORT_SYMBOL(lstrnlen_user);
 
 /* Global fixups */
-extern void fixup_get_user_skip_1(void);
-extern void fixup_get_user_skip_2(void);
-extern void fixup_put_user_skip_1(void);
-extern void fixup_put_user_skip_2(void);
+//extern void fixup_get_user_skip_1(void);
+//extern void fixup_get_user_skip_2(void);
+//extern void fixup_put_user_skip_1(void);
+//extern void fixup_put_user_skip_2(void);
+extern int fixup_get_user_skip_1;
+extern int fixup_get_user_skip_2;
+extern int fixup_put_user_skip_1;
+extern int fixup_put_user_skip_2;
 EXPORT_SYMBOL(fixup_get_user_skip_1);
 EXPORT_SYMBOL(fixup_get_user_skip_2);
 EXPORT_SYMBOL(fixup_put_user_skip_1);
diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 553b098..bb7f191 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -798,6 +798,9 @@ void notrace handle_interruption(int code, struct pt_regs *regs)
 
 	    if (fault_space == 0 && !faulthandler_disabled())
 	    {
+		/* Clean up and return if in exception table. */
+		if (fixup_exception(regs))
+			return;
 		pdc_chassis_send_status(PDC_CHASSIS_DIRECT_PANIC);
 		parisc_terminate("Kernel Fault", regs, code, fault_address);
 	    }

--------------080101040304080909040901--

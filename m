Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id D0C4F485B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 19 Aug 2003 03:39:21 -0600 (MDT)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by cpout2.tiscali.be with esmtp (Tiscali)
	id 19p2uk-0002Im-00
	for <parisc-linux@lists.parisc-linux.org>; Tue, 19 Aug 2003 11:36:30 +0200
Date: Tue, 19 Aug 2003 11:39:18 +0200
Message-ID: <3F2E54A800001E5E@ocpmta8.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] N running 2.4.21-pa13-64-SMP
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

But for some minutes only :(

Hi pa,

With the hope to trap a HPMC during the boot of the N (dual processor) I
added some printk() in traps.c, smp.c, mm/memory.c as follow:

        case  1:
                /* High-priority machine check (HPMC) */
                printk("HPMC (case %d) from %s.\n", code, __FUNCTION__);
                pdc_console_restart();  /* switch back to pdc if HPMC */

[...]
        case  5:
                /* Low-priority machine check */

                printk("LPMC (case %d) from %s.\n", code, __FUNCTION__);
                pdc_chassis_send_status(PDC_CHASSIS_DIRECT_LPMC);
[...]

        case  6:
                /* Instruction TLB miss fault/Instruction page fault */
                printk("Instruction TLB miss fault/Instruction page fault
(case %d) from %s.\n", code, __FUNCTION__);
                fault_address = regs->iaoq[0];
[...]
         case 15:
                /* Data TLB miss fault/Data page fault */
                /* Fall thru */
                printk("Data TLB miss fault/Data page fault (case %d) from
%s.\n", code, __FUNCTION__);
                goto LBLJSO1;
        case 16:
                /* Non-access instruction TLB miss fault */
                /* The instruction TLB entry needed for the target address
of the FIC
                   is absent, and hardware can't find it, so we get to cleanup
*/
                /* Fall thru */
                printk("Non-access instruction TLB miss fault (case %d) from
%s.\n", code, __FUNCTION__);
                goto LBLJSO1;
        case 17:
                /* Non-access data TLB miss fault/Non-access data page fault
*/
                /* TODO: Still need to add slow path emulation code here
*/
                /* TODO: Understand what is meant by the TODO listed
                   above this one. (Carlos) */
                printk("Non-access data TLB miss fault/Non-access data page
fault (case %d) from %s.\n", code, __FUNCTION__);
        LBLJSO1:
                fault_address = regs->ior;
                fault_space = regs->isr;
                break;

smp.c

int
smp_call_function (void (*func) (void *info), void *info, int retry, int
wait)
{
[...]
        if (retry) {
                printk("Retry in %s.\n", __FUNCTION__);
                spin_lock (&lock);
                while (smp_call_function_data != 0)
                        barrier();
        }
        else {
                printk("Don't retry in %s.\n", __FUNCTION__);
                spin_lock (&lock);
                if (smp_call_function_data) {
                        spin_unlock (&lock);
                        return -EBUSY;
                }
        }
[...]

mm/memory.c
[...]
static int do_wp_page(struct mm_struct *mm, struct vm_area_struct * vma,
        unsigned long address, pte_t *page_table, pte_t pte)
{
 
[...]
        spin_unlock(&mm->page_table_lock);
        printk("Try page_cache_release(new_page) in %s.\n", __FUNCTION__);
        page_cache_release(new_page);
        printk("Try page_cache_release(old_page) in %s.\n", __FUNCTION__);
        page_cache_release(old_page);
        return 1;       /* Minor fault */

bad_wp_page:
[...]
no_mem:
        printk("Try page_cache_release(old_page) in %s (because no_mem).\n",
__FUNCTION__);
[...]


And start to grab:
[...]
IP Protocols: ICMP, UDP, TCP, IGMP
Retry in smp_call_function.
Retry in smp_call_function.
IP: routing cache hash table of 8192 buckets, 128Kbytes
Retry in smp_call_function.
Retry in smp_call_function.
Retry in smp_call_function.
Retry in smp_call_function.
Retry in smp_call_function.
TCP: Hash tables configured (established 131072 bind 65536)
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
kjournald starting.  Commit interval 5 seconds
EXT3-fs: mounted filesystem with ordered data mode.
VFS: Mount
********** VIRTUAL FRONT PANEL **********
System Boot detected
*****************************************
LEDs:  RUN      ATTENTION     FAULT     REMOTE     POWER
       ON       FLASH         OFF       ON         ON
LED State: There was a system interruption that did not take the system down.
Check Chassis and Console Logs for error messages.

processor                 system initialization      1C00

*****************************************

************ EARLY BOOT VFP *************
End of early boot detected
*****************************************

========
That is here where I would expect:

************ EARLY BOOT VFP *************
End of early boot detected
*****************************************
bootlogd.

^G************* SYSTEM ALERT **************
SYSTEM NAME: ap8002
DATE: 08/11/2003 TIME: 12:56:05
ALERT LEVEL: 7 = reserved

and eventually HPMC message but it continu ...
========

(case 6) from handle_interruption.
Data TLB miss fault/Data page fault (case 15) from handle_interruption.
Instruction TLB miss fault/Instruction page fault (case 6) from handle_interru
ption.
Instruction TLB miss fault/Instruction page fault (case 6) from handle_interru
ption.
Instruction TLB miss fault/Instruction page fault (case 6) from handle_interru
ption.
Instruction TLB miss fault/Instruction page fault (case 6) from handle_interru
ption.
Instruction TLB miss fault/Instruction page fault (case 6) from handle_interru
ption.
Data TLB miss fault/Data page fault (case 15) from handle_interruption.
Instruction TLB miss fault/Instruction page fault (case 6) from handle_interru
ption.
Instruction TLB miss fault/Instruction page fault (case 6) from handle_interru
ption.
Instruction TLB miss fault/Instruction page fault (case 6) from handle_interru
ption.
Instruction TLB miss fault/Instruction page fault (case 6) from handle_interru
ption.
Data TLB miss fault/Data page fault (case 15) from handle_interruption.
[...]
Data TLB miss fault/Data page fault (case 15) from handle_interruption.
Data TLB miss fault/Data page fault (case 15) from handle_interruption.
Try page_cache_release(new_page) in do_wp_page.
Try page_cache_release(old_page) in do_wp_page.
Data TLB miss fault/Data page fault (case 15) from handle_interruption.
[...]

and thousand of messages of this type since I trap:
[...]
Data TLB palx4000miss login:...

What a surprise???

Well as there is too much messages at the console I came back to my desk
and login the system via ssh and got:

palx4000:/proc# cat cpuinfo 
processor       : 0
cpu family      : PA-RISC 2.0
cpu             : PA8600 (PCX-W+)
cpu MHz         : 550.000000
model           : 9000/800/N4000-55
model name      : Unknown machine
hversion        : 0x00005d30
sversion        : 0x00000491
I-cache         : 512 KB
D-cache         : 1024 KB (WB)
ITLB entries    : 160
DTLB entries    : 160 - shared with ITLB
bogomips        : 1097.72
software id     : 664309341

processor       : 1
cpu family      : PA-RISC 2.0
cpu             : PA8600 (PCX-W+)
cpu MHz         : 550.000000
model           : 9000/800/N4000-55
model name      : Unknown machine
hversion        : 0x00005d30
sversion        : 0x00000491
I-cache         : 512 KB
D-cache         : 1024 KB (WB)
ITLB entries    : 160
DTLB entries    : 160 - shared with ITLB
bogomips        : 1097.72
software id     : 664309341


I so go back to the system to recover my laptop grabing console logs (via
the lan console) and when I lost there was still thousand of messages flushing
on the serial console.

Back to my desk (about 10 minutes later) the system was unfortunaltely down.
The screen console was just black. After a requested reset of GSP I could
just read some messages as above but no HPMC (I know that couldn't be significant)
and I have no other system to let connected until crash :( and have no more
time to collect PIM right now :(( 

Any idea?

Thanks in advance,
    Joel

PS:
Q1: I never grab 'Freeing  unused kernel memory:...' during this test?

Q2: into cpuinfo (here above) I read:
...
ITLB entries    : 160
DTLB entries    : 160 - shared with ITLB
...
is it right that DTLB is shared with ITLB?

-------------------------------------------------------------------------
Tiscali ADSL, seulement 35 eur/mois et le modem est inclus...abonnez-vous!
http://reg.tiscali.be/default.asp?lg=fr 

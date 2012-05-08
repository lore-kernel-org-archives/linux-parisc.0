From: Vincent <vincent.stehle@laposte.net>
Subject: Issue booting v2.6.39 .. v3.4-rc6 on hp712/100
Date: Tue, 08 May 2012 23:59:56 +0200
Message-ID: <4FA9975C.5060708@bergerie>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi parisc folks,

I have noticed that the mainline kernel won't boot any more on my
hp712/100, starting with v2.6.39. It panics in
flush_instruction_cache_local.

After bisection, it appeared the culprit was commit
f311847c2fcebd81912e2f0caf8a461dec28db41 "parisc: flush pages through
tmpalias space". Reverting it made v2.6.39 boot again.

=46or v3.0, I needed to revert a few more patches simply to allow
reverting the original bad commit. And starting with v3.2, I needed to
add the patch from John David Anglin to adjust section arrangement, too
(see http://www.spinics.net/lists/linux-parisc/msg04091.html).

Here is the final patch "pile" I need on v3.4-rc6 to make it boot prope=
rly:

 <patch from John David Anglin>
 Revert f311847c "parisc: flush pages through tmpalias space"
 Revert 8b4ae334 "eliminate special FLUSH flag from page table"
 Revert b54cd0d5 "[PARISC] fix pacache .size with new binutils"
 Revert b7d45818 "[PARISC] prevent speculative re-read on cache flush"

If someone manages to repair the cache routines, I would be glad to tes=
t
the patches :)

Best regards,

--=20
Vincent Stehl=E9


Kernel panic when booting v3.4-rc6 with only the patch from John David
Anglin:

=2E..
[   16.032000] Freeing unused kernel memory: 252k freed
[   16.096000]       _______________________________
[   16.096000]      < Your System ate a SPARC! Gah! >
[   16.096000]       -------------------------------
[   16.096000]              \   ^__^
[   16.096000]                  (__)\       )\/\
[   16.096000]                   U  ||----w |
[   16.096000]                      ||     ||
[   16.456000] swapper (pid 1): Illegal instruction (code 8)
[   16.520000]
[   16.536000]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[   16.592000] PSW: 00000000000000000000000000000000 Not tainted
[   16.660000] r00-03  00000000 00000003 101122b4 105e7b40
[   16.724000] r04-07  105da000 0000000f ffeffff6 00000001
[   16.784000] r08-11  0f2ff000 0f000000 00000001 00000001
[   16.848000] r12-15  ffeffff6 00000017 16633000 16646ffc
[   16.912000] r16-19  00000000 00000023 16633000 17430000
[   16.972000] r20-23  00000000 105e7b60 00000001 00000020
[   17.036000] r24-27  00000000 00000000 0000bb40 104ee000
[   17.096000] r28-31  0f2ff000 00000001 17430740 10268e50
[   17.160000] sr00-03  00000000 00000000 00000000 00000000
[   17.224000] sr04-07  00000000 00000000 00000000 00000000
[   17.288000]
[   17.304000] IASQ: 00000000 00000000 IAOQ: 101009ec 101009f0
[   17.372000]  IIR: 0f801280    ISR: 00000000  IOR: 0f2ff000
[   17.436000]  CPU:        0   CR30: 17430000 CR31: 00000002
[   17.500000]  ORIG_R28: 00000012
[   17.540000]  IAOQ[0]: __clear_user_page_asm+0x20/0x70
[   17.600000]  IAOQ[1]: __clear_user_page_asm+0x24/0x70
[   17.660000]  RP(r2): clear_user_page+0x38/0x50
[   17.712000] Backtrace:
[   17.740000]  [<101122b4>] clear_user_page+0x38/0x50
[   17.800000]  [<1019c37c>] handle_pte_fault+0x1e0/0x7a8
[   17.860000]  [<1019ca08>] handle_mm_fault+0xc4/0xf4
[   17.916000]  [<1019d208>] __get_user_pages+0x18c/0x370
[   17.980000]  [<101bcc08>] get_arg_page+0x5c/0x108
[   18.036000]  [<101bcecc>] copy_strings+0x114/0x25c
[   18.092000]  [<101bd030>] copy_strings_kernel+0x1c/0x30
[   18.156000]  [<101be408>] do_execve+0x1f4/0x370
[   18.208000]  [<10117f0c>] sys_execve+0x44/0x70
[   18.260000]  [<10103084>] __execve+0x20/0x34
[   18.312000]  [<1012a098>] vprintk+0x39c/0x3f0
[   18.364000]  [<1010e074>] printk+0x24/0x30
[   18.412000]  [<101110cc>] init_post+0x6c/0x148
[   18.468000]  [<1059d624>] kernel_init+0x218/0x250
[   18.524000]
[   18.540000] Backtrace:
[   18.568000]  [<10113124>] die_if_kernel+0x138/0x1b0
[   18.628000]  [<10113374>] handle_interruption+0x1d8/0x6d8
[   18.692000]  [<10104078>] intr_check_sig+0x0/0x34
[   18.748000]  [<10174e28>] rcu_irq_exit+0x50/0x60
[   18.804000]  [<101009f0>] __clear_user_page_asm+0x24/0x70
[   18.868000]
[   18.884000] ---[ end trace 1a0bf3a13bdb1148 ]---
[   18.940000] note: swapper[1] exited with preempt_count 1
[   19.004000] Kernel panic - not syncing: Attempted to kill init!
exitcode=3D0x0000000b
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

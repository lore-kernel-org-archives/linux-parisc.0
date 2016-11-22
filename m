From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: Re-enable interrupts early
Date: Tue, 22 Nov 2016 18:18:35 +0100
Message-ID: <e88682a3-8cab-694a-6ec2-cda19c0f222e@gmx.de>
References: <20161024195553.GA27612@p100.box>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
To: linux-parisc@vger.kernel.org,
        James Bottomley <James.Bottomley@HansenPartnership.com>,
        John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20161024195553.GA27612@p100.box>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 24.10.2016 21:55, Helge Deller wrote:
> Since kernel 3.9 we re-enable interrupts quite late due to commit c207a76bf15
> ("parisc: only re-enable interrupts if we need to schedule or deliver signals
> when returning to userspace"). At that time the parisc kernel had no dedicated
> IRQ stack, and this commit prevented kernel stack overflows.
> 
> But since commit 200c880420a ("parisc: implement irq stacks") we now have an
> IRQ stack, so we may be safe now.  And when CONFIG_DEBUG_STACKOVERFLOW=y is
> enabled, we can even check at runtime for overflows.


I've just seen a kernel panic, which I think to be triggered by this patch:

 
postfix: See http://www.postfix.org/COMPATIBILITY_README.html for details
postfix: To disable backwards compatibility use "postconf compatibility_level=2" and "postfix reload"
.
[   64.880230] stackcheck: swapper/1 will most likely overflow irq stack (sp:413abc7a40, stk bottom-top:413abc4028-413abc8028)
[   64.881281] Kernel panic - not syncing: low stack detected by irq handler - check messages
[   64.881281] 
[   64.881281] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 4.9.0-rc6-64bit+ #564
[   64.881281] Backtrace:
[   64.881281]  [<000000004021a7d8>] show_stack+0x68/0x80
[   64.881281]  [<00000000407fcb8c>] dump_stack+0xec/0x168
[   64.881281]  [<000000004024c364>] panic+0x204/0x500
[   64.881281]  [<000000004021ddac>] do_cpu_irq_mask+0x3c4/0x480
[   64.881281]  [<0000000040208074>] intr_return+0x0/0x10
[   64.881281]  [<0000000040208074>] intr_return+0x0/0x10
[   64.881281]  [<0000000040208074>] intr_return+0x0/0x10
[   64.881281]  [<0000000040208074>] intr_return+0x0/0x10
[   64.881281]  [<0000000040208074>] intr_return+0x0/0x10
[   64.881281]  [<0000000040208074>] intr_return+0x0/0x10
[   64.881281]  [<0000000040208074>] intr_return+0x0/0x10
[   64.881281]  [<0000000040208074>] intr_return+0x0/0x10
[   64.881281]  [<0000000040208074>] intr_return+0x0/0x10
[   64.881281]  [<0000000040208074>] intr_return+0x0/0x10
[   64.881281]  [<0000000040208074>] intr_return+0x0/0x10
[   64.881281]  [<0000000040208074>] intr_return+0x0/0x10
[   64.881281] 
[   64.881281]       _______________________________ 
[   64.881281]      < Your System ate a SPARC! Gah! >
[   64.881281]       ------------------------------- 
[   64.881281]              \   ^__^
[   64.881281]                  (__)\       )\/\
[   64.881281]                   U  ||----w |
[   64.881281]                      ||     ||
[   64.881281] swapper/1 (pid 0): Protection id trap (code 7)
[   64.881281] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 4.9.0-rc6-64bit+ #564
[   64.881281] task: 000000007fd0ea90 task.stack: 000000007fd5c000
[   64.881281] 
[   64.881281]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
[   64.881281] PSW: 00001000000001101111110100001110 Not tainted
[   64.881281] r00-03  000000ff0806fd0e 0000000040d8aca0 0000000140219ebc 000000413abc8070
[   64.881281] r04-07  0000000040d0b4a0 000000413abc8400 000000413abc8328 000000413abc8078
[   64.881281] r08-11  000000004021a7d8 000000413abc7fb0 00000000411860d0 000000413abc7a40
[   64.881281] r12-15  000000007fd5c2c0 0000000000000041 0000000000000041 0000000040d8b4a0
[   64.881281] r16-19  000000413abc7a40 0000000040d8c4a0 0000000000000004 000000000800000e
[   64.881281] r20-23  0000000000000001 000000413abc83f0 0000000000000000 0000000000000384
[   64.881281] r24-27  0000000000000000 000000004080e5d8 000000004036aed0 0000000040d0b4a0
[   64.881281] r28-31  0000000000000000 000000413abc8a70 000000413abc8400 0000000041145d94
[   64.881281] sr00-03  00000000003b2800 0000000000000000 0000000000000000 00000000003b2800
[   64.881281] sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000
[   64.881281] 
[   64.881281] IASQ: 0000000000000001 0000000000000001 IAOQ: 0000000140219ebc 0000000140219ec0
[   64.881281]  IIR: 43ffff40    ISR: 0000000000000000  IOR: 0000000000000000
[   64.881281]  CPU:        1   CR30: 000000007fd5c000 CR31: 9cf8a6e3d01f680f
[   64.881281]  ORIG_R28: 000000413abc8540
[   64.881281]  IAOQ[0]: 0x140219ebc
[   64.881281]  IAOQ[1]: 0x140219ec0
[   64.881281]  RP(r2): 0x140219ebc
[   64.881281] Backtrace:
[   64.881281]  [<0000000040208074>] intr_return+0x0/0x10
[   64.881281]  [<0000000040208074>] intr_return+0x0/0x10
[   64.881281]  [<0000000040208074>] intr_return+0x0/0x10
[   64.881281]  [<0000000040208074>] intr_return+0x0/0x10
[   64.881281]  [<0000000040208074>] intr_return+0x0/0x10
[   64.881281]  [<0000000040208074>] intr_return+0x0/0x10
[   64.881281]  [<0000000040208074>] intr_return+0x0/0x10                                                                                            
[   64.881281]  [<0000000040208074>] intr_return+0x0/0x10                                                                                            
[   64.881281]  [<0000000040208074>] intr_return+0x0/0x10                                                                                            
[   64.881281]  [<0000000040208074>] intr_return+0x0/0x10                                                                                            
[   64.881281]  [<0000000040208074>] intr_return+0x0/0x10                                                                                            
[   64.881281]  [<0000000040208074>] intr_return+0x0/0x10                                                                                            
[   64.881281]  [<0000000040208074>] intr_return+0x0/0x10                                                                                            
[   64.881281]  [<0000000040208074>] intr_return+0x0/0x10                                                                                            
[   64.881281]  [<0000000040208074>] intr_return+0x0/0x10                                                                                            
[   64.881281]  [<0000000040208074>] intr_return+0x0/0x10                                                                                            
[   64.881281]                                                                                                                                       
[   64.881281] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 4.9.0-rc6-64bit+ #564                                                                       
[   64.881281] Backtrace:                                                                                                                            
[   64.881281]  [<000000004021a7d8>] show_stack+0x68/0x80                                                                                            
[   64.881281]  [<00000000407fcb8c>] dump_stack+0xec/0x168                                                                                           
[   64.881281]  [<000000004021ab08>] die_if_kernel+0x2c0/0x3a8                                                                                       
[   64.881281]  [<000000004021b7fc>] handle_interruption+0x6dc/0xbb0                                                                                 
[   64.881281]  [<0000000040208084>] intr_check_sig+0x0/0x38                                                                                         
[   64.881281]  [<0000000040208074>] intr_return+0x0/0x10                                                                                            
[   64.881281]  [<0000000040208074>] intr_return+0x0/0x10                                                                                            
[   64.881281]  [<0000000040208074>] intr_return+0x0/0x10                                                                                            
[   64.881281]  [<0000000040208074>] intr_return+0x0/0x10                                                                                            
[   64.881281]  [<0000000040208074>] intr_return+0x0/0x10                                                                                            
[   64.881281]  [<0000000040208074>] intr_return+0x0/0x10                                                                                            
[   64.881281]  [<0000000040208074>] intr_return+0x0/0x10                                                                                            
[   64.881281]  [<0000000040208074>] intr_return+0x0/0x10                                                                                            
[   64.881281]  [<0000000040208074>] intr_return+0x0/0x10                                                                                            
[   64.881281]  [<0000000040208074>] intr_return+0x0/0x10                                                                                            
[   64.881281]  [<0000000040208074>] intr_return+0x0/0x10                                                                                            
[   64.881281]                                                                                                                                       
[   64.881281] Kernel panic - not syncing: Fatal exception in interrupt                                                                              
<Cpu1> 78000c6201e00000  a0e008c01100b009  CC_PAT_ENCODED_FIELD_WARNING                                                                              
<Cpu1> 76000c6801e00000  0000000000000520  CC_PAT_DATA_FIELD_WARNING                                                                                 
<Cpu1> 0300109101e00000  0000000000000000  CC_PROCS_ENTRY_OUT                                                                                        

From: Guy Martin <gmsoft@gentoo.org>
Subject: Re: [parisc-linux] [RFC] Clone and fork considered dangerous from
	2.6.12 to 2.6.20, testers needed.
Date: Thu, 15 Feb 2007 19:44:12 +0100
Message-ID: <20070215194412.a8957aab.gmsoft__21608.9461850517$1416624289$gmane$org@gentoo.org>
References: <119aab440702121832m35ca5141x31d881856810ba92@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: James Bottomley <James.Bottomley@steeleye.com>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440702121832m35ca5141x31d881856810ba92@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


Hi Carlos,

I did the test and I was not able to kernel panic with either my own build or the static file.
It never hanged at a 'for' line but did hanged in the two other around one time out of three.

My setup :
 - kernel-2.6.20-git from 13/02/2007 + your patch for pselect + my fstat64 patch reported in another email
 - glibc-2.5 with same patchset as my previous email
 - binutils-2.17.50.0.12
 - gcc-4.1.1-r3 with mfctl,w fix
 - c3600


However it did crash the kernel at run time with both builds after several kill.
The system was first slowly responsive for one or two secs and then it became frozen.

The output was the following :

 - with tst-fork1-static

[159429.070000]       _______________________________
[159429.070000]      < Your System ate a SPARC! Gah! >                       
[159429.070000]       -------------------------------                        
[159429.070000]              \   ^__^                                        
[159429.070000]               \  (xx)\_______                                
[159429.070000]                  (__)\       )\/\                            
[159429.070000]                   U  ||----w |                               
[159429.070000]                      ||     ||                               
[159429.488000] tst-fork1-stati (pid 22017): Protection id trap (code 27)    
[159429.566000]                                                              
[159429.585000]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI                        
[159429.642000] PSW: 00000000000001001111111100001111 Not tainted            
[159429.712000] r00-03  0004ff0f 10380000 000aadac 41800280                  
[159429.776000] r04-07  00000003 000aad98 41800310 00005606                  
[159429.839000] r08-11  0000000e deadbeef 000000fb fffff000                  
[159429.903000] r12-15  000000fb 00000007 000a7e10 00000000                  
[159429.967000] r16-19  000a5610 fb541298 000103f8 00000002                  
[159430.030000] r20-23  00000000 000003e4 00029e5c 00000000                  
[159430.094000] r24-27  00000002 00000003 000aadac 000a5610                  
[159430.157000] r28-31  00000003 00000000 418003c0 0002da3b                  
[159430.221000] sr00-03  0001daa1 00000000 00000000 0001daa1                 
[159430.286000] sr04-07  0001daa1 0001daa1 0001daa1 0001daa1                 
[159430.351000]                                                              
[159430.369000] IASQ: 00000000 00000000 IAOQ: 000003ec 000003f0              
[159430.437000]  IIR: 0f58d280    ISR: 0001daa1  IOR: 000aadac               
[159430.504000]  CPU:        0   CR30: 4a12c000 CR31: 104ec000               
[159430.571000]  ORIG_R28: 00000002                                          
[159430.609000]  IAOQ[0]: 0x3ec                                              
[159430.644000]  IAOQ[1]: 0x3f0                                              
[159430.678000]  RP(r2): nlm4svc_callback_ops+0x604/0xffffff90 [lockd]       
[159430.754000] Backtrace:                                                   
[159430.783000]  [<10106c74>] die_if_kernel+0x130/0x198                      
[159430.843000]  [<10107150>] handle_interruption+0x474/0x644                
[159430.908000]  [<1010a080>] intr_check_sig+0x0/0x34                        
[159430.966000]                                                              
[159430.985000]       _______________________________                        
[159430.985000]      < Your System ate a SPARC! Gah! >                       
[159430.985000]       -------------------------------                        
[159430.985000]              \   ^__^                                        
[159430.985000]               \  (xx)\_______                                
[159430.985000]                  (__)\       )\/\                            
[159430.985000]                   U  ||----w |                               
[159430.985000]                      ||     ||                               
[159431.403000] tst-fork1-stati (pid 22017): Protection id trap (code 27)    
[159431.481000] die_if_kernel() recursion detected.                          
[159441.482000] BUG: soft lockup detected on CPU#0!                          
[159441.482000] Backtrace:                                                   
[159441.482000]  [<1012d458>] update_process_times+0x44/0x7c                 
[159441.482000]  [<101074cc>] timer_interrupt+0x108/0x14c                    
[159441.482000]  [<101448fc>] handle_specific_irq_timer+0x48/0x80            
[159441.482000]  [<101079a4>] do_cpu_irq_mask+0xd0/0x110                     
[159441.482000]  [<1010a068>] intr_return+0x0/0xc                            
[159441.482000]

 - with tst-fork1

[4294874.057000]       _______________________________                       
[4294874.057000]      < Your System ate a SPARC! Gah! >                      
[4294874.057000]       -------------------------------                       
[4294874.057000]              \   ^__^                                       
[4294874.057000]               \  (xx)\_______                               
[4294874.057000]                  (__)\       )\/\                           
[4294874.057000]                   U  ||----w |                              
[4294874.057000]                      ||     ||                              
[4294874.483000] tst-fork1 (pid 3773): Protection id trap (code 27)          
[4294874.555000]                                                             
[4294874.575000]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI                       
[4294874.633000] PSW: 00000000000001101111111100001111 Not tainted           
[4294874.704000] r00-03  0006ff0f 10380000 40504acf 415b5280                 
[4294874.769000] r04-07  00000004 405b3a5c 415b5310 deadbeef                 
[4294874.834000] r08-11  0000000e 000000fb deadbeef 00000ec2                 
[4294874.898000] r12-15  deadbeef 40172e30 fffff000 00000007                 
[4294874.963000] r16-19  00000000 fb6c10d8 00012216 405b13a4                 
[4294875.028000] r20-23  00000000 000003e4 405aeea8 00000000                 
[4294875.092000] r24-27  00000003 00000004 405b3a5c 00012208                 
[4294875.157000] r28-31  00000004 00000003 415b53c0 40504b0b                 
[4294875.222000] sr00-03  000009d3 00000000 00000000 000009d3                
[4294875.287000] sr04-07  000009d3 000009d3 000009d3 000009d3                
[4294875.353000]                                                             
[4294875.373000] IASQ: 00000000 00000000 IAOQ: 000003ec 000003f0             
[4294875.442000]  IIR: 0f58d280    ISR: 000009d3  IOR: 405b3a5c              
[4294875.510000]  CPU:        0   CR30: 4e178000 CR31: 104ec000              
[4294875.578000]  ORIG_R28: 00000002                                         
[4294875.617000]  IAOQ[0]: 0x3ec                                             
[4294875.653000]  IAOQ[1]: 0x3f0                                             
[4294875.688000]  RP(r2): 0x40504acc                                         
[4294875.728000] Backtrace:                                                  
[4294875.758000]  [<10106c74>] die_if_kernel+0x130/0x198                     
[4294875.819000]  [<10107150>] handle_interruption+0x474/0x644               
[4294875.886000]  [<1010a080>] intr_check_sig+0x0/0x34                       
[4294876.003000]       _______________________________                       
[4294876.003000]      < Your System ate a SPARC! Gah! >                      
[4294876.003000]       -------------------------------                       
[4294876.003000]              \   ^__^                                       
[4294876.003000]               \  (xx)\_______                               
[4294876.003000]                  (__)\       )\/\                           
[4294876.003000]                   U  ||----w |                              
[4294876.003000]                      ||     ||                              
[4294876.429000] tst-fork1 (pid 3772): Protection id trap (code 27)          
[4294876.501000]                                                             
[4294876.521000]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI                       
[4294876.579000] PSW: 00000000000001100000000000001111 Not tainted           
[4294876.650000] r00-03  0006000f 10492248 00000001 00000000                 
[4294876.715000] r04-07  4fec9ae8 00000020 00000000 40176bc6                 
[4294876.780000] r08-11  00000000 4fec8948 4fec9ba8 40db521c                 
[4294876.844000] r12-15  00000004 00000000 00000ec1 00000007                 
[4294876.909000] r16-19  00000000 fb6c10d4 00012216 4f0816c0                 
[4294876.974000] r20-23  4f0816c0 00000600 00000041 00000001                 
[4294877.038000] r24-27  00000000 00000000 00000000 1044a010                 
[4294877.103000] r28-31  00000001 00000002 4e07c1c0 00000000                 
[4294877.168000] sr00-03  000009d5 00000000 00000000 000009d5                
[4294877.233000] sr04-07  00000000 00000000 00000000 00000000                
[4294877.299000]                                                             
[4294877.319000] IASQ: 00000000 00000000 IAOQ: 101258b4 101258b8             
[4294877.388000]  IIR: 0d75d280    ISR: 000009d5  IOR: 40db521c              
[4294877.456000]  CPU:        0   CR30: 4e07c000 CR31: 104ec000              
[4294877.523000]  ORIG_R28: 4e62ff44                                         
[4294877.563000]  IAOQ[0]: do_wait+0x5cc/0xae4                               
[4294877.613000]  IAOQ[1]: do_wait+0x5d0/0xae4                               
[4294877.664000]  RP(r2): 0x0                                                
[4294877.696000] Backtrace:                                                  
[4294877.726000]  [<10106c74>] die_if_kernel+0x130/0x198                     
[4294877.787000]  [<10107150>] handle_interruption+0x474/0x644               
[4294877.854000]  [<1010a080>] intr_check_sig+0x0/0x34                       
[4294877.912000]                                                             
[4294877.932000]       _______________________________                       
[4294877.932000]      < Your System ate a SPARC! Gah! >                      
[4294877.932000]       -------------------------------                       
[4294877.932000]              \   ^__^                                       
[4294877.932000]               \  (xx)\_______                               
[4294877.932000]                  (__)\       )\/\                           
[4294877.932000]                   U  ||----w |                              
[4294877.932000]                      ||     ||                              
[4294878.359000] tst-fork1 (pid 3772): Protection id trap (code 27)          
[4294878.430000] die_if_kernel() recursion detected.                         
[4294888.431000] BUG: soft lockup detected on CPU#0!                         
[4294888.431000] Backtrace:                                                  
[4294888.431000]  [<1012d458>] update_process_times+0x44/0x7c                
[4294888.431000]  [<101074cc>] timer_interrupt+0x108/0x14c                   
[4294888.431000]  [<101448fc>] handle_specific_irq_timer+0x48/0x80           
[4294888.431000]  [<101079a4>] do_cpu_irq_mask+0xd0/0x110                    
[4294888.431000]  [<1010a068>] intr_return+0x0/0xc

I've checked and all my sparc are in the basement. So it's not one of mine's fault :)

My K410 being dead and me too lazy to replace the mainboard, I can't test on it.

Let me know if you need more testing/info.

Cheers,
  Guy



On Mon, 12 Feb 2007 21:32:22 -0500
"Carlos O'Donell" <carlos@systemhalted.org> wrote:

> Sporadically when running the glibc test "tst-fork1" under 2.6.20 on a
> 64-bit kernel the parent process' threads stop running on the CPU, the
> time running for each thread increments, but stepping instructions
> e.g. gdb "si", never causes any execution
> 
> So far, each thread has been stuck in the delay slot of a branch,
> usually just after returning from the clone syscall. I see a couple of
> places in the kernel where we clear the PSW_B bit, but none seem to
> trigger this type of behaviour.
> 
> Luckily I can reproduce the behaviour at will with the following
> testcase. This test causes all sorts of nastiness for as old a kernel
> as I could test, starting with 2.6.12 for either 32 or 64-bit.
> 
> Steps to reproduce:
> 
> A. Download http://www.parisc-linux.org/~carlos/tst-fork1.tar.bz2
> B. Unpack tst-fork1.tar.bz2.
> 
> 1. Boot a recent 2.6.20 kernel on a 32 or 64-bit box.
> 2. Recompiple tst-fork1 with: gcc -lpthread -o tst-fork1 tst-fork1.c
> 3. Run "./tst-fork1 >& run.log" until the test blocks.
> 4. Try to use "kill -9" to remove all "tst-fork1" threads.
> 5. Watch your kernel die with a null pointer dereference in
> __wake_up_common indicating that there was some process list
> corruption. On older 32-bit kernels you make get "Slab corruption"
> warnings.
> 
> OR use a prebuilt static NPTL version:
> 
> 1. Boot a recent 2.6.20 kernel on a 32 or 64-bit box.
> 2. Run "./tst-fork1-static >& run.log" until the test blocks.
> 3. Determine the parent pid e.g. "pgrep tst-fork1-static"
> 4. Determine the tid of any child e.g. "ls -alt /proc/$ppid/task/*"
> 5. Start gdb.
> 6. In gdb issue "attach $tid"
> 7. Issue a "bt" to view the current pc, then issue "si" to step.
> 8. Issue a "dissasemble" to verify that pc is stuck in a branch delay slot.
> 9. Type CTRL+C to stop the process again, issue "bt" to  see nothing changed.
> 10. Force the pc to the next instruction e.g. "set $pcoqh = 0x????"
> where ???? is the address of the next instruction.
> 11. Type "continue" and watch your kernel die, or lockup, always
> printing "die_if_kernel() recursion detected." before dying.
> 
> If others could verify similar behaviour on different hardware that
> would be great.
> 
> Cheers,
> Carlos.
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


-- 
Guy Martin
Gentoo Linux - HPPA port lead
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

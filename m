From: Helge Deller <deller@gmx.de>
Subject: Re: HPPA and lenny (ruby1.9 build problems)
Date: Tue, 06 Jan 2009 00:46:34 +0100
Message-ID: <49629BDA.4030904@gmx.de>
References: <20081215084913.766FCD75DF@taggart.lackof.org> <494666FB.9030907@gmx.de> <20081215193025.GP20002@anguilla.noreply.org> <20081215200749.GA30169@colo.lackof.org> <4949787B.9070003@gmx.de> <20081217222540.GB13477@colo.lackof.org> <4950B3AD.1020200@gmx.de> <20081223102356.GF19873@anguilla.noreply.org> <4950C0CA.1040804@gmx.de> <20090105180823.GC877@colo.lackof.org> <20090105190209.GI932@anguilla.noreply.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: dann frazier <dannf@dannf.org>, Helge Deller <deller@gmx.de>,
	Matt Taggart <taggart@debian.org>,
	Christoph Martin <martin@uni-mainz.de>,
	debian-hppa@lists.debian.org, debian-release@l
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090105190209.GI932@anguilla.noreply.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

CC: linux-paric mailing list

Peter Palfrader wrote:
> On Mon, 05 Jan 2009, dann frazier wrote:
> 
>> On Tue, Dec 23, 2008 at 11:43:22AM +0100, Helge Deller wrote:
>>> Peter Palfrader wrote:
>>>> Helge Deller schrieb am Dienstag, dem 23. Dezember 2008:
>>>>
>>>>> Patch in parisc git tree:
>>>>> http://git.kernel.org/?p=linux/kernel/git/kyle/parisc-2.6.git;a=commitdiff;h=378fe7c4cc619b561409206605c723c05358edac;hp=6c4dfa8f8bcf032137aacb3640d7dd9d75b2b607
>>>> So just using an SMP kernel should also work?
>>> Probably yes, since some other developers tried initially to reproduce
>>> the problem, but they couldn't (as it seems they were running on newer
>>> SMP machines). But I don't have a SMP server which is why I can't test
>>> myself...
>> Unfortunately, it looks like we're still having problems on the
>> buildds w/ 2.6.26 SMP kernels:
>>   http://buildd.debian.org/build.php?&pkg=ruby1.9&ver=1.9.0.2-9&arch=hppa&file=log
>>
>> The build doesn't take the system down, but does still hang
>> indefinitely while running miniruby - though the hang location varies.
>>
>> I'll prepare a UP kernel for one of the buildds w/ the
>> up-optimization-removal patch just to see if it improves things. I
>> don't see why it would, other than it seemed to solve the problem on
>> my test box when I first tested the patch.

It seemed to fix the problem for me as well.
In principle looking at the logs it looks more like a userspace bugs
due to threading functions.
Anyway, I'll try to reproduce it here as well.
FWIW, I had some additional irq locking code in load_context(), maybe 
this helps...?

> Yeah, penalosa got stuck again today, this was on the console:

Does panalosa has the patched kernel (same one as the one on peri) ?
The protection ID traps shouldn't happen any longer, and from the buildd
logs on peri it does seem like that the ProtID traps don't happen there.

Helge

> ...
> [18255061.952000]                                                               
> [18255240.024000] install (pid 15737): Protection id trap (code 27) at
> 000000004038d203                                                                         
> [18255240.116000] Backtrace:                                                    
> [18255240.148000]                                                               
> [18255258.720000] dpkg-deb (pid 15897): Protection id trap (code 27) at 00000000
> 4035defb                                                                        
> [18255258.812000] Backtrace:                                                    
> [18255258.844000]                                                               
> [18260696.284000] dpkg-deb (pid 13540): Protection id trap (code 27) at 00000000
> 00026f1b                                                                        
> [18260696.376000] Backtrace:                                                    
> [18260696.408000]                                                               
> [18289955.716000] ------------[ cut here ]------------                          
> [18289955.776000] kernel BUG at fs/inode.c:262!        

I think this bug is unrelated to the ruby1.9 issue.
                         
> [18289955.824000]                                                               
> [18289955.848000]      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI                         
> [18289955.908000] PSW: 00001000000001001111111100001111 Tainted: G      D       
> [18289955.988000] r00-03  000000ff0804ff0f 00000000401e7888 00000000401e78a4 00000000a7d1d750                                                                   
> [18289956.084000] r04-07  00000000405c9660 00000000a7d1d750 00000000404a5d40 000000012db86400                                                                   
> [18289956.184000] r08-11  fffffffffffff000 0000000000017800 00000000000dc2f7 000000012f871828                                                                   
> [18289956.284000] r12-15  000000007f9d7000 00000000000e7d58 00000000000081a4 0000000000000001                                                                   
> [18289956.384000] r16-19  00000000000ad800 00000000000ad800 00000000000f4648 0000000040501e4c                                                                   
> [18289956.480000] r20-23  000000000800000f 000000000800000f 000000012e623b40 0000000000000000                                                                   
> [18289956.580000] r24-27  000000012f93a2c8 0000000000000000 00000000a7d1d750 00000000405c9660                                                                   
> [18289956.680000] r28-31  0000000000000002 000000007d800690 000000007d8006c0 00000000002ac810                                                                   
> [18289956.780000] sr00-03  0000000003ab8800 0000000000000000 0000000000000000 0000000003da5800                                                                  
> [18289956.880000] sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000                                                                  
> [18289956.980000]                                                               
> [18289957.000000] IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000401e78b0 00000000401e78b4                                                               
> [18289957.104000]  IIR: 03ffe01f    ISR: 0000000010340000  IOR: 000000f6000006c8
> [18289957.188000]  CPU:        0   CR30: 000000007d800000 CR31: 0000000011111111
> [18289957.272000]  ORIG_R28: 0000000000001000                                   
> [18289957.324000]  IAOQ[0]: clear_inode+0x28/0x178                              
> [18289957.376000]  IAOQ[1]: clear_inode+0x2c/0x178                              
> [18289957.432000]  RP(r2): clear_inode+0x1c/0x178                               
> [18289957.484000] Backtrace:                                                    
> [18289957.516000]  [<00000000002b8844>] ext3_free_inode+0x19c/0x540 [ext3]      
> [18289957.596000]  [<00000000002bd0e0>] ext3_delete_inode+0x138/0x178 [ext3]    
> [18289957.676000]  [<00000000401e7bb8>] generic_delete_inode+0x120/0x1e0        
> [18289957.756000]  [<00000000401e7ca4>] generic_drop_inode+0x2c/0x200           
> [18289957.828000]  [<00000000401e6f50>] iput+0x80/0x90                          
> [18289957.888000]  [<00000000401da980>] do_unlinkat+0x1b0/0x278                 
> [18289957.956000]  [<00000000401daa60>] sys_unlink+0x18/0x28                    
> [18289958.020000]  [<0000000040104ef8>] syscall_exit+0x0/0x14                   
> [18289958.084000]                                                               
> [18289958.108000] Backtrace:                                                    
> [18289958.136000]  [<000000004011b154>] show_stack+0x14/0x20                    
> [18289958.204000]  [<000000004011b178>] dump_stack+0x18/0x28                    
> [18289958.268000]  [<000000004011b90c>] die_if_kernel+0x17c/0x230               
> [18289958.336000]  [<000000004011bc58>] handle_interruption+0x298/0x7f0         
> [18289958.412000]  [<00000000401e78b0>] clear_inode+0x28/0x178                  
> [18289958.480000]  [<00000000002b8844>] ext3_free_inode+0x19c/0x540 [ext3]      
> [18289958.560000]  [<00000000002bd0e0>] ext3_delete_inode+0x138/0x178 [ext3]    
> [18289958.640000]  [<00000000401e7bb8>] generic_delete_inode+0x120/0x1e0        
> [18289958.716000]  [<00000000401e7ca4>] generic_drop_inode+0x2c/0x200           
> [18289958.792000]  [<00000000401e6f50>] iput+0x80/0x90                          
> [18289958.852000]  [<00000000401da980>] do_unlinkat+0x1b0/0x278                 
> [18289958.916000]  [<00000000401daa60>] sys_unlink+0x18/0x28                    
> [18289958.984000]  [<0000000040104ef8>] syscall_exit+0x0/0x14                   
> [18289959.048000]                                                               


From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Unaligned access in scsi blk_rq_map_sg
Date: Sat, 12 Sep 2015 18:40:46 -0400
Message-ID: <2C44DC97-789E-408C-83AF-A7FDB6E6EB8A@bell.net>
References: <EE9345DC-EA98-41DB-93C2-63A5F15C137B@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <EE9345DC-EA98-41DB-93C2-63A5F15C137B@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2015-09-12, at 6:13 PM, John David Anglin wrote:

> With Linus' tree at head, I got the following boot error today:
> 
> scsi 4:0:0:0: Direct-Access     HP 73.4G ST373207LW       HPC1 PQ: 0 ANSI: 3    
> scsi target4:0:0: Beginning Domain Validation                                   
> scsi target4:0:0: Ending Domain Validation                                      
> scsi target4:0:0: FAST-160 WIDE SCSI 320.0 MB/s DT IU QAS RTI WRFLOW PCOMP (6.2)
> scsi 4:0:2:0: Direct-Access     HP 73.4G ST373207LW       HPC1 PQ: 0 ANSI: 3    
> scsi target4:0:2: Beginning Domain Validation                                   
> scsi target4:0:2: Ending Domain Validation                                      
> scsi target4:0:2: FAST-160 WIDE SCSI 320.0 MB/s DT IU QAS RTI WRFLOW PCOMP (6.2)
> ata3: SATA link down (SStatus 0 SControl 0)                                     
> random: nonblocking pool is initialized                                         
> ata4: SATA link up 3.0 Gbps (SStatus 123 SControl 0)                            
> ata4.00: ATA-9: ST3000DM001-1ER166, CC25, max UDMA/133                          
> ata4.00: 5860533168 sectors, multi 0: LBA48 NCQ (depth 31/32)                   
> ata4.00: configured for UDMA/100                                                
> scsi 3:0:0:0: Direct-Access     ATA      ST3000DM001-1ER1 CC25 PQ: 0 ANSI: 5    
> sd 3:0:0:0: [sdc] 5860533168 512-byte logical blocks: (3.00 TB/2.72 TiB)        
> sd 4:0:0:0: [sda] 143374738 512-byte logical blocks: (73.4 GB/68.3 GiB)         
> sd 4:0:2:0: [sdb] 143374738 512-byte logical blocks: (73.4 GB/68.3 GiB)         
> sd 4:0:0:0: [sda] Write Protect is off                                          
> sd 4:0:2:0: [sdb] Write Protect is off                                          
> sd 4:0:0:0: [sda] Write cache: enabled, read cache: enabled, supports DPO and FA
> sd 4:0:2:0: [sdb] Write cache: enabled, read cache: enabled, supports DPO and FA
> mptbase: ioc1: Initiating bringup                                               
> sd 3:0:0:0: [sdc] 4096-byte physical blocks                                     
> sd 3:0:0:0: [sdc] Write Protect is off                                          
> sd 3:0:0:0: [sdc] Write cache: enabled, read cache: enabled, doesn't support DPA
> sdc: sdc1                                                                      
> sd 3:0:0:0: [sdc] Attached SCSI disk                                            
> ioc1: LSI53C1030 B2: Capabilities={Initiator,Target}                            
> scsi host5: ioc1: LSI53C1030 B2, FwRev=01032341h, Ports=1, MaxQ=255, IRQ=68     
> sda: sda1 sda2 sda3 sda4                                                       
> sd 4:0:2:0: [sdb] Attached SCSI disk                                            
> sd 4:0:0:0: [sda] Attached SCSI disk                                            
> scsi_id(992): unaligned access to 0x00000000fae5b009 at ip=0x00000000410039a7   
> scsi_id(993): unaligned access to 0x00000000fa7b9009 at ip=0x00000000410039a7   
> Backtrace:                                                                      
> [<000000000c1bb008>] scsi_init_sgtable+0x70/0x168 [scsi_mod]                   
> [<000000000c1bb16c>] scsi_init_io+0x6c/0x250 [scsi_mod]                        
> [<00000000107355a0>] sd_setup_read_write_cmnd+0x58/0x940 [sd_mod]              
> [<0000000010735ecc>] sd_init_command+0x44/0x130 [sd_mod]                       
> [<000000000c1bb454>] scsi_setup_cmnd+0x104/0x1c0 [scsi_mod]                    
> [<000000000c1bb7a0>] scsi_prep_fn+0x100/0x340 [scsi_mod]                       
> [<000000004035cc50>] blk_peek_request+0x1b8/0x298                              
> [<000000000c1bd3b0>] scsi_request_fn+0xf8/0xab0 [scsi_mod]                     
> [<00000000403584ec>] __blk_run_queue+0x4c/0x70                                 
> [<000000004038126c>] cfq_insert_request+0x2dc/0x580                            
> [<00000000403576ac>] __elv_add_request+0x1b4/0x300                             
> 
> 
> Bad Address (null pointer deref?): Code=15 regs=000000007c65d260 (Addr=0000003b)
> CPU: 2 PID: 936 Comm: systemd-udevd Not tainted 4.2.0+ #1                       
> task: 000000033f98a348 ti: 000000007c65c000 task.ti: 000000007c65c000           
> 
>     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI                                           
> PSW: 00001000000001001111111100001110 Not tainted                               
> r00-03  000000ff0804ff0e 000000007c65d130 0000000040363660 000000007c65d130     
> r04-07  00000000406f18f0 0000000000004000 0000000000000320 0000000000000000     
> r08-11  0000000000000000 0000000000000001 0001003b00000000 000000007e650dc0     
> r12-15  0000000000001000 0000000000000032 0000000000000004 0000000042d0d780     
> r16-19  0000000000000000 000000007e4cf088 0000000000001000 0000000000001000     
> r20-23  0000000000000000 000000007c1ce000 0000000000011000 000000004076d900     
> r24-27  0002d12b3ff4bb53 cffd2ed4c0000000 000000007e48cb20 00000000406f18f0     
> r28-31  0001003b00000000 000000007c65d230 000000007c65d260 0000000000000001     
> sr00-03  0000000000019000 0000000000000000 0000000000000000 0000000000019000    
> sr04-07  0000000000000000 0000000000000000 0000000000000000 0000000000000000    
> 
> IASQ: 0000000000000000 0000000000000000 IAOQ: 0000000040363668 000000004036366c 
> IIR: 0d4010dc    ISR: 0000000000010000  IOR: 0000003b00000000                  
> CPU:        2   CR30: 000000007c65c000 CR31: ffffffffffffffff                  
> ORIG_R28: 0000000000000000                                                     
> IAOQ[0]: blk_rq_map_sg+0x310/0x5d8                                             
> IAOQ[1]: blk_rq_map_sg+0x314/0x5d8                                             
> RP(r2): blk_rq_map_sg+0x308/0x5d8                                              
> Backtrace:                                                                      
> [<000000000c1bb008>] scsi_init_sgtable+0x70/0x168 [scsi_mod]                   
> [<000000000c1bb16c>] scsi_init_io+0x6c/0x250 [scsi_mod]                        
> [<00000000107355a0>] sd_setup_read_write_cmnd+0x58/0x940 [sd_mod]              
> [<0000000010735ecc>] sd_init_command+0x44/0x130 [sd_mod]                       
> [<000000000c1bb454>] scsi_setup_cmnd+0x104/0x1c0 [scsi_mod]                    
> [<000000000c1bb7a0>] scsi_prep_fn+0x100/0x340 [scsi_mod]                       
> [<000000004035cc50>] blk_peek_request+0x1b8/0x298                              
> [<000000000c1bd3b0>] scsi_request_fn+0xf8/0xab0 [scsi_mod]                     
> [<00000000403584ec>] __blk_run_queue+0x4c/0x70                                 
> [<000000004038126c>] cfq_insert_request+0x2dc/0x580                            
> [<00000000403576ac>] __elv_add_request+0x1b4/0x300                             
> 
> Kernel panic - not syncing: Bad Address (null pointer deref?)                   


It appears the unaligned accesses were present before but didn't cause a panic:

ioc1: LSI53C1030 B2: Capabilities={Initiator,Target}                            
scsi 3:0:0:0: Direct-Access     ATA      ST3000DM001-1ER1 CC25 PQ: 0 ANSI: 5    
sd 3:0:0:0: [sdc] 5860533168 512-byte logical blocks: (3.00 TB/2.72 TiB)        
sd 3:0:0:0: [sdc] 4096-byte physical blocks                                     
sd 3:0:0:0: [sdc] Write Protect is off                                          
sd 3:0:0:0: [sdc] Write cache: enabled, read cache: enabled, doesn't support DPA
 sdc: sdc1                                                                      
sd 3:0:0:0: [sdc] Attached SCSI disk                                            
scsi host5: ioc1: LSI53C1030 B2, FwRev=01032341h, Ports=1, MaxQ=255, IRQ=68     
sd 4:0:2:0: [sdb] Spinning up disk...                                           
sd 4:0:0:0: [sda] 143374738 512-byte logical blocks: (73.4 GB/68.3 GiB)         
sd 4:0:0:0: [sda] Write Protect is off                                          
sd 4:0:0:0: [sda] Write cache: enabled, read cache: enabled, supports DPO and FA
.                                                                               
 sda: sda1 sda2 sda3 sda4                                                       
sd 4:0:0:0: [sda] Attached SCSI disk                                            
...                                                                             
scsi_id(938): unaligned access to 0x00000000faed4009 at ip=0x00000000410038df   
.....ready                                                                      
sd 4:0:2:0: [sdb] 143374738 512-byte logical blocks: (73.4 GB/68.3 GiB)         
sd 4:0:2:0: [sdb] Write Protect is off                                          
sd 4:0:2:0: [sdb] Write cache: enabled, read cache: enabled, supports DPO and FA
sd 4:0:2:0: [sdb] Attached SCSI disk                                            
scsi_id(942): unaligned access to 0x00000000fae77009 at ip=0x00000000410038df   
Begin: Loading essential drivers ... done.                                      
Begin: Running /scripts/init-premount ... done.                                 
Begin: Mounting root file system ... Begin: Running /scripts/local-top ... done.
Begin: Running /scripts/local-premount ... done.                                
Begin: Checking root file system ... fsck from util-linux 2.26.2                
ROOT: clean, 128634/4341760 files, 3291642/17343502 blocks                      
done.                                                                           
kjournald starting.  Commit interval 5 seconds                                  
EXT3-fs (sda4): mounted filesystem with writeback data mode                     
done.                                                                           
Begin: Running /scripts/local-bottom ... done.                                  
Begin: Running /scripts/init-bottom ... done.                                   
INIT: version 2.88 booting                                                      
[info] Using makefile-style concurrent boot in runlevel S.                      
[....] Starting the hotplug events dispatcher: systemd-udevdstarting version 226
. ok                                                                            
[....] Synthesizing the initial hotplug events...done.                          
[....] Waiting for /dev to be fully populated...sd 4:0:0:0: Attached scsi gener0
sd 4:0:2:0: Attached scsi generic sg1 type 0                                    
sd 3:0:0:0: Attached scsi generic sg2 type 0                                    
scsi_id(1192): unaligned access to 0x00000000faeeb009 at ip=0x00000000410039a7  
scsi_id(1193): unaligned access to 0x00000000faa1f009 at ip=0x00000000410039a7 

The above is with 4.0.8+.

Dave
--
John David Anglin	dave.anglin@bell.net




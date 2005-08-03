From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] [BUG] PDC stable storage broken on 2.6.13-rc3-pa1
Date: Wed, 3 Aug 2005 12:36:14 -0600
Message-ID: <20050803183614.GB16029@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

FYI only

PDC stable storage driver panics/hpmc's most/all parisc boxen
with the current 2.6.13-rc3-pa1 kernels.

Here is the backtrace and console output for c3000.
I won't be able to chase this today.
Maybe this weekend if no one else gets to it first.

grant


Command line for kernel: 'HOME=/ TERM=linux root=/dev/sda3 console=ttyS0 palo_k'
Selected kernel: /vmlinux-2.6.13-rc3-pa1-UP from partition 1                    
ELF32 executable                                                                
Entry 00100080 first 00100000 n 2                                               
Segment 0 load 00100000 size 4279552 mediaptr 0x1000                            
Segment 1 load 00518000 size 282757 mediaptr 0x416000                           
Branching to kernel entry point 0x00100080.  If this is the last                
message you see, you may need to switch your console.  This is                  
a common symptom -- search the FAQ and mailing list at parisc-linux.org         
                                                                                
Linux version 2.6.13-rc3-pa1-UP (grundler@svenc3k) (gcc version 3.3.5 (Debian 15
FP[0] enabled: Rev 1 Model 16                                                   
The 32-bit Kernel has started...                                                
Initialized PDC Console for debugging.                                          
Determining PDC firmware type: System Map.                                      
model 00005cf0 00000481 00000000 00000002 778510a0 100000f0 00000008 000000b2 02
vers  00000301                                                                  
CPUID vers 17 rev 11 (0x0000022b)                                               
capabilities 0x3                                                                
model 9000/785/C3600                                                            
Total Memory: 2048 MB                                                           
LCD display at f05d0008,f05d0000 registered                                     
Built 1 zonelists                                                               
Kernel command line: HOME=/ TERM=linux root=/dev/sda3 console=ttyS0 palo_kernelP
PID hash table entries: 4096 (order: 12, 65536 bytes)                           
Console: colour dummy device 160x64                                             
Dentry cache hash table entries: 524288 (order: 9, 2097152 bytes)               
Inode-cache hash table entries: 262144 (order: 8, 1048576 bytes)                
Memory: 2097152k available                                                      
Mount-cache hash table entries: 512                                             
NET: Registered protocol family 16                                              
Searching for devices...                                                        
Found devices:                                                                  
1. Astro BC Runway Port at 0xfed00000 [10] { 12, 0x0, 0x582, 0x0000b }          
2. Elroy PCI Bridge at 0xfed30000 [10/0] { 13, 0x0, 0x782, 0x0000a }            
3. Elroy PCI Bridge at 0xfed32000 [10/1] { 13, 0x0, 0x782, 0x0000a }            
4. Elroy PCI Bridge at 0xfed38000 [10/4] { 13, 0x0, 0x782, 0x0000a }            
5. Elroy PCI Bridge at 0xfed3c000 [10/6] { 13, 0x0, 0x782, 0x0000a }            
6. Allegro W+ at 0xfffa0000 [32] { 0, 0x0, 0x5cf, 0x00004 }                     
7. Memory at 0xfed10200 [49] { 1, 0x0, 0x09c, 0x00009 }                         
CPU(s): 1 x PA8600 (PCX-W+) at 552.000000 MHz                                   
Setting cache flush threshold to 300 (1 CPUs online)                            
SBA found Astro 2.1 at 0xfed00000                                               
LBA version TR4.0 (0x5) found at 0xfed30000                                     
PCI: Enabled native mode for NS87415 (pif=0x8f)                                 
LBA version TR4.0 (0x5) found at 0xfed32000                                     
LBA version TR4.0 (0x5) found at 0xfed38000                                     
LBA version TR4.0 (0x5) found at 0xfed3c000                                     
iosapic: hpa not registered for 0000:03:02.0                                    
SCSI subsystem initialized                                                      
unwind_init: start = 0x10442e40, end = 0x10473230, entries = 12351              
inotify syscall                                                                 
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).                        
SGI XFS with no debug enabled                                                   
Initializing Cryptographic API                                                  
SuperIO: Found NS87560 Legacy I/O device at 0000:00:0e.1 (IRQ 19)               
SuperIO: Serial port 1 at 0x3f8                                                 
SuperIO: Serial port 2 at 0x2f8                                                 
SuperIO: Parallel port at 0x378                                                 
SuperIO: Floppy controller at 0x3f0                                             
SuperIO: ACPI at 0x7e0                                                          
SuperIO: USB regulator enabled                                                  
PDC Stable Storage facility v0.09                                               
                                                                                
                                                                                
Backtrace:                                                                      
 [<102af43c>] next_device+0x10/0x2c                                             
 [<102e27f8>] device_for_each_child+0x30/0x78                                   
 [<102e2814>] device_for_each_child+0x4c/0x78                                   
 [<102e2814>] device_for_each_child+0x4c/0x78                                   
 [<1010fb00>] for_each_padev+0x28/0x34                                          
 [<10110694>] parse_tree_node+0x34/0x44                                         
 [<10110624>] check_parent+0x68/0xa4                                            
 [<1010fa9c>] descend_children+0x24/0x60                                        
 [<102e2814>] device_for_each_child+0x4c/0x78                                   
 [<102e2814>] device_for_each_child+0x4c/0x78                                   
 [<102e2814>] device_for_each_child+0x4c/0x78                                   
 [<1010fb00>] for_each_padev+0x28/0x34                                          
 [<10110694>] parse_tree_node+0x34/0x44                                         
 [<10110624>] check_parent+0x68/0xa4                                            
 [<1010fa9c>] descend_children+0x24/0x60                                        
 [<102e2814>] device_for_each_child+0x4c/0x78                                   
                                                                                
                                                                                
High Priority Machine Check (HPMC): Code=1 regs=1047e080 (Addr=00000000)        
                                                                                
     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI                                           
PSW: 00000000000000001111111100000000 Not tainted                               
r00-03  00000000 0f000000 102af43c 00000000                                     
r04-07  1010fa78 8ffffe08 104ce058 10414000                                     
r08-11  0000000f 80000000 1056c3c8 1048bb48                                     
r12-15  3b9aca00 1056c010 1048d010 f0400004                                     
r16-19  00000000 f000017c f0000174 103ff000                                     
r20-23  0000000d 0000168c 101105bc 00000020                                     
r24-27  00000000 00000000 8fffff48 10474010                                     
r28-31  00000001 104cdee8 90000000 1010fa9c                                     
sr0-3   00000000 00000000 00000000 00000000                                     
sr4-7   00000000 00000000 00000000 00000000                                     
                                                                                
      VZOUICununcqcqcqcqcqcrmunTDVZOUI                                          
FPSR: 00000000000000000000000000011111                                          
FPER1: 00000000                                                                 
fr00-03  0000000000000000 0000001f00000000 0000001f00000000 0000001f00000000    
fr04-07  0000000000000000 5555555555555555 5555555555555555 5555555555555555    
fr08-11  5555555555555555 5555555555555555 5555555555555555 5555555555555555    
fr12-15  5555555555555555 5555555555555555 5555555555555555 5555555555555555    
fr16-19  5555555555555555 5555555555555555 5555555555555555 5555555555555555    
fr20-23  5555555555555555 5555555555555555 5555555555555555 5555555555555555    
fr24-27  5555555555555555 5555555555555555 5555555555555555 5555555555555555    
fr28-31  5555555555555555 5555555555555555 5555555555555555 5555555555555555    
                                                                                
IASQ: 00000000 00000000 IAOQ: 103f382c 103f3830                                 
 IIR: 6fc50080    ISR: 00000000  IOR: 90000000                                  
 CPU:        0   CR30: 8fc20000 CR31: 1051c000                                  
 ORIG_R28: 00000000                                                             
 IAOQ[0]: klist_next+0x4/0x74                                                   
 IAOQ[1]: klist_next+0x8/0x74                                                   
 RP(r2): next_device+0x10/0x2c                                                  
Kernel panic - not syncing: High Priority Machine Check (HPMC)                  
 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

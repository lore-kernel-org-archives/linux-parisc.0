From: Domenico Andreoli <cavokz@gmail.com>
Subject: Re: Re: Does there exists any 32bit-only PARISC SMP machines?
Date: Wed, 4 Sep 2013 16:07:05 +0200
Message-ID: <20130904140705.GA30223@glitch>
References: <521F9848.4010404@gmx.de>
 <1377830541.2331.5.camel@dabdike>
 <20130903155643.GA1430@glitch>
 <trinity-b7a0d82a-16b9-4204-be6e-2873db548248-1378282389073@3capp-gmx-bs28>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <trinity-b7a0d82a-16b9-4204-be6e-2873db548248-1378282389073@3capp-gmx-bs28>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Sep 04, 2013 at 10:13:09AM +0200, Helge Deller wrote:
> Hi Domenico,

Helge,

> > J5600 is SMP capable in both 32bit and 64bit mode.
> > mine doesn't boot 64bit SMP since 2.6.22. I've never been able to trace
> > it down but can confirm it happens also on more recent kernels.
> 
> Could you please try a 64bit-SMP (stable series) 3.10 or 3.11 kernel?
> I'm pretty sure your machine should now boot and work with a 64bit SMP kernel.
> If not, please send your bootlog so that we can try to analyze.

yes, indeed. I realized aftewards I could have been more informative
here. thanks for supporting :)

I confirm that smp parisc64 v3.11 doesn't bring up both the cpus on my
system but at least it boots one, something that didn't happen in some
darker moments since 2.6.22.

similar "SMP: CPU:1 is stuck." happens also with debian v3.10-parisc64-smp kernel.

here is the full boot log:


Firmware Version 5.0                                                                                                              

Duplex Console IO Dependent Code (IODC) revision 1                                                                                

------------------------------------------------------------------------------                                                    
   (c) Copyright 1995-2000, Hewlett-Packard Company, All rights reserved                                                          
------------------------------------------------------------------------------                                                    

  Processor   Speed            State           Coprocessor State  I/D Cache                                                       
  ---------  --------   ---------------------  -----------------  -------------                                                   
      0      552 MHz    Active                 Functional         512 kB/1 MB                                                     
      1      552 MHz    Idle                   Functional         512 kB/1 MB                                                     

  Central Bus Speed:                   120 MHz                                                                                    

  Available memory:             4294967296 bytes                                                                                  
  Good memory required:           31256576 bytes                                                                                  

  Primary boot path:    FWSCSI.3.0                                                                                                
  Alternate boot path:  FWSCSI.4.0                                                                                                
  Console path:         GRAPHICS(7)                                                                                               
  Keyboard path:        USB                                                                                                       

CPU 0                                                                                                                             
NOTICE :  Processor self-tests have been disabled because FASTBOOT is                                                             
          enabled.  To enable self-tests, disable FASTBOOT with the FASTBOOT                                                      
          command in the CONFIGURATION menu and reboot the system.                                                                
NOTICE :  Memory has been initialized but not tested because FASTBOOT is                                                          
          enabled.  To test memory, disable FASTBOOT with the FASTBOOT                                                            
          command in the CONFIGURATION menu and reboot the system.                                                                

CPU 1                                                                                                                             
NOTICE :  Processor self-tests have been disabled because FASTBOOT is                                                             
          enabled.  To enable self-tests, disable FASTBOOT with the FASTBOOT                                                      
          command in the CONFIGURATION menu and reboot the system.                                                                


Processor is booting from first available device.                                                                                 

To discontinue, press any key within 10 seconds.                                                                                  

10 seconds expired.                                                                                                               
Proceeding...                                                                                                                     

Searching for device(s) with bootable media...                                                                                    
This may take several minutes.                                                                                                    

To discontinue search, press any key (termination may not be immediate).                                                          

Attempting to boot Primary Path...                                                                                                

BOOTABLE DEVICE FOUND:                                                                                                            
   Path Number        Device Path              Device Type and Utilities                                                          
   -----------        -----------------        -------------------------                                                          
   P0                 FWSCSI.3.0               IBM-SSG H01D073                                                                    
                                               IPL                                                                                

Booting...                                                                                                                        
Boot IO Dependent Code (IODC) revision 0                                                                                          


HARD Booted.                                                                                                                      
palo ipl 1.91 root@c3000 Sat Jul  6 22:19:28 CEST 2013                                                                            

Partition Start(MB) End(MB) Id Type                                                                                               
1               1      31   f0 Palo                                                                                               
2              32     313   83 ext2                                                                                               
3             314   67068   83 ext2                                                                                               
4           67069   69515   82 swap                                                                                               

PALO(F0) partition contains:                                                                                                      
    0/vmlinux32 7312226(0) bytes @ 0x48000                                                                                        

Information: No console specified on kernel command line. This is normal.                                                         
PALO will choose the console currently used by firmware (serial).                                                                 
Command line for kernel: 'root=/dev/sda3 panic=60 HOME=/ console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux'                          
Selected kernel: /vmlinux from partition 2                                                                                        
Selected ramdisk: /initrd.img from partition 2                                                                                    
ELF64 executable                                                                                                                  
Entry 00100000 first 00100000 n 4                                                                                                 
Segment 0 load 00100000 size 7086080 mediaptr 0x1000                                                                              
Segment 1 load 007f7680 size 596536 mediaptr 0x6c3680                                                                             
Segment 2 load 0088c000 size 138848 mediaptr 0x756000                                                                             
Segment 3 load 008ae000 size 38912 mediaptr 0x778000                                                                              
Loading ramdisk 2150813 bytes @ 3fde1000...                                                                                       
Branching to kernel entry point 0x00100000.  If this is the last                                                                  
message you see, you may need to switch your console.  This is                                                                    
a common symptom -- search the FAQ and mailing list at parisc-linux.org                                                           

[    0.000000] Linux version 3.11.0 (cavok@ska) (gcc version 4.8.1 (GCC) ) #6 SMP Wed Sep 4 12:12:41 CEST 2013                    
[    0.000000] unwind_init: start = 0x406b0000, end = 0x406eb800, entries = 15232                                                 
[    0.000000] FP[0] enabled: Rev 1 Model 16                                                                                      
[    0.000000] The 64-bit Kernel has started...                                                                                   
[    0.000000] Default page size is 4KB.                                                                                          
[    0.000000] bootconsole [ttyB0] enabled                                                                                        
[    0.000000] Initialized PDC Console for debugging.                                                                             
[    0.000000] Determining PDC firmware type: System Map.                                                                         
[    0.000000] model 00005d10 00000491 00000000 00000002 77b406fc 100000f0 00000008 000000b2 000000b2                             
[    0.000000] vers  00000300                                                                                                     
[    0.000000] CPUID vers 17 rev 10 (0x0000022a)                                                                                  
[    0.000000] capabilities 0x3                                                                                                   
[    0.000000] model 9000/785/J5600                                                                                               
[    0.000000] Memory Ranges:                                                                                                     
[    0.000000]  0) Start 0x0000000000000000 End 0x00000000efffffff Size   3840 MB                                                 
[    0.000000]  1) Start 0x00000010f0000000 End 0x00000010ffffffff Size    256 MB                                                 
[    0.000000] Total Memory: 4096 MB                                                                                              
[    0.000000] LCD display at fffffff0f05d0008,fffffff0f05d0000 registered                                                        
[    0.000000] PERCPU: Embedded 10 pages/cpu @0000000044487000 s10240 r8192 d22528 u40960                                         
[    0.000000] SMP: bootstrap CPU ID is 0                                                                                         
[    0.000000] Built 2 zonelists in Zone order, mobility grouping on.  Total pages: 1034240                                       
[    0.000000] Kernel command line: root=/dev/sda3 panic=60 HOME=/ console=ttyS0 TERM=vt102 palo_kernel=2/vmlinux                 
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)                                                               
[    0.000000] Dentry cache hash table entries: 524288 (order: 10, 4194304 bytes)                                                 
[    0.000000] Inode-cache hash table entries: 262144 (order: 9, 2097152 bytes)                                                   
[    0.000000] Sorting __ex_table...                                                                                              
[    0.000000] Memory: 4114408K/4194304K available (4838K kernel code, 1045K rwdata, 984K rodata, 176K init, 265K bss, 79896K res)
[    0.000000] virtual kernel memory layout:                                                                                      
    0.000000]     vmalloc : 0x0000000000008000 - 0x000000003f000000   (1007 MB)                                                   
    0.000000]     memory  : 0x0000000040000000 - 0x0000001140000000   (69632 MB)                                                  
    0.000000]       .init : 0x000000004088c000 - 0x00000000408b8000   ( 176 kB)                                                   
    0.000000]       .data : 0x00000000405b9a18 - 0x00000000407b5120   (2029 kB)                                                   
    0.000000]       .text : 0x0000000040100000 - 0x00000000405b9a18   (4838 kB)                                                   
[    0.000000] Hierarchical RCU implementation.                                                                                   
[    0.000000]  CONFIG_RCU_FANOUT set to non-default value of 32                                                                  
[    0.000000] NR_IRQS:80                                                                                                         
[    0.000000] Console: colour dummy device 160x64                                                                                
[    0.060000] Calibrating delay loop... 1099.36 BogoMIPS (lpj=5496832)                                                           
[    0.170000] pid_max: default: 32768 minimum: 301                                                                               
[    0.230000] Mount-cache hash table entries: 256                                                                                
[    0.290000] Brought up 1 CPUs                                                                                                  
[    0.340000] NET: Registered protocol family 16                                                                                 
[    0.400000] Searching for devices...                                                                                           
[    0.710000] Found devices:                                                                                                     
[    0.740000] 1. Astro BC Runway Port at 0xfffffffffed00000 [10] { 12, 0x0, 0x582, 0x0000b }                                     
[    0.850000] 2. Elroy PCI Bridge at 0xfffffffffed30000 [10/0] { 13, 0x0, 0x782, 0x0000a }                                       
[    0.960000] 3. Elroy PCI Bridge at 0xfffffffffed32000 [10/1] { 13, 0x0, 0x782, 0x0000a }                                       
[    1.060000] 4. Elroy PCI Bridge at 0xfffffffffed34000 [10/2] { 13, 0x0, 0x782, 0x0000a }                                       
[    1.170000] 5. Elroy PCI Bridge at 0xfffffffffed38000 [10/4] { 13, 0x0, 0x782, 0x0000a }                                       
[    1.280000] 6. Elroy PCI Bridge at 0xfffffffffed3c000 [10/6] { 13, 0x0, 0x782, 0x0000a }                                       
[    1.380000] 7. Forte W+ 2w at 0xfffffffffffa0000 [32] { 0, 0x0, 0x5d1, 0x00004 }                                               
[    1.480000] 8. Forte W+ 2w at 0xfffffffffffa2000 [34] { 0, 0x0, 0x5d1, 0x00004 }                                               
[    1.580000] 9. Memory at 0xfffffffffed10200 [49] { 1, 0x0, 0x09e, 0x00009 }                                                    
[    1.790000] Releasing cpu 1 now, hpa=fffffffffffa2000                                                                          
[    2.860000] SMP: CPU:1 is stuck.                                                                                               
[    2.900000] CPU(s): 2 x PA8600 (PCX-W+) at 552.000000 MHz                                                                      
[    2.970000] Setting cache flush threshold to 100000 (1 CPUs online)                                                            
[    3.180000] SBA found Astro 2.1 at 0xfffffffffed00000                                                                          
[    3.250000] Elroy version TR2.1 (0x2) found at 0xfffffffffed30000                                                              
[    3.330000] LBA 10:0: PCI host bridge to bus 0000:00                                                                           
[    3.400000] pci_bus 0000:00: root bus resource [io  0x0000-0x1fff]                                                             
[    3.480000] pci_bus 0000:00: root bus resource [mem 0xfffffffff4000000-0xfffffffff47fffff] (bus address [0xf4000000-0xf47fffff)
[    3.630000] pci_bus 0000:00: root bus resource [bus 00]                                                                        
[    3.700000] PCI: Enabled native mode for NS87415 (pif=0x8f)                                                                    
[    3.780000] Elroy version TR2.1 (0x2) found at 0xfffffffffed32000                                                              
[    3.860000] LBA 10:1: PCI host bridge to bus 0000:01                                                                           
[    3.930000] pci_bus 0000:01: root bus resource [io  0x12000-0x13fff] (bus address [0x2000-0x3fff])                             
[    4.040000] pci_bus 0000:01: root bus resource [mem 0xfffffffff4800000-0xfffffffff4ffffff] (bus address [0xf4800000-0xf4ffffff)
[    4.200000] pci_bus 0000:01: root bus resource [bus 01]                                                                        
[    4.270000] Elroy version TR2.1 (0x2) found at 0xfffffffffed34000                                                              
[    4.350000] LBA 10:2: PCI host bridge to bus 0000:02                                                                           
[    4.420000] pci_bus 0000:02: root bus resource [io  0x24000-0x25fff] (bus address [0x4000-0x5fff])                             
[    4.540000] pci_bus 0000:02: root bus resource [mem 0xfffffffff5000000-0xfffffffff57fffff] (bus address [0xf5000000-0xf57fffff)
[    4.690000] pci_bus 0000:02: root bus resource [bus 02-04]                                                                     
[    4.770000] pci 0000:02:02.0: PCI bridge to [bus 03-ff]                                                                        
[    4.840000] pci 0000:02:02.0: address space collision: [io  0x0000-0x0fff] conflicts with PCI02 Ports [io  0x24000-0x25fff]    
[    4.990000] pci 0000:02:02.0: no compatible bridge window for [mem 0xf0100000-0xf01fffff pref]                                 
[    5.100000] pci 0000:02:02.0: no compatible bridge window for [??? 0x00000000 flags 0x0]                                       
[    5.220000] pci 0000:02:03.0: PCI bridge to [bus 04-ff]                                                                        
[    5.290000] pci 0000:02:03.0: address space collision: [io  0x0000-0x0fff] conflicts with PCI02 Ports [io  0x24000-0x25fff]    
[    5.430000] pci 0000:02:03.0: no compatible bridge window for [mem 0xf0100000-0xf01fffff pref]                                 
[    5.550000] pci 0000:02:03.0: no compatible bridge window for [??? 0x00000000 flags 0x0]                                       
[    5.650000] pci 0000:02:02.0: device not available (can't reserve [io  0x0000-0x0fff])                                         
[    5.760000] pci 0000:02:02.0: Error enabling bridge (-22), continuing                                                          
[    5.840000] pci 0000:02:03.0: device not available (can't reserve [io  0x0000-0x0fff])                                         
[    5.950000] pci 0000:02:03.0: Error enabling bridge (-22), continuing                                                          
[    6.030000] Elroy version TR2.1 (0x2) found at 0xfffffffffed38000                                                              
[    6.110000] LBA 10:4: PCI host bridge to bus 0000:05                                                                           
[    6.180000] pci_bus 0000:05: root bus resource [io  0x38000-0x39fff] (bus address [0x8000-0x9fff])                             
[    6.300000] pci_bus 0000:05: root bus resource [mem 0xfffffffff6000000-0xfffffffff67fffff] (bus address [0xf6000000-0xf67fffff)
[    6.450000] pci_bus 0000:05: root bus resource [bus 05]                                                                        
[    6.520000] Elroy version TR2.1 (0x2) found at 0xfffffffffed3c000                                                              
[    6.600000] LBA 10:6: PCI host bridge to bus 0000:06                                                                           
[    6.660000] pci_bus 0000:06: root bus resource [io  0x4c000-0x4dfff] (bus address [0xc000-0xdfff])                             
[    6.780000] pci_bus 0000:06: root bus resource [mem 0xfffffffffa000000-0xfffffffffbffffff] (bus address [0xfa000000-0xfbffffff)
[    6.930000] pci_bus 0000:06: root bus resource [mem 0xfffffffff7000000-0xfffffffff77fffff] (bus address [0xf7000000-0xf77fffff)
[    7.090000] pci_bus 0000:06: root bus resource [bus 06]                                                                        
[    7.160000] iosapic: hpa not registered for 0000:06:07.0                                                                       
[    7.240000] powersw: Soft power switch at 0xfffffff0f0400804 enabled.                                                          
[    7.340000] bio: create slab <bio-0> at 0                                                                                      
[    7.400000] vgaarb: loaded                                                                                                     
[    7.430000] SCSI subsystem initialized                                                                                         
[    7.480000] usbcore: registered new interface driver usbfs                                                                     
[    7.560000] usbcore: registered new interface driver hub                                                                       
[    7.630000] usbcore: registered new device driver usb                                                                          
[    7.690000] Linux video capture interface: v2.00                                                                               
[    7.750000] Advanced Linux Sound Architecture Driver Initialized.                                                              
[    7.840000] Switched to clocksource cr16                                                                                       
[    7.900000] NET: Registered protocol family 2                                                                                  
[    7.960000] TCP established hash table entries: 32768 (order: 7, 524288 bytes)                                                 
[    8.060000] TCP bind hash table entries: 32768 (order: 7, 524288 bytes)                                                        
[    8.150000] TCP: Hash tables configured (established 32768 bind 32768)                                                         
[    8.230000] TCP: reno registered                                                                                               
[    8.280000] UDP hash table entries: 2048 (order: 4, 65536 bytes)                                                               
[    8.360000] UDP-Lite hash table entries: 2048 (order: 4, 65536 bytes)                                                          
[    8.440000] NET: Registered protocol family 1                                                                                  
[    8.500000] SuperIO: Found NS87560 Legacy I/O device at 0000:00:0e.1 (IRQ 20)                                                  
[    8.590000] SuperIO: Serial port 1 at 0x3f8                                                                                    
[    8.650000] SuperIO: Serial port 2 at 0x2f8                                                                                    
[    8.700000] SuperIO: Parallel port at 0x378                                                                                    
[    8.760000] SuperIO: Floppy controller at 0x3f0                                                                                
[    8.820000] SuperIO: ACPI at 0x7e0                                                                                             
[    8.860000] SuperIO: USB regulator enabled                                                                                     
[    8.980000] pci 0000:01:05.0: enabling SERR and PARITY (0017 -> 0157)                                                          
[    9.060000] pci 0000:01:05.1: enabling SERR and PARITY (0017 -> 0157)                                                          
[    9.140000] pci 0000:01:05.2: enabling SERR and PARITY (0017 -> 0157)                                                          
[    9.230000] Enabling PDC chassis warnings support v0.05                                                                        
[    9.300000] Performance monitoring counters enabled for Forte W+ 2w                                                            
[    9.390000] msgmni has been set to 8035                                                                                        
[    9.440000] alg: No test for stdrng (krng)                                                                                     
[    9.490000] io scheduler noop registered                                                                                       
[    9.540000] io scheduler deadline registered (default)                                                                         
[    9.620000] PDC Stable Storage facility v0.30                                                                                  
[    9.980000] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled                                                            
[   10.070000] serial8250: ttyS0 at I/O 0x3f8 (irq = 3) is a 16550A                                                               
[   10.150000] console [ttyS0] enabled, bootconsole disabled                                                                      
[   10.150000] console [ttyS0] enabled, bootconsole disabled                                                                      
[   10.280000] serial8250: ttyS1 at I/O 0x2f8 (irq = 4) is a 16550A                                                               
[   10.370000] brd: module loaded                                                                                                 
[   10.400000] loop: module loaded                                                                                                
[   10.640000] sym0: <896> rev 0x4 at pci 0000:00:0f.0 irq 21                                                                     
[   10.700000] sym0: PA-RISC Firmware, ID 7, Fast-40, SE, parity checking                                                         
[   10.780000] sym0: SCSI BUS has been reset.                                                                                     
[   10.840000] sym0: SCSI BUS mode change from SE to SE.                                                                          
[   10.840000] sym0: SCSI BUS has been reset.                                                                                     
[   10.950000] scsi0 : sym-2.2.3                                                                                                  
[   16.540000] sym1: <896> rev 0x4 at pci 0000:00:0f.1 irq 21                                                                     
[   16.610000] sym1: PA-RISC Firmware, ID 7, Fast-40, LVD, parity checking                                                        
[   16.690000] sym1: SCSI BUS has been reset.                                                                                     
[   16.750000] scsi1 : sym-2.2.3                                                                                                  
[   20.570000] scsi target1:0:3: FAST-40 WIDE SCSI 80.0 MB/s ST (25 ns, offset 31)                                                
[   20.670000] scsi 1:0:3:0: Direct-Access     IBM-SSG  H01D073          RSQH PQ: 0 ANSI: 3                                       
[   20.760000] scsi target1:0:3: tagged command queuing enabled, command queue depth 16.                                          
[   20.860000] scsi target1:0:3: Beginning Domain Validation                                                                      
[   20.980000] scsi target1:0:3: Domain Validation skipping write tests                                                           
[   21.050000] scsi target1:0:3: Ending Domain Validation                                                                         
[   21.120000] scsi target1:0:4: FAST-40 WIDE SCSI 80.0 MB/s ST (25 ns, offset 31)                                                
[   21.220000] scsi 1:0:4:0: Direct-Access     IBM-SSG  H01D073          RSQK PQ: 0 ANSI: 3                                       
[   21.310000] scsi target1:0:4: tagged command queuing enabled, command queue depth 16.                                          
[   21.410000] scsi target1:0:4: Beginning Domain Validation                                                                      
[   21.520000] scsi target1:0:4: Domain Validation skipping write tests                                                           
[   21.600000] scsi target1:0:4: Ending Domain Validation                                                                         
[   21.660000] scsi 1:0:5:0: Direct-Access     QUANTUM  ATLAS10K-18LVD   HP06 PQ: 0 ANSI: 3                                       
[   21.760000] scsi target1:0:5: tagged command queuing enabled, command queue depth 16.                                          
[   21.860000] scsi target1:0:5: Beginning Domain Validation                                                                      
[   21.920000] scsi target1:0:5: FAST-40 WIDE SCSI 80.0 MB/s ST (25 ns, offset 31)                                                
[   22.010000] scsi target1:0:5: Domain Validation skipping write tests                                                           
[   22.090000] scsi target1:0:5: Ending Domain Validation                                                                         
[   22.160000] scsi 1:0:6:0: Direct-Access     FUJITSU  MAJ3182MC        HP12 PQ: 0 ANSI: 2                                       
[   22.250000] scsi target1:0:6: tagged command queuing enabled, command queue depth 16.                                          
[   22.350000] scsi target1:0:6: Beginning Domain Validation                                                                      
[   22.420000] scsi target1:0:6: FAST-40 WIDE SCSI 80.0 MB/s ST (25 ns, offset 31)                                                
[   22.510000] scsi target1:0:6: Domain Validation skipping write tests                                                           
[   22.580000] scsi target1:0:6: Ending Domain Validation                                                                         
[   24.990000] sd 1:0:5:0: [sdc] 35566480 512-byte logical blocks: (18.2 GB/16.9 GiB)                                             
[   25.080000] sd 1:0:3:0: Attached scsi generic sg0 type 0                                                                       
[   25.150000] sd 1:0:4:0: Attached scsi generic sg1 type 0                                                                       
[   25.210000] sd 1:0:5:0: Attached scsi generic sg2 type 0                                                                       
[   25.280000] sd 1:0:6:0: Attached scsi generic sg3 type 0                                                                       
[   25.340000] tun: Universal TUN/TAP device driver, 1.6                                                                          
[   25.400000] tun: (C) 1999-2004 Max Krasnyansky <maxk@qualcomm.com>                                                             
[   25.470000] 3c59x: Donald Becker and others.                                                                                   
[   25.530000] 0000:01:08.0: 3Com PCI 3c905C Tornado at 0000000000044000.                                                         
[   25.630000] sd 1:0:5:0: [sdc] Write Protect is off                                                                             
[   25.690000] sd 1:0:4:0: [sdb] 142368624 512-byte logical blocks: (72.8 GB/67.8 GiB)                                            
[   25.780000] sd 1:0:3:0: [sda] 142368624 512-byte logical blocks: (72.8 GB/67.8 GiB)                                            
[   25.870000] sd 1:0:6:0: [sdd] 35566480 512-byte logical blocks: (18.2 GB/16.9 GiB)                                             
[   25.960000] Linux Tulip driver version 1.1.15 (Feb 27, 2007)                                                                   
[   26.040000] tulip0: no phy info, aborting mtable build                                                                         
[   26.100000] tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1                                               
[   26.210000] net eth1: Digital DS21142/43 Tulip rev 65 at Port 0x1000, 00:10:83:cf:27:e7, IRQ 18                                
[   26.310000] sd 1:0:5:0: [sdc] Write cache: disabled, read cache: enabled, supports DPO and FUA                                 
[   26.410000] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver                                                         
[   26.490000] ehci-pci: EHCI PCI platform driver                                                                                 
[   26.550000] ehci-pci 0000:01:05.2: enabling SERR and PARITY (0013 -> 0153)                                                     
[   26.630000] ehci-pci 0000:01:05.2: EHCI Host Controller                                                                        
[   26.690000] ehci-pci 0000:01:05.2: new USB bus registered, assigned bus number 1                                               
[   26.780000] ehci-pci 0000:01:05.2: irq 24, io mem 0xfffffffff4801000                                                           
[   26.860000] sd 1:0:4:0: [sdb] Write Protect is off                                                                             
[   26.910000] sd 1:0:3:0: [sda] Write Protect is off                                                                             
[   26.970000] sd 1:0:6:0: [sdd] Write Protect is off                                                                             
[   27.030000] ehci-pci 0000:01:05.2: USB 2.0 started, EHCI 0.95                                                                  
[   27.100000] sd 1:0:4:0: [sdb] Write cache: disabled, read cache: enabled, supports DPO and FUA                                 
[   27.200000] sd 1:0:3:0: [sda] Write cache: disabled, read cache: enabled, supports DPO and FUA                                 
[   27.300000] sd 1:0:6:0: [sdd] Write cache: disabled, read cache: enabled, supports DPO and FUA                                 
[   27.410000] hub 1-0:1.0: USB hub found                                                                                         
[   27.450000] hub 1-0:1.0: 4 ports detected                                                                                      
[   27.500000] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver                                                             
[   27.580000] ohci-pci: OHCI PCI platform driver                                                                                 
[   27.630000] ohci-pci 0000:00:0e.2: OHCI PCI host controller                                                                    
[   27.700000] ohci-pci 0000:00:0e.2: new USB bus registered, assigned bus number 2                                               
[   27.790000] ohci-pci 0000:00:0e.2: irq 1, io mem 0xfffffffff4007000                                                            
[   27.920000] hub 2-0:1.0: USB hub found                                                                                         
[   27.960000] hub 2-0:1.0: 3 ports detected                                                                                      
[   28.010000] uhci_hcd: USB Universal Host Controller Interface driver                                                           
[   28.090000] uhci_hcd 0000:01:05.0: enabling SERR and PARITY (0013 -> 0153)                                                     
[   28.170000] uhci_hcd 0000:01:05.0: UHCI Host Controller                                                                        
[   28.230000] uhci_hcd 0000:01:05.0: new USB bus registered, assigned bus number 3                                               
[   28.320000] uhci_hcd 0000:01:05.0: irq 22, io base 0x00012200                                                                  
[   28.390000] hub 3-0:1.0: USB hub found                                                                                         
[   28.440000] hub 3-0:1.0: 2 ports detected                                                                                      
[   28.500000] uhci_hcd 0000:01:05.1: Refused to change power state, currently in D3                                              
[   28.580000] uhci_hcd 0000:01:05.1: enabling SERR and PARITY (0013 -> 0153)                                                     
[   28.670000] uhci_hcd 0000:01:05.1: UHCI Host Controller                                                                        
[   28.730000] uhci_hcd 0000:01:05.1: new USB bus registered, assigned bus number 4                                               
[   28.820000] uhci_hcd 0000:01:05.1: irq 23, io base 0x00012100                                                                  
[   28.890000]  sdc: sdc1 sdc2 sdc3 sdc4                                                                                          
[   28.940000] hub 4-0:1.0: USB hub found                                                                                         
[   28.980000] hub 4-0:1.0: 2 ports detected                                                                                      
[   29.030000]  sdb: sdb1 sdb2 sdb3 sdb4                                                                                          
[   29.080000] usbcore: registered new interface driver usb-storage                                                               
[   29.150000] mousedev: PS/2 mouse device common for all mice                                                                    
[   29.220000] rtc-generic rtc-generic: rtc core: registered rtc-generic as rtc0                                                  
[   29.680000] TCP: cubic registered                                                                                              
[   29.720000] NET: Registered protocol family 17                                                                                 
[   29.780000] sd 1:0:5:0: [sdc] Attached SCSI disk                                                                               
[   29.830000]  sda: sda1 sda2 sda3 sda4                                                                                          
[   29.880000]  sdd: sdd1 sdd2 sdd3 < sdd5 sdd6 >                                                                                 
[   29.940000] rtc-generic rtc-generic: setting system clock to 2013-09-04 13:51:21 UTC (1378302681)                              
[   30.040000] ALSA device list:                                                                                                  
[   30.080000]   #0: Analog Devices AD1889 at 0xfffffffff400c000 irq 19                                                           
[   30.270000] sd 1:0:4:0: [sdb] Attached SCSI disk                                                                               
[   30.340000] sd 1:0:6:0: [sdd] Attached SCSI disk                                                                               
[   30.510000] sd 1:0:3:0: [sda] Attached SCSI disk                                                                               
[   30.580000] REISERFS (device sda3): found reiserfs format "3.6" with standard journal                                          
[   30.670000] REISERFS (device sda3): using ordered data mode                                                                    
[   30.740000] reiserfs: using flush barriers                                                                                     
[   30.790000] REISERFS (device sda3): journal params: device sda3, size 8192, journal first block 18, max trans len 1024, max ba0
[   30.980000] REISERFS (device sda3): checking transaction log (sda3)                                                            
[   31.090000] REISERFS (device sda3): Using r5 hash to sort names                                                                
[   31.160000] VFS: Mounted root (reiserfs filesystem) readonly on device 8:3.                                                    
[   31.250000] Freeing unused kernel memory: 176K (000000004088c000 - 00000000408b8000)                                           
Mount failed for selinuxfs on /sys/fs/selinux:  No such file or directory                                                         
INIT: version 2.88 booting                                                                                                        
Using makefile-style concurrent boot in runlevel S.                                                                               
Starting the hotplug events dispatcher: udevd.                                                                                    
Synthesizing the initial hotplug events...done.                                                                                   
Waiting for /dev to be fully populated...[   35.260000] bttv: driver version 0.9.19 loaded                                        
[   35.310000] bttv: using 8 buffers with 2080k (520 pages) each for capture                                                      
[   35.400000] bttv: Bt8xx card found (0)                                                                                         
[   35.440000] bttv: 0: Bt878 (rev 17) at 0000:03:08.0, irq: 26, latency: 255, mmio: 0xfffffffff5007000                           
[   35.630000] bttv: 0: detected: Provideo PV150B-1 [card=98], PCI subsystem ID is aa04:1464                                      
[   35.730000] bttv: 0: using: ProVideo PV150 [card=98,autodetected]                                                              
[   35.800000] bttv: 0: tuner absent                                                                                              
[   35.840000] bttv: 0: Setting PLL: 28636363 => 35468950 (needs up to 100ms)                                                     
[   37.550000] bttv: PLL set ok                                                                                                   
[   37.580000] bttv: 0: registered device video0                                                                                  
[   37.630000] bttv: 0: registered device vbi0                                                                                    
[   37.760000] bttv: Bt8xx card found (1)                                                                                         
[   37.810000] bttv: 1: Bt878 (rev 17) at 0000:03:09.0, irq: 27, latency: 255, mmio: 0xfffffffff5005000                           
[   37.920000] bttv: 1: detected: Provideo PV150B-2 [card=98], PCI subsystem ID is aa05:1465                                      
[   38.020000] bttv: 1: using: ProVideo PV150 [card=98,autodetected]                                                              
[   38.090000] bttv: 1: tuner absent                                                                                              
[   38.130000] bttv: 1: Setting PLL: 28636363 => 35468950 (needs up to 100ms)                                                     
[   38.290000] bttv: PLL set ok                                                                                                   
[   38.320000] bttv: 1: registered device video1                                                                                  
[   38.370000] bttv: 1: registered device vbi1                                                                                    
[   38.470000] bttv: Bt8xx card found (2)                                                                                         
[   38.520000] bttv: 2: Bt878 (rev 17) at 0000:03:0a.0, irq: 28, latency: 255, mmio: 0xfffffffff5003000                           
[   38.630000] bttv: 2: detected: Provideo PV150B-3 [card=98], PCI subsystem ID is aa06:1466                                      
[   38.730000] bttv: 2: using: ProVideo PV150 [card=98,autodetected]                                                              
[   38.800000] bttv: 2: tuner absent                                                                                              
[   38.840000] bttv: 2: Setting PLL: 28636363 => 35468950 (needs up to 100ms)                                                     
[   38.960000] bttv: PLL set ok                                                                                                   
[   38.990000] bttv: 2: registered device video2                                                                                  
[   39.040000] bttv: 2: registered device vbi2                                                                                    
[   39.110000] bttv: Bt8xx card found (3)                                                                                         
[   39.160000] bttv: 3: Bt878 (rev 17) at 0000:03:0b.0, irq: 29, latency: 255, mmio: 0xfffffffff5001000                           
[   39.270000] bttv: 3: detected: Provideo PV150B-4 [card=98], PCI subsystem ID is aa07:1467                                      
[   39.360000] bttv: 3: using: ProVideo PV150 [card=98,autodetected]                                                              
[   39.440000] bttv: 3: tuner absent                                                                                              
[   39.480000] bttv: 3: Setting PLL: 28636363 => 35468950 (needs up to 100ms)                                                     
[   39.600000] bttv: PLL set ok                                                                                                   
[   39.630000] bttv: 3: registered device video3                                                                                  
[   39.680000] bttv: 3: registered device vbi3                                                                                    
[   39.740000] bttv: Bt8xx card found (4)                                                                                         
[   39.790000] bttv: 4: Bt878 (rev 17) at 0000:04:08.0, irq: 30, latency: 255, mmio: 0xfffffffff5107000                           
[   39.900000] bttv: 4: detected: Provideo PV150A-1 [card=98], PCI subsystem ID is aa00:1460                                      
[   40.000000] bttv: 4: using: ProVideo PV150 [card=98,autodetected]                                                              
[   40.070000] bttv: 4: tuner absent                                                                                              
[   40.110000] bttv: 4: Setting PLL: 28636363 => 35468950 (needs up to 100ms)                                                     
[   40.240000] bttv: PLL set ok                                                                                                   
[   40.270000] bttv: 4: registered device video4                                                                                  
[   40.320000] bttv: 4: registered device vbi4                                                                                    
[   40.380000] bttv: Bt8xx card found (5)                                                                                         
[   40.420000] bttv: 5: Bt878 (rev 17) at 0000:04:09.0, irq: 31, latency: 255, mmio: 0xfffffffff5105000                           
[   40.530000] bttv: 5: detected: Provideo PV150A-2 [card=98], PCI subsystem ID is aa01:1461                                      
[   40.630000] bttv: 5: using: ProVideo PV150 [card=98,autodetected]                                                              
[   40.700000] bttv: 5: tuner absent                                                                                              
[   40.740000] bttv: 5: Setting PLL: 28636363 => 35468950 (needs up to 100ms)                                                     
[   40.870000] bttv: PLL set ok                                                                                                   
[   40.900000] bttv: 5: registered device video5                                                                                  
[   40.950000] bttv: 5: registered device vbi5                                                                                    
[   41.010000] bttv: Bt8xx card found (6)                                                                                         
[   41.050000] bttv: 6: Bt878 (rev 17) at 0000:04:0a.0, irq: 32, latency: 255, mmio: 0xfffffffff5103000                           
[   41.160000] bttv: 6: detected: Provideo PV150A-3 [card=98], PCI subsystem ID is aa02:1462                                      
[   41.260000] bttv: 6: using: ProVideo PV150 [card=98,autodetected]                                                              
[   41.330000] bttv: 6: tuner absent                                                                                              
[   41.370000] bttv: 6: Setting PLL: 28636363 => 35468950 (needs up to 100ms)                                                     
[   41.500000] bttv: PLL set ok                                                                                                   
[   41.530000] bttv: 6: registered device video6                                                                                  
[   41.580000] bttv: 6: registered device vbi6                                                                                    
[   41.640000] bttv: Bt8xx card found (7)                                                                                         
[   41.680000] bttv: 7: Bt878 (rev 17) at 0000:04:0b.0, irq: 29, latency: 255, mmio: 0xfffffffff5101000                           
[   41.790000] bttv: 7: subsystem: 2201:1061 (UNKNOWN)                                                                            
[   41.850000] bttv: 7: using:  *** UNKNOWN/GENERIC ***  [card=0,autodetected]                                                    
[   41.970000] bttv: 7: tuner type unset
[   42.020000] bttv: 7: registered device video7
[   42.070000] bttv: 7: registered device vbi7
[   42.140000] IR keymap rc-hauppauge not found
[   42.200000] Registered IR keymap rc-empty
[   42.240000] input: i2c IR (Hauppauge) as /devices/virtual/rc/rc0/input0
[   42.320000] rc0: i2c IR (Hauppauge) as /devices/virtual/rc/rc0
[   42.390000] ir-kbd-i2c: i2c IR (Hauppauge) detected at i2c-7/7-0018/ir0 [bt878 #7 [sw]]

and here is the full config:

#
# Automatically generated file; DO NOT EDIT.
# Linux/parisc 3.11.0 Kernel Configuration
#
CONFIG_PARISC=y
CONFIG_MMU=y
CONFIG_STACK_GROWSUP=y
CONFIG_RWSEM_GENERIC_SPINLOCK=y
# CONFIG_ARCH_HAS_ILOG2_U32 is not set
# CONFIG_ARCH_HAS_ILOG2_U64 is not set
CONFIG_GENERIC_BUG=y
CONFIG_GENERIC_HWEIGHT=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_TIME_LOW_RES=y
CONFIG_HAVE_LATENCYTOP_SUPPORT=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_DEFCONFIG_LIST="/lib/modules/$UNAME_RELEASE/.config"
CONFIG_IRQ_WORK=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
CONFIG_CROSS_COMPILE=""
# CONFIG_COMPILE_TEST is not set
CONFIG_LOCALVERSION=""
# CONFIG_LOCALVERSION_AUTO is not set
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SWAP=y
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
CONFIG_POSIX_MQUEUE=y
CONFIG_POSIX_MQUEUE_SYSCTL=y
# CONFIG_FHANDLE is not set
# CONFIG_AUDIT is not set
CONFIG_HAVE_GENERIC_HARDIRQS=y

#
# IRQ subsystem
#
CONFIG_GENERIC_HARDIRQS=y
CONFIG_GENERIC_IRQ_PROBE=y

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
# CONFIG_BSD_PROCESS_ACCT is not set
# CONFIG_TASKSTATS is not set

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
# CONFIG_PREEMPT_RCU is not set
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_FANOUT=32
CONFIG_RCU_FANOUT_LEAF=16
# CONFIG_RCU_FANOUT_EXACT is not set
# CONFIG_TREE_RCU_TRACE is not set
# CONFIG_RCU_NOCB_CPU is not set
CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
CONFIG_LOG_BUF_SHIFT=15
# CONFIG_CGROUPS is not set
# CONFIG_CHECKPOINT_RESTORE is not set
CONFIG_NAMESPACES=y
# CONFIG_UTS_NS is not set
# CONFIG_IPC_NS is not set
# CONFIG_USER_NS is not set
# CONFIG_PID_NS is not set
# CONFIG_NET_NS is not set
CONFIG_UIDGID_CONVERTED=y
# CONFIG_UIDGID_STRICT_TYPE_CHECKS is not set
# CONFIG_SCHED_AUTOGROUP is not set
# CONFIG_SYSFS_DEPRECATED is not set
# CONFIG_RELAY is not set
# CONFIG_BLK_DEV_INITRD is not set
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_SYSCTL=y
CONFIG_ANON_INODES=y
CONFIG_SYSCTL_ARCH_UNALIGN_ALLOW=y
# CONFIG_EXPERT is not set
# CONFIG_SYSCTL_SYSCALL is not set
CONFIG_KALLSYMS=y
# CONFIG_KALLSYMS_ALL is not set
CONFIG_PRINTK=y
CONFIG_BUG=y
CONFIG_ELF_CORE=y
CONFIG_BASE_FULL=y
CONFIG_FUTEX=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
CONFIG_PCI_QUIRKS=y
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y

#
# Kernel Performance Events And Counters
#
# CONFIG_PERF_EVENTS is not set
CONFIG_VM_EVENT_COUNTERS=y
# CONFIG_COMPAT_BRK is not set
CONFIG_SLAB=y
# CONFIG_SLUB is not set
# CONFIG_PROFILING is not set
CONFIG_HAVE_OPROFILE=y
CONFIG_HAVE_64BIT_ALIGNED_ACCESS=y
CONFIG_USE_GENERIC_SMP_HELPERS=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_CLONE_BACKWARDS=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
# CONFIG_HAVE_GENERIC_DMA_COHERENT is not set
CONFIG_SLABINFO=y
CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=0
CONFIG_MODULES=y
# CONFIG_MODULE_FORCE_LOAD is not set
CONFIG_MODULE_UNLOAD=y
# CONFIG_MODULE_FORCE_UNLOAD is not set
# CONFIG_MODVERSIONS is not set
# CONFIG_MODULE_SRCVERSION_ALL is not set
# CONFIG_MODULE_SIG is not set
CONFIG_INIT_ALL_POSSIBLE=y
CONFIG_STOP_MACHINE=y
CONFIG_BLOCK=y
# CONFIG_BLK_DEV_BSG is not set
# CONFIG_BLK_DEV_BSGLIB is not set
# CONFIG_BLK_DEV_INTEGRITY is not set

#
# Partition Types
#
# CONFIG_PARTITION_ADVANCED is not set
CONFIG_MSDOS_PARTITION=y
CONFIG_EFI_PARTITION=y
CONFIG_BLOCK_COMPAT=y

#
# IO Schedulers
#
CONFIG_IOSCHED_NOOP=y
CONFIG_IOSCHED_DEADLINE=y
# CONFIG_IOSCHED_CFQ is not set
CONFIG_DEFAULT_DEADLINE=y
# CONFIG_DEFAULT_NOOP is not set
CONFIG_DEFAULT_IOSCHED="deadline"
CONFIG_BROKEN_RODATA=y
CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
CONFIG_INLINE_READ_UNLOCK=y
CONFIG_INLINE_READ_UNLOCK_IRQ=y
CONFIG_INLINE_WRITE_UNLOCK=y
CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
CONFIG_MUTEX_SPIN_ON_OWNER=y
# CONFIG_FREEZER is not set

#
# Processor type and features
#
# CONFIG_PA7000 is not set
# CONFIG_PA7100LC is not set
# CONFIG_PA7200 is not set
# CONFIG_PA7300LC is not set
CONFIG_PA8X00=y
CONFIG_PA20=y
CONFIG_PREFETCH=y
# CONFIG_MLONGCALLS is not set
CONFIG_64BIT=y
CONFIG_PARISC_PAGE_SIZE_4KB=y
# CONFIG_PARISC_PAGE_SIZE_16KB is not set
# CONFIG_PARISC_PAGE_SIZE_64KB is not set
CONFIG_SMP=y
# CONFIG_IRQSTACKS is not set
CONFIG_HOTPLUG_CPU=y
CONFIG_ARCH_SELECT_MEMORY_MODEL=y
CONFIG_ARCH_DISCONTIGMEM_ENABLE=y
CONFIG_ARCH_FLATMEM_ENABLE=y
CONFIG_ARCH_DISCONTIGMEM_DEFAULT=y
CONFIG_NODES_SHIFT=3
CONFIG_PREEMPT_NONE=y
# CONFIG_PREEMPT_VOLUNTARY is not set
# CONFIG_PREEMPT is not set
CONFIG_HZ_100=y
# CONFIG_HZ_250 is not set
# CONFIG_HZ_300 is not set
# CONFIG_HZ_1000 is not set
CONFIG_HZ=100
# CONFIG_SCHED_HRTICK is not set
CONFIG_SELECT_MEMORY_MODEL=y
# CONFIG_FLATMEM_MANUAL is not set
CONFIG_DISCONTIGMEM_MANUAL=y
CONFIG_DISCONTIGMEM=y
CONFIG_FLAT_NODE_MEM_MAP=y
CONFIG_NEED_MULTIPLE_NODES=y
# CONFIG_HAVE_BOOTMEM_INFO_NODE is not set
CONFIG_PAGEFLAGS_EXTENDED=y
CONFIG_SPLIT_PTLOCK_CPUS=4
# CONFIG_COMPACTION is not set
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_ZONE_DMA_FLAG=0
CONFIG_VIRT_TO_BUS=y
# CONFIG_KSM is not set
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
# CONFIG_CROSS_MEMORY_ATTACH is not set
# CONFIG_CLEANCACHE is not set
# CONFIG_FRONTSWAP is not set
# CONFIG_ZBUD is not set
CONFIG_COMPAT=y
CONFIG_SYSVIPC_COMPAT=y
CONFIG_NR_CPUS=2

#
# Bus options (PCI, PCMCIA, EISA, GSC, ISA)
#
# CONFIG_GSC is not set
CONFIG_PCI=y
# CONFIG_PCI_DEBUG is not set
# CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
# CONFIG_PCI_STUB is not set
# CONFIG_PCI_IOV is not set
# CONFIG_PCI_PRI is not set
# CONFIG_PCI_PASID is not set

#
# PCI host controller drivers
#
CONFIG_PCI_LBA=y
CONFIG_IOSAPIC=y
CONFIG_IOMMU_SBA=y
CONFIG_IOMMU_HELPER=y
# CONFIG_PCCARD is not set
# CONFIG_HOTPLUG_PCI is not set

#
# PA-RISC specific drivers
#
CONFIG_SUPERIO=y
CONFIG_CHASSIS_LCD_LED=y
# CONFIG_PDC_CHASSIS is not set
CONFIG_PDC_CHASSIS_WARN=y
CONFIG_PDC_STABLE=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
CONFIG_BINFMT_SCRIPT=y
# CONFIG_HAVE_AOUT is not set
CONFIG_BINFMT_MISC=y
CONFIG_COREDUMP=y
CONFIG_NET=y

#
# Networking options
#
CONFIG_PACKET=y
# CONFIG_PACKET_DIAG is not set
CONFIG_UNIX=y
# CONFIG_UNIX_DIAG is not set
# CONFIG_XFRM_USER is not set
# CONFIG_NET_KEY is not set
CONFIG_INET=y
# CONFIG_IP_MULTICAST is not set
# CONFIG_IP_ADVANCED_ROUTER is not set
# CONFIG_IP_PNP is not set
# CONFIG_NET_IPIP is not set
# CONFIG_NET_IPGRE_DEMUX is not set
# CONFIG_NET_IP_TUNNEL is not set
# CONFIG_ARPD is not set
CONFIG_SYN_COOKIES=y
# CONFIG_INET_AH is not set
# CONFIG_INET_ESP is not set
# CONFIG_INET_IPCOMP is not set
# CONFIG_INET_XFRM_TUNNEL is not set
# CONFIG_INET_TUNNEL is not set
# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
# CONFIG_INET_XFRM_MODE_TUNNEL is not set
# CONFIG_INET_XFRM_MODE_BEET is not set
# CONFIG_INET_LRO is not set
# CONFIG_INET_DIAG is not set
# CONFIG_TCP_CONG_ADVANCED is not set
CONFIG_TCP_CONG_CUBIC=y
CONFIG_DEFAULT_TCP_CONG="cubic"
# CONFIG_TCP_MD5SIG is not set
# CONFIG_IPV6 is not set
# CONFIG_NETWORK_SECMARK is not set
# CONFIG_NETWORK_PHY_TIMESTAMPING is not set
# CONFIG_NETFILTER is not set
# CONFIG_IP_DCCP is not set
# CONFIG_IP_SCTP is not set
# CONFIG_RDS is not set
# CONFIG_TIPC is not set
# CONFIG_ATM is not set
# CONFIG_L2TP is not set
# CONFIG_BRIDGE is not set
CONFIG_HAVE_NET_DSA=y
# CONFIG_VLAN_8021Q is not set
# CONFIG_DECNET is not set
# CONFIG_LLC2 is not set
# CONFIG_IPX is not set
# CONFIG_ATALK is not set
# CONFIG_X25 is not set
# CONFIG_LAPB is not set
# CONFIG_PHONET is not set
# CONFIG_IEEE802154 is not set
# CONFIG_NET_SCHED is not set
# CONFIG_DCB is not set
# CONFIG_BATMAN_ADV is not set
# CONFIG_OPENVSWITCH is not set
# CONFIG_VSOCKETS is not set
# CONFIG_NETLINK_MMAP is not set
# CONFIG_NETLINK_DIAG is not set
# CONFIG_NET_MPLS_GSO is not set
CONFIG_RPS=y
CONFIG_RFS_ACCEL=y
CONFIG_XPS=y
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
CONFIG_NET_FLOW_LIMIT=y

#
# Network testing
#
# CONFIG_NET_PKTGEN is not set
# CONFIG_HAMRADIO is not set
# CONFIG_CAN is not set
# CONFIG_IRDA is not set
# CONFIG_BT is not set
# CONFIG_AF_RXRPC is not set
# CONFIG_WIRELESS is not set
# CONFIG_WIMAX is not set
# CONFIG_RFKILL is not set
# CONFIG_NET_9P is not set
# CONFIG_CAIF is not set
# CONFIG_CEPH_LIB is not set
# CONFIG_NFC is not set

#
# Device Drivers
#

#
# Generic Driver Options
#
CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
# CONFIG_DEVTMPFS is not set
CONFIG_STANDALONE=y
CONFIG_PREVENT_FIRMWARE_BUILD=y
CONFIG_FW_LOADER=y
CONFIG_FIRMWARE_IN_KERNEL=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
# CONFIG_DEBUG_DRIVER is not set
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_SYS_HYPERVISOR is not set
# CONFIG_GENERIC_CPU_DEVICES is not set
# CONFIG_DMA_SHARED_BUFFER is not set

#
# Bus devices
#
# CONFIG_CONNECTOR is not set
# CONFIG_MTD is not set
# CONFIG_PARPORT is not set
CONFIG_BLK_DEV=y
# CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
# CONFIG_BLK_CPQ_DA is not set
# CONFIG_BLK_CPQ_CISS_DA is not set
# CONFIG_BLK_DEV_DAC960 is not set
# CONFIG_BLK_DEV_UMEM is not set
# CONFIG_BLK_DEV_COW_COMMON is not set
CONFIG_BLK_DEV_LOOP=y
CONFIG_BLK_DEV_LOOP_MIN_COUNT=2
CONFIG_BLK_DEV_CRYPTOLOOP=m
# CONFIG_BLK_DEV_DRBD is not set
# CONFIG_BLK_DEV_NBD is not set
# CONFIG_BLK_DEV_NVME is not set
# CONFIG_BLK_DEV_SX8 is not set
CONFIG_BLK_DEV_RAM=y
CONFIG_BLK_DEV_RAM_COUNT=16
CONFIG_BLK_DEV_RAM_SIZE=8192
# CONFIG_BLK_DEV_XIP is not set
# CONFIG_CDROM_PKTCDVD is not set
# CONFIG_ATA_OVER_ETH is not set
# CONFIG_BLK_DEV_HD is not set
# CONFIG_BLK_DEV_RBD is not set
# CONFIG_BLK_DEV_RSXX is not set

#
# Misc devices
#
# CONFIG_SENSORS_LIS3LV02D is not set
# CONFIG_AD525X_DPOT is not set
# CONFIG_DUMMY_IRQ is not set
# CONFIG_PHANTOM is not set
# CONFIG_SGI_IOC4 is not set
# CONFIG_TIFM_CORE is not set
# CONFIG_ICS932S401 is not set
# CONFIG_ATMEL_SSC is not set
# CONFIG_ENCLOSURE_SERVICES is not set
# CONFIG_HP_ILO is not set
# CONFIG_APDS9802ALS is not set
# CONFIG_ISL29003 is not set
# CONFIG_ISL29020 is not set
# CONFIG_SENSORS_TSL2550 is not set
# CONFIG_SENSORS_BH1780 is not set
# CONFIG_SENSORS_BH1770 is not set
# CONFIG_SENSORS_APDS990X is not set
# CONFIG_HMC6352 is not set
# CONFIG_DS1682 is not set
# CONFIG_BMP085_I2C is not set
# CONFIG_PCH_PHUB is not set
# CONFIG_USB_SWITCH_FSA9480 is not set
# CONFIG_SRAM is not set
# CONFIG_C2PORT is not set

#
# EEPROM support
#
# CONFIG_EEPROM_AT24 is not set
# CONFIG_EEPROM_LEGACY is not set
# CONFIG_EEPROM_MAX6875 is not set
# CONFIG_EEPROM_93CX6 is not set
# CONFIG_CB710_CORE is not set

#
# Texas Instruments shared transport line discipline
#
# CONFIG_SENSORS_LIS3_I2C is not set

#
# Altera FPGA firmware download module
#
# CONFIG_ALTERA_STAPL is not set
CONFIG_HAVE_IDE=y
# CONFIG_IDE is not set

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
CONFIG_RAID_ATTRS=y
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
CONFIG_SCSI_TGT=y
# CONFIG_SCSI_NETLINK is not set
# CONFIG_SCSI_PROC_FS is not set

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=y
# CONFIG_CHR_DEV_ST is not set
# CONFIG_CHR_DEV_OSST is not set
CONFIG_BLK_DEV_SR=y
# CONFIG_BLK_DEV_SR_VENDOR is not set
CONFIG_CHR_DEV_SG=y
# CONFIG_CHR_DEV_SCH is not set
CONFIG_SCSI_MULTI_LUN=y
CONFIG_SCSI_CONSTANTS=y
CONFIG_SCSI_LOGGING=y
# CONFIG_SCSI_SCAN_ASYNC is not set

#
# SCSI Transports
#
CONFIG_SCSI_SPI_ATTRS=y
# CONFIG_SCSI_FC_ATTRS is not set
# CONFIG_SCSI_ISCSI_ATTRS is not set
# CONFIG_SCSI_SAS_ATTRS is not set
# CONFIG_SCSI_SAS_LIBSAS is not set
# CONFIG_SCSI_SRP_ATTRS is not set
CONFIG_SCSI_LOWLEVEL=y
# CONFIG_ISCSI_TCP is not set
# CONFIG_ISCSI_BOOT_SYSFS is not set
# CONFIG_SCSI_CXGB3_ISCSI is not set
# CONFIG_SCSI_CXGB4_ISCSI is not set
# CONFIG_SCSI_BNX2_ISCSI is not set
# CONFIG_SCSI_BNX2X_FCOE is not set
# CONFIG_BE2ISCSI is not set
# CONFIG_BLK_DEV_3W_XXXX_RAID is not set
# CONFIG_SCSI_HPSA is not set
# CONFIG_SCSI_3W_9XXX is not set
# CONFIG_SCSI_3W_SAS is not set
# CONFIG_SCSI_ACARD is not set
# CONFIG_SCSI_AACRAID is not set
# CONFIG_SCSI_AIC7XXX is not set
# CONFIG_SCSI_AIC7XXX_OLD is not set
# CONFIG_SCSI_AIC79XX is not set
# CONFIG_SCSI_AIC94XX is not set
# CONFIG_SCSI_MVSAS is not set
# CONFIG_SCSI_MVUMI is not set
# CONFIG_SCSI_DPT_I2O is not set
# CONFIG_SCSI_ADVANSYS is not set
# CONFIG_SCSI_ARCMSR is not set
# CONFIG_MEGARAID_NEWGEN is not set
# CONFIG_MEGARAID_LEGACY is not set
# CONFIG_MEGARAID_SAS is not set
# CONFIG_SCSI_MPT2SAS is not set
# CONFIG_SCSI_MPT3SAS is not set
# CONFIG_SCSI_UFSHCD is not set
# CONFIG_SCSI_HPTIOP is not set
# CONFIG_LIBFC is not set
# CONFIG_LIBFCOE is not set
# CONFIG_FCOE is not set
# CONFIG_SCSI_DMX3191D is not set
# CONFIG_SCSI_FUTURE_DOMAIN is not set
# CONFIG_SCSI_IPS is not set
# CONFIG_SCSI_INITIO is not set
# CONFIG_SCSI_INIA100 is not set
# CONFIG_SCSI_STEX is not set
CONFIG_SCSI_SYM53C8XX_2=y
CONFIG_SCSI_SYM53C8XX_DMA_ADDRESSING_MODE=1
CONFIG_SCSI_SYM53C8XX_DEFAULT_TAGS=16
CONFIG_SCSI_SYM53C8XX_MAX_TAGS=64
CONFIG_SCSI_SYM53C8XX_MMIO=y
# CONFIG_SCSI_QLOGIC_1280 is not set
# CONFIG_SCSI_QLA_FC is not set
# CONFIG_SCSI_QLA_ISCSI is not set
# CONFIG_SCSI_LPFC is not set
# CONFIG_SCSI_DC395x is not set
# CONFIG_SCSI_DC390T is not set
# CONFIG_SCSI_DEBUG is not set
# CONFIG_SCSI_PMCRAID is not set
# CONFIG_SCSI_PM8001 is not set
# CONFIG_SCSI_SRP is not set
# CONFIG_SCSI_BFA_FC is not set
# CONFIG_SCSI_CHELSIO_FCOE is not set
# CONFIG_SCSI_DH is not set
# CONFIG_SCSI_OSD_INITIATOR is not set
# CONFIG_ATA is not set
# CONFIG_MD is not set
# CONFIG_TARGET_CORE is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
# CONFIG_FIREWIRE is not set
# CONFIG_FIREWIRE_NOSY is not set
# CONFIG_I2O is not set
CONFIG_NETDEVICES=y
CONFIG_MII=y
CONFIG_NET_CORE=y
# CONFIG_BONDING is not set
# CONFIG_DUMMY is not set
# CONFIG_EQUALIZER is not set
# CONFIG_NET_FC is not set
# CONFIG_NET_TEAM is not set
# CONFIG_MACVLAN is not set
# CONFIG_VXLAN is not set
# CONFIG_NETCONSOLE is not set
# CONFIG_NETPOLL is not set
# CONFIG_NET_POLL_CONTROLLER is not set
CONFIG_TUN=y
# CONFIG_VETH is not set
# CONFIG_NLMON is not set
# CONFIG_ARCNET is not set

#
# CAIF transport drivers
#

#
# Distributed Switch Architecture drivers
#
# CONFIG_NET_DSA_MV88E6XXX is not set
# CONFIG_NET_DSA_MV88E6060 is not set
# CONFIG_NET_DSA_MV88E6XXX_NEED_PPU is not set
# CONFIG_NET_DSA_MV88E6131 is not set
# CONFIG_NET_DSA_MV88E6123_61_65 is not set
CONFIG_ETHERNET=y
CONFIG_NET_VENDOR_3COM=y
CONFIG_VORTEX=y
# CONFIG_TYPHOON is not set
# CONFIG_NET_VENDOR_ADAPTEC is not set
# CONFIG_NET_VENDOR_ALTEON is not set
# CONFIG_NET_VENDOR_AMD is not set
# CONFIG_NET_VENDOR_ARC is not set
# CONFIG_NET_VENDOR_ATHEROS is not set
# CONFIG_NET_CADENCE is not set
# CONFIG_NET_VENDOR_BROADCOM is not set
# CONFIG_NET_VENDOR_BROCADE is not set
# CONFIG_NET_CALXEDA_XGMAC is not set
# CONFIG_NET_VENDOR_CHELSIO is not set
# CONFIG_NET_VENDOR_CISCO is not set
# CONFIG_DNET is not set
CONFIG_NET_VENDOR_DEC=y
CONFIG_NET_TULIP=y
# CONFIG_DE2104X is not set
CONFIG_TULIP=y
# CONFIG_TULIP_MWI is not set
# CONFIG_TULIP_MMIO is not set
# CONFIG_TULIP_NAPI is not set
# CONFIG_DE4X5 is not set
# CONFIG_WINBOND_840 is not set
# CONFIG_DM9102 is not set
# CONFIG_ULI526X is not set
# CONFIG_NET_VENDOR_DLINK is not set
# CONFIG_NET_VENDOR_EMULEX is not set
# CONFIG_NET_VENDOR_EXAR is not set
# CONFIG_NET_VENDOR_HP is not set
# CONFIG_NET_VENDOR_INTEL is not set
# CONFIG_IP1000 is not set
# CONFIG_JME is not set
# CONFIG_NET_VENDOR_MARVELL is not set
# CONFIG_NET_VENDOR_MELLANOX is not set
# CONFIG_NET_VENDOR_MICREL is not set
# CONFIG_NET_VENDOR_MYRI is not set
# CONFIG_FEALNX is not set
# CONFIG_NET_VENDOR_NATSEMI is not set
# CONFIG_NET_VENDOR_NVIDIA is not set
# CONFIG_NET_VENDOR_OKI is not set
# CONFIG_ETHOC is not set
# CONFIG_NET_PACKET_ENGINE is not set
# CONFIG_NET_VENDOR_QLOGIC is not set
# CONFIG_NET_VENDOR_REALTEK is not set
# CONFIG_SH_ETH is not set
# CONFIG_NET_VENDOR_RDC is not set
# CONFIG_NET_VENDOR_SEEQ is not set
# CONFIG_NET_VENDOR_SILAN is not set
# CONFIG_NET_VENDOR_SIS is not set
# CONFIG_SFC is not set
# CONFIG_NET_VENDOR_SMSC is not set
# CONFIG_NET_VENDOR_STMICRO is not set
# CONFIG_NET_VENDOR_SUN is not set
# CONFIG_NET_VENDOR_TEHUTI is not set
# CONFIG_NET_VENDOR_TI is not set
# CONFIG_NET_VENDOR_VIA is not set
# CONFIG_NET_VENDOR_WIZNET is not set
# CONFIG_FDDI is not set
# CONFIG_HIPPI is not set
# CONFIG_PHYLIB is not set
# CONFIG_PPP is not set
# CONFIG_SLIP is not set

#
# USB Network Adapters
#
# CONFIG_USB_CATC is not set
# CONFIG_USB_KAWETH is not set
# CONFIG_USB_PEGASUS is not set
# CONFIG_USB_RTL8150 is not set
# CONFIG_USB_RTL8152 is not set
# CONFIG_USB_USBNET is not set
# CONFIG_USB_IPHETH is not set
# CONFIG_WLAN is not set

#
# Enable WiMAX (Networking options) to see the WiMAX drivers
#
# CONFIG_WAN is not set
# CONFIG_VMXNET3 is not set
# CONFIG_ISDN is not set

#
# Input device support
#
CONFIG_INPUT=y
# CONFIG_INPUT_FF_MEMLESS is not set
# CONFIG_INPUT_POLLDEV is not set
# CONFIG_INPUT_SPARSEKMAP is not set
# CONFIG_INPUT_MATRIXKMAP is not set

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
# CONFIG_INPUT_JOYDEV is not set
# CONFIG_INPUT_EVDEV is not set
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
# CONFIG_INPUT_KEYBOARD is not set
# CONFIG_INPUT_MOUSE is not set
# CONFIG_INPUT_JOYSTICK is not set
# CONFIG_INPUT_TABLET is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_SERIO_SERPORT=y
# CONFIG_SERIO_PCIPS2 is not set
# CONFIG_SERIO_RAW is not set
# CONFIG_SERIO_ALTERA_PS2 is not set
# CONFIG_SERIO_PS2MULT is not set
# CONFIG_SERIO_ARC_PS2 is not set
# CONFIG_GAMEPORT is not set

#
# Character devices
#
CONFIG_TTY=y
CONFIG_VT=y
CONFIG_CONSOLE_TRANSLATIONS=y
CONFIG_VT_CONSOLE=y
CONFIG_HW_CONSOLE=y
# CONFIG_VT_HW_CONSOLE_BINDING is not set
CONFIG_UNIX98_PTYS=y
# CONFIG_DEVPTS_MULTIPLE_INSTANCES is not set
# CONFIG_LEGACY_PTYS is not set
# CONFIG_SERIAL_NONSTANDARD is not set
# CONFIG_NOZOMI is not set
# CONFIG_N_GSM is not set
# CONFIG_TRACE_SINK is not set
# CONFIG_DEVKMEM is not set

#
# Serial drivers
#
CONFIG_SERIAL_8250=y
# CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_8250_PCI=y
CONFIG_SERIAL_8250_NR_UARTS=16
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
CONFIG_SERIAL_8250_EXTENDED=y
# CONFIG_SERIAL_8250_MANY_PORTS is not set
CONFIG_SERIAL_8250_SHARE_IRQ=y
# CONFIG_SERIAL_8250_DETECT_IRQ is not set
# CONFIG_SERIAL_8250_RSA is not set
# CONFIG_SERIAL_8250_DW is not set

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_MFD_HSU is not set
# CONFIG_PDC_CONSOLE is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
# CONFIG_SERIAL_JSM is not set
# CONFIG_SERIAL_SCCNXP is not set
# CONFIG_SERIAL_TIMBERDALE is not set
# CONFIG_SERIAL_ALTERA_JTAGUART is not set
# CONFIG_SERIAL_ALTERA_UART is not set
# CONFIG_SERIAL_PCH_UART is not set
# CONFIG_SERIAL_ARC is not set
# CONFIG_SERIAL_RP2 is not set
# CONFIG_SERIAL_FSL_LPUART is not set
# CONFIG_IPMI_HANDLER is not set
# CONFIG_HW_RANDOM is not set
# CONFIG_R3964 is not set
# CONFIG_APPLICOM is not set
# CONFIG_RAW_DRIVER is not set
# CONFIG_TCG_TPM is not set
CONFIG_DEVPORT=y
CONFIG_I2C=y
CONFIG_I2C_BOARDINFO=y
# CONFIG_I2C_COMPAT is not set
# CONFIG_I2C_CHARDEV is not set
# CONFIG_I2C_MUX is not set
CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_ALGOBIT=m

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
# CONFIG_I2C_ALI1535 is not set
# CONFIG_I2C_ALI1563 is not set
# CONFIG_I2C_ALI15X3 is not set
# CONFIG_I2C_AMD756 is not set
# CONFIG_I2C_AMD8111 is not set
# CONFIG_I2C_I801 is not set
# CONFIG_I2C_ISCH is not set
# CONFIG_I2C_PIIX4 is not set
# CONFIG_I2C_NFORCE2 is not set
# CONFIG_I2C_SIS5595 is not set
# CONFIG_I2C_SIS630 is not set
# CONFIG_I2C_SIS96X is not set
# CONFIG_I2C_VIA is not set
# CONFIG_I2C_VIAPRO is not set

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_DESIGNWARE_PCI is not set
# CONFIG_I2C_EG20T is not set
# CONFIG_I2C_OCORES is not set
# CONFIG_I2C_PCA_PLATFORM is not set
# CONFIG_I2C_PXA_PCI is not set
# CONFIG_I2C_SIMTEC is not set
# CONFIG_I2C_XILINX is not set

#
# External I2C/SMBus adapter drivers
#
# CONFIG_I2C_DIOLAN_U2C is not set
# CONFIG_I2C_PARPORT_LIGHT is not set
# CONFIG_I2C_TAOS_EVM is not set
# CONFIG_I2C_TINY_USB is not set

#
# Other I2C/SMBus bus drivers
#
# CONFIG_I2C_STUB is not set
# CONFIG_I2C_DEBUG_CORE is not set
# CONFIG_I2C_DEBUG_ALGO is not set
# CONFIG_I2C_DEBUG_BUS is not set
# CONFIG_SPI is not set
# CONFIG_HSI is not set

#
# PPS support
#
# CONFIG_PPS is not set

#
# PPS generators support
#

#
# PTP clock support
#
# CONFIG_PTP_1588_CLOCK is not set

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
CONFIG_GPIO_DEVRES=y
# CONFIG_W1 is not set
# CONFIG_POWER_SUPPLY is not set
# CONFIG_POWER_AVS is not set
# CONFIG_HWMON is not set
# CONFIG_THERMAL is not set
# CONFIG_WATCHDOG is not set
CONFIG_SSB_POSSIBLE=y

#
# Sonics Silicon Backplane
#
# CONFIG_SSB is not set
CONFIG_BCMA_POSSIBLE=y

#
# Broadcom specific AMBA
#
# CONFIG_BCMA is not set

#
# Multifunction device drivers
#
# CONFIG_MFD_CORE is not set
# CONFIG_MFD_AS3711 is not set
# CONFIG_PMIC_ADP5520 is not set
# CONFIG_MFD_CROS_EC is not set
# CONFIG_PMIC_DA903X is not set
# CONFIG_MFD_DA9052_I2C is not set
# CONFIG_MFD_DA9055 is not set
# CONFIG_MFD_MC13XXX_I2C is not set
# CONFIG_HTC_PASIC3 is not set
# CONFIG_LPC_ICH is not set
# CONFIG_LPC_SCH is not set
# CONFIG_MFD_JANZ_CMODIO is not set
# CONFIG_MFD_KEMPLD is not set
# CONFIG_MFD_88PM800 is not set
# CONFIG_MFD_88PM805 is not set
# CONFIG_MFD_88PM860X is not set
# CONFIG_MFD_MAX77686 is not set
# CONFIG_MFD_MAX77693 is not set
# CONFIG_MFD_MAX8907 is not set
# CONFIG_MFD_MAX8925 is not set
# CONFIG_MFD_MAX8997 is not set
# CONFIG_MFD_MAX8998 is not set
# CONFIG_MFD_VIPERBOARD is not set
# CONFIG_MFD_RETU is not set
# CONFIG_MFD_PCF50633 is not set
# CONFIG_MFD_RDC321X is not set
# CONFIG_MFD_RTSX_PCI is not set
# CONFIG_MFD_RC5T583 is not set
# CONFIG_MFD_SEC_CORE is not set
# CONFIG_MFD_SI476X_CORE is not set
# CONFIG_MFD_SM501 is not set
# CONFIG_MFD_SMSC is not set
# CONFIG_ABX500_CORE is not set
# CONFIG_MFD_STMPE is not set
# CONFIG_MFD_SYSCON is not set
# CONFIG_MFD_TI_AM335X_TSCADC is not set
# CONFIG_MFD_LP8788 is not set
# CONFIG_MFD_PALMAS is not set
# CONFIG_TPS6105X is not set
# CONFIG_TPS6507X is not set
# CONFIG_MFD_TPS65090 is not set
# CONFIG_MFD_TPS65217 is not set
# CONFIG_MFD_TPS6586X is not set
# CONFIG_MFD_TPS80031 is not set
# CONFIG_TWL4030_CORE is not set
# CONFIG_TWL6040_CORE is not set
# CONFIG_MFD_WL1273_CORE is not set
# CONFIG_MFD_LM3533 is not set
# CONFIG_MFD_TC3589X is not set
# CONFIG_MFD_TMIO is not set
# CONFIG_MFD_VX855 is not set
# CONFIG_MFD_ARIZONA_I2C is not set
# CONFIG_MFD_WM8400 is not set
# CONFIG_MFD_WM831X_I2C is not set
# CONFIG_MFD_WM8350_I2C is not set
# CONFIG_MFD_WM8994 is not set
# CONFIG_REGULATOR is not set
CONFIG_MEDIA_SUPPORT=y

#
# Multimedia core support
#
# CONFIG_MEDIA_CAMERA_SUPPORT is not set
CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
# CONFIG_MEDIA_DIGITAL_TV_SUPPORT is not set
# CONFIG_MEDIA_RADIO_SUPPORT is not set
CONFIG_MEDIA_RC_SUPPORT=y
CONFIG_VIDEO_DEV=y
CONFIG_VIDEO_V4L2=y
# CONFIG_VIDEO_ADV_DEBUG is not set
# CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
CONFIG_VIDEO_TUNER=m
CONFIG_VIDEOBUF_GEN=m
CONFIG_VIDEOBUF_DMA_SG=m
# CONFIG_VIDEO_V4L2_INT_DEVICE is not set
# CONFIG_TTPCI_EEPROM is not set

#
# Media drivers
#
CONFIG_RC_CORE=y
# CONFIG_RC_MAP is not set
# CONFIG_RC_DECODERS is not set
# CONFIG_RC_DEVICES is not set
# CONFIG_MEDIA_USB_SUPPORT is not set
CONFIG_MEDIA_PCI_SUPPORT=y

#
# Media capture/analog TV support
#
# CONFIG_VIDEO_IVTV is not set
# CONFIG_VIDEO_ZORAN is not set
# CONFIG_VIDEO_HEXIUM_GEMINI is not set
# CONFIG_VIDEO_HEXIUM_ORION is not set
# CONFIG_VIDEO_MXB is not set

#
# Media capture/analog/hybrid TV support
#
# CONFIG_VIDEO_CX25821 is not set
# CONFIG_VIDEO_CX88 is not set
CONFIG_VIDEO_BT848=m
# CONFIG_VIDEO_SAA7134 is not set

#
# Supported MMC/SDIO adapters
#
CONFIG_VIDEO_BTCX=m
CONFIG_VIDEO_TVEEPROM=m
# CONFIG_CYPRESS_FIRMWARE is not set

#
# Media ancillary drivers (tuners, sensors, i2c, frontends)
#
CONFIG_MEDIA_SUBDRV_AUTOSELECT=y
CONFIG_MEDIA_ATTACH=y
CONFIG_VIDEO_IR_I2C=y

#
# Audio decoders, processors and mixers
#
CONFIG_VIDEO_TVAUDIO=m
CONFIG_VIDEO_TDA7432=m
CONFIG_VIDEO_MSP3400=m

#
# RDS decoders
#
CONFIG_VIDEO_SAA6588=m

#
# Video decoders
#

#
# Video and audio decoders
#

#
# Video encoders
#

#
# Camera sensor devices
#

#
# Flash devices
#

#
# Video improvement chips
#

#
# Miscelaneous helper chips
#

#
# Sensors used on soc_camera driver
#
CONFIG_MEDIA_TUNER=y
CONFIG_MEDIA_TUNER_SIMPLE=y
CONFIG_MEDIA_TUNER_TDA8290=y
CONFIG_MEDIA_TUNER_TDA827X=y
CONFIG_MEDIA_TUNER_TDA18271=y
CONFIG_MEDIA_TUNER_TDA9887=y
CONFIG_MEDIA_TUNER_MT20XX=y
CONFIG_MEDIA_TUNER_XC2028=y
CONFIG_MEDIA_TUNER_XC5000=y
CONFIG_MEDIA_TUNER_XC4000=y
CONFIG_MEDIA_TUNER_MC44S803=y

#
# Tools to develop new frontends
#
# CONFIG_DVB_DUMMY_FE is not set

#
# Graphics support
#
# CONFIG_AGP is not set
CONFIG_VGA_ARB=y
CONFIG_VGA_ARB_MAX_GPUS=16
# CONFIG_DRM is not set
# CONFIG_VGASTATE is not set
# CONFIG_VIDEO_OUTPUT_CONTROL is not set
# CONFIG_FB is not set
# CONFIG_EXYNOS_VIDEO is not set
# CONFIG_BACKLIGHT_LCD_SUPPORT is not set

#
# Console display driver support
#
CONFIG_DUMMY_CONSOLE=y
CONFIG_DUMMY_CONSOLE_COLUMNS=160
CONFIG_DUMMY_CONSOLE_ROWS=64
# CONFIG_STI_CONSOLE is not set
CONFIG_SOUND=y
# CONFIG_SOUND_OSS_CORE is not set
CONFIG_SND=y
CONFIG_SND_TIMER=y
CONFIG_SND_PCM=y
# CONFIG_SND_SEQUENCER is not set
# CONFIG_SND_MIXER_OSS is not set
# CONFIG_SND_PCM_OSS is not set
# CONFIG_SND_DYNAMIC_MINORS is not set
# CONFIG_SND_SUPPORT_OLD_API is not set
# CONFIG_SND_VERBOSE_PROCFS is not set
# CONFIG_SND_VERBOSE_PRINTK is not set
# CONFIG_SND_DEBUG is not set
CONFIG_SND_VMASTER=y
# CONFIG_SND_RAWMIDI_SEQ is not set
# CONFIG_SND_OPL3_LIB_SEQ is not set
# CONFIG_SND_OPL4_LIB_SEQ is not set
# CONFIG_SND_SBAWE_SEQ is not set
# CONFIG_SND_EMU10K1_SEQ is not set
CONFIG_SND_AC97_CODEC=y
# CONFIG_SND_DRIVERS is not set
CONFIG_SND_PCI=y
CONFIG_SND_AD1889=y
# CONFIG_SND_ALS300 is not set
# CONFIG_SND_ALI5451 is not set
# CONFIG_SND_ATIIXP is not set
# CONFIG_SND_ATIIXP_MODEM is not set
# CONFIG_SND_AU8810 is not set
# CONFIG_SND_AU8820 is not set
# CONFIG_SND_AU8830 is not set
# CONFIG_SND_AW2 is not set
# CONFIG_SND_AZT3328 is not set
# CONFIG_SND_BT87X is not set
# CONFIG_SND_CA0106 is not set
# CONFIG_SND_CMIPCI is not set
# CONFIG_SND_OXYGEN is not set
# CONFIG_SND_CS4281 is not set
# CONFIG_SND_CS46XX is not set
# CONFIG_SND_CS5535AUDIO is not set
# CONFIG_SND_CTXFI is not set
# CONFIG_SND_DARLA20 is not set
# CONFIG_SND_GINA20 is not set
# CONFIG_SND_LAYLA20 is not set
# CONFIG_SND_DARLA24 is not set
# CONFIG_SND_GINA24 is not set
# CONFIG_SND_LAYLA24 is not set
# CONFIG_SND_MONA is not set
# CONFIG_SND_MIA is not set
# CONFIG_SND_ECHO3G is not set
# CONFIG_SND_INDIGO is not set
# CONFIG_SND_INDIGOIO is not set
# CONFIG_SND_INDIGODJ is not set
# CONFIG_SND_INDIGOIOX is not set
# CONFIG_SND_INDIGODJX is not set
# CONFIG_SND_EMU10K1 is not set
# CONFIG_SND_EMU10K1X is not set
# CONFIG_SND_ENS1370 is not set
# CONFIG_SND_ENS1371 is not set
# CONFIG_SND_ES1938 is not set
# CONFIG_SND_ES1968 is not set
# CONFIG_SND_FM801 is not set
# CONFIG_SND_HDA_INTEL is not set
# CONFIG_SND_HDSP is not set
# CONFIG_SND_HDSPM is not set
# CONFIG_SND_ICE1712 is not set
# CONFIG_SND_ICE1724 is not set
# CONFIG_SND_INTEL8X0 is not set
# CONFIG_SND_INTEL8X0M is not set
# CONFIG_SND_KORG1212 is not set
# CONFIG_SND_LOLA is not set
# CONFIG_SND_LX6464ES is not set
# CONFIG_SND_MAESTRO3 is not set
# CONFIG_SND_MIXART is not set
# CONFIG_SND_NM256 is not set
# CONFIG_SND_PCXHR is not set
# CONFIG_SND_RIPTIDE is not set
# CONFIG_SND_RME32 is not set
# CONFIG_SND_RME96 is not set
# CONFIG_SND_RME9652 is not set
# CONFIG_SND_SONICVIBES is not set
# CONFIG_SND_TRIDENT is not set
# CONFIG_SND_VIA82XX is not set
# CONFIG_SND_VIA82XX_MODEM is not set
# CONFIG_SND_VIRTUOSO is not set
# CONFIG_SND_VX222 is not set
# CONFIG_SND_YMFPCI is not set
# CONFIG_SND_USB is not set
# CONFIG_SND_SOC is not set
# CONFIG_SOUND_PRIME is not set
CONFIG_AC97_BUS=y

#
# HID support
#
# CONFIG_HID is not set

#
# USB HID support
#
# CONFIG_USB_HID is not set
# CONFIG_HID_PID is not set

#
# I2C HID support
#
# CONFIG_I2C_HID is not set
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
# CONFIG_USB_DEBUG is not set
# CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set

#
# Miscellaneous USB options
#
CONFIG_USB_DEFAULT_PERSIST=y
# CONFIG_USB_DYNAMIC_MINORS is not set
# CONFIG_USB_MON is not set
# CONFIG_USB_WUSB_CBAF is not set

#
# USB Host Controller Drivers
#
# CONFIG_USB_C67X00_HCD is not set
# CONFIG_USB_XHCI_HCD is not set
CONFIG_USB_EHCI_HCD=y
# CONFIG_USB_EHCI_ROOT_HUB_TT is not set
# CONFIG_USB_EHCI_TT_NEWSCHED is not set
CONFIG_USB_EHCI_PCI=y
# CONFIG_USB_EHCI_HCD_PLATFORM is not set
# CONFIG_USB_OXU210HP_HCD is not set
# CONFIG_USB_ISP116X_HCD is not set
# CONFIG_USB_ISP1760_HCD is not set
# CONFIG_USB_ISP1362_HCD is not set
# CONFIG_USB_FUSBH200_HCD is not set
CONFIG_USB_OHCI_HCD=y
CONFIG_USB_OHCI_HCD_PCI=y
# CONFIG_USB_OHCI_HCD_PLATFORM is not set
# CONFIG_USB_OHCI_BIG_ENDIAN_DESC is not set
# CONFIG_USB_OHCI_BIG_ENDIAN_MMIO is not set
CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_UHCI_HCD=y
# CONFIG_USB_SL811_HCD is not set
# CONFIG_USB_R8A66597_HCD is not set

#
# USB Device Class drivers
#
# CONFIG_USB_ACM is not set
# CONFIG_USB_PRINTER is not set
# CONFIG_USB_WDM is not set
# CONFIG_USB_TMC is not set

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#
CONFIG_USB_STORAGE=y
# CONFIG_USB_STORAGE_DEBUG is not set
# CONFIG_USB_STORAGE_REALTEK is not set
# CONFIG_USB_STORAGE_DATAFAB is not set
# CONFIG_USB_STORAGE_FREECOM is not set
# CONFIG_USB_STORAGE_ISD200 is not set
# CONFIG_USB_STORAGE_USBAT is not set
# CONFIG_USB_STORAGE_SDDR09 is not set
# CONFIG_USB_STORAGE_SDDR55 is not set
# CONFIG_USB_STORAGE_JUMPSHOT is not set
# CONFIG_USB_STORAGE_ALAUDA is not set
# CONFIG_USB_STORAGE_ONETOUCH is not set
# CONFIG_USB_STORAGE_KARMA is not set
# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
# CONFIG_USB_STORAGE_ENE_UB6250 is not set

#
# USB Imaging devices
#
# CONFIG_USB_MDC800 is not set
# CONFIG_USB_MICROTEK is not set
# CONFIG_USB_DWC3 is not set
# CONFIG_USB_CHIPIDEA is not set

#
# USB port drivers
#
# CONFIG_USB_SERIAL is not set

#
# USB Miscellaneous drivers
#
# CONFIG_USB_EMI62 is not set
# CONFIG_USB_EMI26 is not set
# CONFIG_USB_ADUTUX is not set
# CONFIG_USB_SEVSEG is not set
# CONFIG_USB_RIO500 is not set
# CONFIG_USB_LEGOTOWER is not set
# CONFIG_USB_LCD is not set
# CONFIG_USB_LED is not set
# CONFIG_USB_CYPRESS_CY7C63 is not set
# CONFIG_USB_CYTHERM is not set
# CONFIG_USB_IDMOUSE is not set
# CONFIG_USB_FTDI_ELAN is not set
# CONFIG_USB_APPLEDISPLAY is not set
# CONFIG_USB_SISUSBVGA is not set
# CONFIG_USB_LD is not set
# CONFIG_USB_TRANCEVIBRATOR is not set
# CONFIG_USB_IOWARRIOR is not set
# CONFIG_USB_TEST is not set
# CONFIG_USB_ISIGHTFW is not set
# CONFIG_USB_YUREX is not set
# CONFIG_USB_EZUSB_FX2 is not set
# CONFIG_USB_HSIC_USB3503 is not set
# CONFIG_USB_PHY is not set
# CONFIG_USB_GADGET is not set
# CONFIG_UWB is not set
# CONFIG_MMC is not set
# CONFIG_MEMSTICK is not set
# CONFIG_NEW_LEDS is not set
# CONFIG_ACCESSIBILITY is not set
# CONFIG_INFINIBAND is not set
CONFIG_RTC_LIB=y
CONFIG_RTC_CLASS=y
CONFIG_RTC_HCTOSYS=y
CONFIG_RTC_SYSTOHC=y
CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
# CONFIG_RTC_DEBUG is not set

#
# RTC interfaces
#
CONFIG_RTC_INTF_SYSFS=y
CONFIG_RTC_INTF_PROC=y
CONFIG_RTC_INTF_DEV=y
# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
# CONFIG_RTC_DRV_TEST is not set

#
# I2C RTC drivers
#
# CONFIG_RTC_DRV_DS1307 is not set
# CONFIG_RTC_DRV_DS1374 is not set
# CONFIG_RTC_DRV_DS1672 is not set
# CONFIG_RTC_DRV_DS3232 is not set
# CONFIG_RTC_DRV_MAX6900 is not set
# CONFIG_RTC_DRV_RS5C372 is not set
# CONFIG_RTC_DRV_ISL1208 is not set
# CONFIG_RTC_DRV_ISL12022 is not set
# CONFIG_RTC_DRV_X1205 is not set
# CONFIG_RTC_DRV_PCF2127 is not set
# CONFIG_RTC_DRV_PCF8523 is not set
# CONFIG_RTC_DRV_PCF8563 is not set
# CONFIG_RTC_DRV_PCF8583 is not set
# CONFIG_RTC_DRV_M41T80 is not set
# CONFIG_RTC_DRV_BQ32K is not set
# CONFIG_RTC_DRV_S35390A is not set
# CONFIG_RTC_DRV_FM3130 is not set
# CONFIG_RTC_DRV_RX8581 is not set
# CONFIG_RTC_DRV_RX8025 is not set
# CONFIG_RTC_DRV_EM3027 is not set
# CONFIG_RTC_DRV_RV3029C2 is not set

#
# SPI RTC drivers
#

#
# Platform RTC drivers
#
# CONFIG_RTC_DRV_DS1286 is not set
# CONFIG_RTC_DRV_DS1511 is not set
# CONFIG_RTC_DRV_DS1553 is not set
# CONFIG_RTC_DRV_DS1742 is not set
# CONFIG_RTC_DRV_STK17TA8 is not set
# CONFIG_RTC_DRV_M48T86 is not set
# CONFIG_RTC_DRV_M48T35 is not set
# CONFIG_RTC_DRV_M48T59 is not set
# CONFIG_RTC_DRV_MSM6242 is not set
# CONFIG_RTC_DRV_BQ4802 is not set
# CONFIG_RTC_DRV_RP5C01 is not set
# CONFIG_RTC_DRV_V3020 is not set
# CONFIG_RTC_DRV_DS2404 is not set

#
# on-CPU RTC drivers
#
CONFIG_RTC_DRV_GENERIC=y

#
# HID Sensor RTC drivers
#
# CONFIG_DMADEVICES is not set
# CONFIG_AUXDISPLAY is not set
# CONFIG_UIO is not set
# CONFIG_VIRT_DRIVERS is not set

#
# Virtio drivers
#
# CONFIG_VIRTIO_PCI is not set
# CONFIG_VIRTIO_MMIO is not set

#
# Microsoft Hyper-V guest support
#
# CONFIG_STAGING is not set

#
# Hardware Spinlock drivers
#
# CONFIG_MAILBOX is not set
# CONFIG_IOMMU_SUPPORT is not set

#
# Remoteproc drivers
#
# CONFIG_STE_MODEM_RPROC is not set

#
# Rpmsg drivers
#
# CONFIG_PM_DEVFREQ is not set
# CONFIG_EXTCON is not set
# CONFIG_MEMORY is not set
# CONFIG_IIO is not set
# CONFIG_VME_BUS is not set
# CONFIG_PWM is not set
# CONFIG_IPACK_BUS is not set
# CONFIG_RESET_CONTROLLER is not set
# CONFIG_FMC is not set

#
# File systems
#
CONFIG_EXT2_FS=y
# CONFIG_EXT2_FS_XATTR is not set
# CONFIG_EXT2_FS_XIP is not set
CONFIG_EXT3_FS=y
# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
# CONFIG_EXT3_FS_XATTR is not set
CONFIG_EXT4_FS=y
# CONFIG_EXT4_FS_POSIX_ACL is not set
# CONFIG_EXT4_FS_SECURITY is not set
# CONFIG_EXT4_DEBUG is not set
CONFIG_JBD=y
# CONFIG_JBD_DEBUG is not set
CONFIG_JBD2=y
# CONFIG_JBD2_DEBUG is not set
CONFIG_FS_MBCACHE=y
CONFIG_REISERFS_FS=y
# CONFIG_REISERFS_CHECK is not set
# CONFIG_REISERFS_PROC_INFO is not set
# CONFIG_REISERFS_FS_XATTR is not set
# CONFIG_JFS_FS is not set
# CONFIG_XFS_FS is not set
# CONFIG_GFS2_FS is not set
# CONFIG_OCFS2_FS is not set
# CONFIG_BTRFS_FS is not set
# CONFIG_NILFS2_FS is not set
# CONFIG_FS_POSIX_ACL is not set
CONFIG_FILE_LOCKING=y
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
# CONFIG_QUOTA is not set
# CONFIG_QUOTACTL is not set
# CONFIG_AUTOFS4_FS is not set
# CONFIG_FUSE_FS is not set

#
# Caches
#
# CONFIG_FSCACHE is not set

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=m
CONFIG_JOLIET=y
CONFIG_ZISOFS=y
# CONFIG_UDF_FS is not set

#
# DOS/FAT/NT Filesystems
#
CONFIG_FAT_FS=m
CONFIG_MSDOS_FS=m
CONFIG_VFAT_FS=m
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
# CONFIG_NTFS_FS is not set

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
CONFIG_PROC_SYSCTL=y
CONFIG_PROC_PAGE_MONITOR=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
# CONFIG_TMPFS_POSIX_ACL is not set
# CONFIG_TMPFS_XATTR is not set
# CONFIG_HUGETLB_PAGE is not set
CONFIG_CONFIGFS_FS=y
# CONFIG_MISC_FILESYSTEMS is not set
# CONFIG_NETWORK_FILESYSTEMS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
CONFIG_NLS_CODEPAGE_437=m
# CONFIG_NLS_CODEPAGE_737 is not set
# CONFIG_NLS_CODEPAGE_775 is not set
CONFIG_NLS_CODEPAGE_850=m
# CONFIG_NLS_CODEPAGE_852 is not set
# CONFIG_NLS_CODEPAGE_855 is not set
# CONFIG_NLS_CODEPAGE_857 is not set
# CONFIG_NLS_CODEPAGE_860 is not set
# CONFIG_NLS_CODEPAGE_861 is not set
# CONFIG_NLS_CODEPAGE_862 is not set
# CONFIG_NLS_CODEPAGE_863 is not set
# CONFIG_NLS_CODEPAGE_864 is not set
# CONFIG_NLS_CODEPAGE_865 is not set
# CONFIG_NLS_CODEPAGE_866 is not set
# CONFIG_NLS_CODEPAGE_869 is not set
# CONFIG_NLS_CODEPAGE_936 is not set
# CONFIG_NLS_CODEPAGE_950 is not set
# CONFIG_NLS_CODEPAGE_932 is not set
# CONFIG_NLS_CODEPAGE_949 is not set
# CONFIG_NLS_CODEPAGE_874 is not set
# CONFIG_NLS_ISO8859_8 is not set
# CONFIG_NLS_CODEPAGE_1250 is not set
# CONFIG_NLS_CODEPAGE_1251 is not set
CONFIG_NLS_ASCII=m
CONFIG_NLS_ISO8859_1=m
# CONFIG_NLS_ISO8859_2 is not set
# CONFIG_NLS_ISO8859_3 is not set
# CONFIG_NLS_ISO8859_4 is not set
# CONFIG_NLS_ISO8859_5 is not set
# CONFIG_NLS_ISO8859_6 is not set
# CONFIG_NLS_ISO8859_7 is not set
# CONFIG_NLS_ISO8859_9 is not set
# CONFIG_NLS_ISO8859_13 is not set
# CONFIG_NLS_ISO8859_14 is not set
CONFIG_NLS_ISO8859_15=m
# CONFIG_NLS_KOI8_R is not set
# CONFIG_NLS_KOI8_U is not set
# CONFIG_NLS_MAC_ROMAN is not set
# CONFIG_NLS_MAC_CELTIC is not set
# CONFIG_NLS_MAC_CENTEURO is not set
# CONFIG_NLS_MAC_CROATIAN is not set
# CONFIG_NLS_MAC_CYRILLIC is not set
# CONFIG_NLS_MAC_GAELIC is not set
# CONFIG_NLS_MAC_GREEK is not set
# CONFIG_NLS_MAC_ICELAND is not set
# CONFIG_NLS_MAC_INUIT is not set
# CONFIG_NLS_MAC_ROMANIAN is not set
# CONFIG_NLS_MAC_TURKISH is not set
CONFIG_NLS_UTF8=m
# CONFIG_DLM is not set

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
CONFIG_DEFAULT_MESSAGE_LOGLEVEL=4
# CONFIG_BOOT_PRINTK_DELAY is not set
# CONFIG_DYNAMIC_DEBUG is not set

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
CONFIG_DEBUG_INFO_REDUCED=y
CONFIG_ENABLE_WARN_DEPRECATED=y
CONFIG_ENABLE_MUST_CHECK=y
CONFIG_FRAME_WARN=4096
CONFIG_STRIP_ASM_SYMS=y
# CONFIG_READABLE_ASM is not set
# CONFIG_UNUSED_SYMBOLS is not set
CONFIG_DEBUG_FS=y
# CONFIG_HEADERS_CHECK is not set
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_ARCH_WANT_FRAME_POINTERS=y
# CONFIG_FRAME_POINTER is not set
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
CONFIG_MAGIC_SYSRQ=y
CONFIG_DEBUG_KERNEL=y

#
# Memory Debugging
#
# CONFIG_DEBUG_PAGEALLOC is not set
# CONFIG_DEBUG_OBJECTS is not set
# CONFIG_DEBUG_SLAB is not set
# CONFIG_DEBUG_VM is not set
CONFIG_DEBUG_MEMORY_INIT=y
# CONFIG_DEBUG_PER_CPU_MAPS is not set
CONFIG_HAVE_DEBUG_STACKOVERFLOW=y
# CONFIG_DEBUG_STACKOVERFLOW is not set
# CONFIG_DEBUG_SHIRQ is not set

#
# Debug Lockups and Hangs
#
# CONFIG_LOCKUP_DETECTOR is not set
# CONFIG_DETECT_HUNG_TASK is not set
# CONFIG_PANIC_ON_OOPS is not set
CONFIG_PANIC_ON_OOPS_VALUE=0
# CONFIG_SCHED_DEBUG is not set
# CONFIG_SCHEDSTATS is not set
# CONFIG_TIMER_STATS is not set

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
# CONFIG_DEBUG_RT_MUTEXES is not set
# CONFIG_RT_MUTEX_TESTER is not set
# CONFIG_DEBUG_SPINLOCK is not set
# CONFIG_DEBUG_MUTEXES is not set
# CONFIG_DEBUG_ATOMIC_SLEEP is not set
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
# CONFIG_DEBUG_KOBJECT is not set
CONFIG_DEBUG_BUGVERBOSE=y
# CONFIG_DEBUG_WRITECOUNT is not set
# CONFIG_DEBUG_LIST is not set
# CONFIG_DEBUG_SG is not set
# CONFIG_DEBUG_NOTIFIERS is not set
# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
# CONFIG_SPARSE_RCU_POINTER is not set
# CONFIG_RCU_TORTURE_TEST is not set
CONFIG_RCU_CPU_STALL_TIMEOUT=60
# CONFIG_RCU_CPU_STALL_INFO is not set
# CONFIG_RCU_TRACE is not set
# CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
# CONFIG_FAULT_INJECTION is not set
# CONFIG_LATENCYTOP is not set
CONFIG_ARCH_HAS_DEBUG_STRICT_USER_COPY_CHECKS=y
CONFIG_DEBUG_STRICT_USER_COPY_CHECKS=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_FUNCTION_TRACE_MCOUNT_TEST=y

#
# Runtime Testing
#
# CONFIG_LKDTM is not set
# CONFIG_TEST_LIST_SORT is not set
# CONFIG_BACKTRACE_SELF_TEST is not set
# CONFIG_RBTREE_TEST is not set
# CONFIG_INTERVAL_TREE_TEST is not set
# CONFIG_ATOMIC64_SELFTEST is not set
# CONFIG_TEST_STRING_HELPERS is not set
# CONFIG_TEST_KSTRTOX is not set
# CONFIG_SAMPLES is not set
# CONFIG_DEBUG_RODATA is not set

#
# Security options
#
# CONFIG_KEYS is not set
# CONFIG_SECURITY_DMESG_RESTRICT is not set
# CONFIG_SECURITY is not set
# CONFIG_SECURITYFS is not set
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_DEFAULT_SECURITY=""
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_BLKCIPHER=y
CONFIG_CRYPTO_BLKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_PCOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
# CONFIG_CRYPTO_USER is not set
# CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
# CONFIG_CRYPTO_GF128MUL is not set
# CONFIG_CRYPTO_NULL is not set
# CONFIG_CRYPTO_PCRYPT is not set
CONFIG_CRYPTO_WORKQUEUE=y
# CONFIG_CRYPTO_CRYPTD is not set
# CONFIG_CRYPTO_AUTHENC is not set
# CONFIG_CRYPTO_TEST is not set

#
# Authenticated Encryption with Associated Data
#
# CONFIG_CRYPTO_CCM is not set
# CONFIG_CRYPTO_GCM is not set
# CONFIG_CRYPTO_SEQIV is not set

#
# Block modes
#
CONFIG_CRYPTO_CBC=y
# CONFIG_CRYPTO_CTR is not set
# CONFIG_CRYPTO_CTS is not set
# CONFIG_CRYPTO_ECB is not set
# CONFIG_CRYPTO_LRW is not set
# CONFIG_CRYPTO_PCBC is not set
# CONFIG_CRYPTO_XTS is not set

#
# Hash modes
#
# CONFIG_CRYPTO_CMAC is not set
# CONFIG_CRYPTO_HMAC is not set
# CONFIG_CRYPTO_XCBC is not set
# CONFIG_CRYPTO_VMAC is not set

#
# Digest
#
CONFIG_CRYPTO_CRC32C=y
# CONFIG_CRYPTO_CRC32 is not set
# CONFIG_CRYPTO_GHASH is not set
# CONFIG_CRYPTO_MD4 is not set
# CONFIG_CRYPTO_MD5 is not set
# CONFIG_CRYPTO_MICHAEL_MIC is not set
# CONFIG_CRYPTO_RMD128 is not set
# CONFIG_CRYPTO_RMD160 is not set
# CONFIG_CRYPTO_RMD256 is not set
# CONFIG_CRYPTO_RMD320 is not set
# CONFIG_CRYPTO_SHA1 is not set
# CONFIG_CRYPTO_SHA256 is not set
# CONFIG_CRYPTO_SHA512 is not set
# CONFIG_CRYPTO_TGR192 is not set
# CONFIG_CRYPTO_WP512 is not set

#
# Ciphers
#
CONFIG_CRYPTO_AES=y
# CONFIG_CRYPTO_ANUBIS is not set
# CONFIG_CRYPTO_ARC4 is not set
# CONFIG_CRYPTO_BLOWFISH is not set
# CONFIG_CRYPTO_CAMELLIA is not set
# CONFIG_CRYPTO_CAST5 is not set
# CONFIG_CRYPTO_CAST6 is not set
# CONFIG_CRYPTO_DES is not set
# CONFIG_CRYPTO_FCRYPT is not set
# CONFIG_CRYPTO_KHAZAD is not set
# CONFIG_CRYPTO_SALSA20 is not set
# CONFIG_CRYPTO_SEED is not set
# CONFIG_CRYPTO_SERPENT is not set
# CONFIG_CRYPTO_TEA is not set
# CONFIG_CRYPTO_TWOFISH is not set

#
# Compression
#
# CONFIG_CRYPTO_DEFLATE is not set
# CONFIG_CRYPTO_ZLIB is not set
# CONFIG_CRYPTO_LZO is not set
# CONFIG_CRYPTO_LZ4 is not set
# CONFIG_CRYPTO_LZ4HC is not set

#
# Random Number Generation
#
# CONFIG_CRYPTO_ANSI_CPRNG is not set
# CONFIG_CRYPTO_USER_API_HASH is not set
# CONFIG_CRYPTO_USER_API_SKCIPHER is not set
# CONFIG_CRYPTO_HW is not set
# CONFIG_BINARY_PRINTF is not set

#
# Library routines
#
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IO=y
# CONFIG_CRC_CCITT is not set
CONFIG_CRC16=y
# CONFIG_CRC_T10DIF is not set
# CONFIG_CRC_ITU_T is not set
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
CONFIG_CRC32_SLICEBY8=y
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
# CONFIG_CRC7 is not set
# CONFIG_LIBCRC32C is not set
# CONFIG_CRC8 is not set
CONFIG_ZLIB_INFLATE=m
# CONFIG_XZ_DEC is not set
# CONFIG_XZ_DEC_BCJ is not set
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT=y
CONFIG_HAS_DMA=y
CONFIG_CPU_RMAP=y
CONFIG_DQL=y
CONFIG_NLATTR=y
CONFIG_ARCH_HAS_ATOMIC64_DEC_IF_POSITIVE=y
# CONFIG_AVERAGE is not set
# CONFIG_CORDIC is not set
# CONFIG_DDR is not set

Regards,
Domenico

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep15-int.chello.at (viefep15-int.chello.at [213.46.255.19])
	by dsl2.external.hp.com (Postfix) with ESMTP id CE3A4482E
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Jun 2002 16:12:10 -0600 (MDT)
Received: from gmx.at ([62.178.92.247]) by viefep15-int.chello.at
          (InterMail vM.5.01.03.06 201-253-122-118-106-20010523) with ESMTP
          id <20020626221201.OOBX1259.viefep15-int.chello.at@gmx.at>
          for <parisc-linux@lists.parisc-linux.org>;
          Thu, 27 Jun 2002 00:12:01 +0200
Message-ID: <3D1A3C30.B4F5E67A@gmx.at>
Date: Thu, 27 Jun 2002 00:12:00 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Content-Type: multipart/mixed;
 boundary="------------3AC8D7198F72B65AB646159B"
Subject: [parisc-linux] Problem find devices on the E55 I/O interfaces! -- here the log !
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

This is a multi-part message in MIME format.
--------------3AC8D7198F72B65AB646159B
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Sorry I forgot the boot log !

(kernel CVS version of the last day)

------------------------------------------------------------------------------
   PDC - Processor Dependent Code - Version   2.0
   (c) Copyright 1990-1993, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------
   64 MB of memory configured and tested.
   Primary boot path:    56/52.6   (dec)
   Alternate boot path:  56/52.0   (dec)

------- Main Menu
-------------------------------------------------------------

        Command                       Description
        -------                       -----------

        BOot [PRI|ALT|<path>]         Boot from specified path
        PAth [PRI|ALT] [<path>]       Display or modify a path
        SEArch [DIsplay|IPL] [<path>] Search for boot devices

        COnfiguration menu            Displays or sets boot values
        INformation menu              Displays hardware information
        SERvice menu                  Displays service commands

        DIsplay                       Redisplay the current menu
        HElp [<menu>|<command>]       Display help for menu or command
        RESET                         Restart the system
-------
Main Menu: Enter command or menu > bo 60/6.0
Interact with IPL (Y or N)?> n

Booting... 
Network Station Address 080009-96d4f6

Boot IO Dependent Code (IODC) revision 8


HARD Booted.
palo ipl 0.99 root@unicum.pladom.at Sat Apr  6 19:47:13 CEST 2002

Boot image contains:
    0/vmlinux32 3071708 bytes @ 0x8000

Command line for kernel: 'HOME=/ TERM=linux root=/dev/nfs console=ttyB0
ip=bootp palo_kernel=0/vmlinux'
Selected kernel: /vmlinux from partition 0
Warning: kernel name doesn't end with 32 or 64 -- Guessing... Choosing
32-bit kernelELF32 executable
Entry 00100000 first 00100000 n 5
Segment 0 load 00100000 size 1638036 mediaptr 0x1000
Segment 1 load 00290000 size 257752 mediaptr 0x191000
Segment 2 load 002d0000 size 385024 mediaptr 0x1d0000
Segment 3 load 00330000 size 32768 mediaptr 0x22e000
Segment 4 load 00357714 size 87056 mediaptr 0x236714
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

Linux version 2.4.18-pa41 (root@unicum.pladom.at) (gcc version 3.0
20010315 (prerelease)) #38 Wed Jun 26 23:32:02 CEST 2002
FP[0] enabled: Rev 1 Model 13
The 32-bit Kernel has started...
Determining PDC firmware type: System Map.
model 00004831 00000481 00000000 00000000 44c7f21c 100000f0 00000004
00000072 00000072
vers  0000000b
model 9000/856
Total Memory: 64 Mb
pagetable_init
On node 0 totalpages: 16384
zone(0): 16384 pages.
zone(1): 0 pages.
zone(2): 0 pages.
Kernel command line: HOME=/ TERM=linux root=/dev/nfs console=ttyB0
ip=bootp palo_kernel=0/vmlinux
Console: colour dummy device 160x64
Calibrating delay loop... 95.84 BogoMIPS
Memory: 61936k available
Dentry-cache hash table entries: 8192 (order: 4, 65536 bytes)
Inode-cache hash table entries: 4096 (order: 3, 32768 bytes)
Mount-cache hash table entries: 1024 (order: 1, 8192 bytes)
Buffer-cache hash table entries: 1024 (order: 0, 4096 bytes)
Page-cache hash table entries: 16384 (order: 4, 65536 bytes)
Searching for devices...
do_device_inventory: SYSTEM MAP TYPE
----     system_map_inventory: calling pdc_system_map_find_mods()
----     system_map_inventory: -- returned: mod=60, addr=0xf0100000
------ alloc_pa_dev: entry
-------------------------- find_parisc_device: entry, mod=60
-------------------------- find_parisc_device:   bc[0]=-1
-------------------------- find_parisc_device:   bc[1]=-1
-------------------------- find_parisc_device:   bc[2]=-1
-------------------------- find_parisc_device:   bc[3]=-1
-------------------------- find_parisc_device:   bc[4]=-1
-------------------------- find_parisc_device:   bc[5]=-1
----     system_map_inventory: additional address is 0x00000001
----     system_map_inventory: calling pdc_system_map_find_mods()
----     system_map_inventory: -- returned: mod=6, addr=0xf0107000
------ alloc_pa_dev: entry
-------------------------- find_parisc_device: entry, mod=6
-------------------------- find_parisc_device:   bc[0]=-1
-------------------------- find_parisc_device:   bc[1]=-1
-------------------------- find_parisc_device:   bc[2]=-1
-------------------------- find_parisc_device:   bc[3]=-1
-------------------------- find_parisc_device:   bc[4]=-1
-------------------------- find_parisc_device:   bc[5]=60
----     system_map_inventory: additional address not defined
----     system_map_inventory: calling pdc_system_map_find_mods()
----     system_map_inventory: -- returned ERROR
-- walk_central_bus: entry
---- walk_native_bus: entry
---- walk_native_bus:    testing hpa=0xfff80000, i=0
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff81000, i=1
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff82000, i=2
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff83000, i=3
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff84000, i=4
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff85000, i=5
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff86000, i=6
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff87000, i=7
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff88000, i=8
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff89000, i=9
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff8a000, i=10
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff8b000, i=11
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff8c000, i=12
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff8d000, i=13
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff8e000, i=14
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff8f000, i=15
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff90000, i=16
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff91000, i=17
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff92000, i=18
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff93000, i=19
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff94000, i=20
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff95000, i=21
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff96000, i=22
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff97000, i=23
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff98000, i=24
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff99000, i=25
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff9a000, i=26
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff9b000, i=27
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff9c000, i=28
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff9d000, i=29
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff9e000, i=30
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff9f000, i=31
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfffa0000, i=32
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfffa1000, i=33
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfffa2000, i=34
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfffa3000, i=35
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfffa4000, i=36
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfffa5000, i=37
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfffa6000, i=38
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfffa7000, i=39
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfffa8000, i=40
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfffa9000, i=41
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfffaa000, i=42
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfffab000, i=43
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfffac000, i=44
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfffad000, i=45
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfffae000, i=46
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfffaf000, i=47
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfffb0000, i=48
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfffb1000, i=49
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfffb2000, i=50
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfffb3000, i=51
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfffb4000, i=52
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfffb5000, i=53
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfffb6000, i=54
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfffb7000, i=55
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfffb8000, i=56
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
-------------------------- find_parisc_device: entry, mod=56
-------------------------- find_parisc_device:   bc[0]=-1
-------------------------- find_parisc_device:   bc[1]=-1
-------------------------- find_parisc_device:   bc[2]=-1
-------------------------- find_parisc_device:   bc[3]=-1
-------------------------- find_parisc_device:   bc[4]=-1
-------------------------- find_parisc_device:   bc[5]=-1
-- walk_lower_bus: entry
-- walk_lower_bus: dev: hpa=0xfffb8000, io_io_low=0xfff00000,
io_io_high=0xfff80000
-- walk_lower_bus:   call again walk_native_bus()
---- walk_native_bus: entry
---- walk_native_bus:    testing hpa=0xfff00000, i=0
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff01000, i=1
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff02000, i=2
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff03000, i=3
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff04000, i=4
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff05000, i=5
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff06000, i=6
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff07000, i=7
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff08000, i=8
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff09000, i=9
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff0a000, i=10
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff0b000, i=11
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff0c000, i=12
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff0d000, i=13
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff0e000, i=14
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff0f000, i=15
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff10000, i=16
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff11000, i=17
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff12000, i=18
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff13000, i=19
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff14000, i=20
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff15000, i=21
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff16000, i=22
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff17000, i=23
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff18000, i=24
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff19000, i=25
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff1a000, i=26
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff1b000, i=27
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff1c000, i=28
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff1d000, i=29
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff1e000, i=30
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff1f000, i=31
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff20000, i=32
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff21000, i=33
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff22000, i=34
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff23000, i=35
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff24000, i=36
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff25000, i=37
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff26000, i=38
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff27000, i=39
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff28000, i=40
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff29000, i=41
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff2a000, i=42
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff2b000, i=43
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff2c000, i=44
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff2d000, i=45
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff2e000, i=46
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff2f000, i=47
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff30000, i=48
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff31000, i=49
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff32000, i=50
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff33000, i=51
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff34000, i=52
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff35000, i=53
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff36000, i=54
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff37000, i=55
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff38000, i=56
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff39000, i=57
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff3a000, i=58
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff3b000, i=59
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff3c000, i=60
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff3d000, i=61
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff3e000, i=62
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfff3f000, i=63
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfffb9000, i=57
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfffba000, i=58
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfffbb000, i=59
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfffbc000, i=60
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfffbd000, i=61
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
------ alloc_pa_dev:  -- pdc_iodc_read() error -4!
---- walk_native_bus:    ** error in alloc_pa_dev()
---- walk_native_bus:    testing hpa=0xfffbe000, i=62
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
-------------------------- find_parisc_device: entry, mod=62
-------------------------- find_parisc_device:   bc[0]=-1
-------------------------- find_parisc_device:   bc[1]=-1
-------------------------- find_parisc_device:   bc[2]=-1
-------------------------- find_parisc_device:   bc[3]=-1
-------------------------- find_parisc_device:   bc[4]=-1
-------------------------- find_parisc_device:   bc[5]=-1
-- walk_lower_bus: entry
-- walk_lower_bus:   return without processing
---- walk_native_bus:    testing hpa=0xfffbf000, i=63
---- walk_native_bus:    -- device not processed, mod = i !
------ alloc_pa_dev: entry
-------------------------- find_parisc_device: entry, mod=63
-------------------------- find_parisc_device:   bc[0]=-1
-------------------------- find_parisc_device:   bc[1]=-1
-------------------------- find_parisc_device:   bc[2]=-1
-------------------------- find_parisc_device:   bc[3]=-1
-------------------------- find_parisc_device:   bc[4]=-1
-------------------------- find_parisc_device:   bc[5]=-1
-- walk_lower_bus: entry
-- walk_lower_bus:   return without processing
Found devices:
1. Java BC GSC+ Port (7) at 0xfffb8000 [56], versions 0x503, 0x0, 0xc
2. WB-96 Core BA (11) at 0xf0100000 [60], versions 0x11, 0x1, 0x81, 
additional addresses: 0xf010c000 
3. WB-96 Core LAN (802.3) (10) at 0xf0107000 [60/6], versions 0x11, 0x1,
0x8a
4. WB-96 (E45) (0) at 0xfffbe000 [62], versions 0x483, 0x1, 0x4
5. Memory (1) at 0xfffbf000 [63], versions 0x25, 0x0, 0x9
------------------- register_parisc_driver: entry
------------------- register_parisc_driver: name="CPU"
------------------- register_parisc_driver: running dev loop:
------------------- register_parisc_driver:     checking dev "Java BC
GSC+ Port" (56)
------------------- register_parisc_driver:     checking dev "WB-96 Core
BA" (60)
------------------- register_parisc_driver:     checking dev "WB-96 Core
LAN (802.3)" (6)
------------------- register_parisc_driver:     checking dev "WB-96
(E45)" (62)
------------------- register_parisc_driver:     running probe of device
"WB-96 (E45)"
------------------- claim_device: driver="CPU", device="WB-96 (E45)"
------------------- claim_device: dev info: hw_path=62, irq=0,
hpa=0xfffbe000, num_addrs=0
------------------- register_parisc_driver:     checking dev "Memory"
(63)
CPU(s): 1 x PA7100LC (PCX-L) at 96.000000 MHz
------------------- register_parisc_driver: entry
------------------- register_parisc_driver: name="SBA"
------------------- register_parisc_driver: running dev loop:
------------------- register_parisc_driver:     checking dev "Java BC
GSC+ Port" (56)
------------------- register_parisc_driver:     checking dev "WB-96 Core
BA" (60)
------------------- register_parisc_driver:     checking dev "WB-96 Core
LAN (802.3)" (6)
------------------- register_parisc_driver:     checking dev "WB-96
(E45)" (62)
------------------- register_parisc_driver:     checking dev "Memory"
(63)
------------------- register_parisc_driver: entry
------------------- register_parisc_driver: name="lba"
------------------- register_parisc_driver: running dev loop:
------------------- register_parisc_driver:     checking dev "Java BC
GSC+ Port" (56)
------------------- register_parisc_driver:     checking dev "WB-96 Core
BA" (60)
------------------- register_parisc_driver:     checking dev "WB-96 Core
LAN (802.3)" (6)
------------------- register_parisc_driver:     checking dev "WB-96
(E45)" (62)
------------------- register_parisc_driver:     checking dev "Memory"
(63)
------------------- register_parisc_driver: entry
------------------- register_parisc_driver: name="U2/Uturn"
------------------- register_parisc_driver: running dev loop:
------------------- register_parisc_driver:     checking dev "Java BC
GSC+ Port" (56)
------------------- register_parisc_driver:     checking dev "WB-96 Core
BA" (60)
------------------- register_parisc_driver:     checking dev "WB-96 Core
LAN (802.3)" (6)
------------------- register_parisc_driver:     checking dev "WB-96
(E45)" (62)
------------------- register_parisc_driver:     checking dev "Memory"
(63)
------------------- register_parisc_driver: entry
------------------- register_parisc_driver: name="Lasi"
------------------- register_parisc_driver: running dev loop:
------------------- register_parisc_driver:     checking dev "Java BC
GSC+ Port" (56)
------------------- register_parisc_driver:     checking dev "WB-96 Core
BA" (60)
------------------- register_parisc_driver:     running probe of device
"WB-96 Core BA"
Lasi version 0 at 0xf0100000 found.
LED display at f010c000 registered
------------------- claim_device: driver="Lasi", device="WB-96 Core BA"
------------------- claim_device: dev info: hw_path=60, irq=0,
hpa=0xf0100000, num_addrs=1
------------------- register_parisc_driver:     checking dev "WB-96 Core
LAN (802.3)" (6)
------------------- register_parisc_driver:     checking dev "WB-96
(E45)" (62)
------------------- register_parisc_driver:     checking dev "Memory"
(63)
------------------- register_parisc_driver: entry
------------------- register_parisc_driver: name="Asp"
------------------- register_parisc_driver: running dev loop:
------------------- register_parisc_driver:     checking dev "Java BC
GSC+ Port" (56)
------------------- register_parisc_driver:     checking dev "WB-96 Core
BA" (60)
------------------- register_parisc_driver:     checking dev "WB-96 Core
LAN (802.3)" (6)
------------------- register_parisc_driver:     checking dev "WB-96
(E45)" (62)
------------------- register_parisc_driver:     checking dev "Memory"
(63)
------------------- register_parisc_driver: entry
------------------- register_parisc_driver: name="Wax"
------------------- register_parisc_driver: running dev loop:
------------------- register_parisc_driver:     checking dev "Java BC
GSC+ Port" (56)
------------------- register_parisc_driver:     checking dev "WB-96 Core
BA" (60)
------------------- register_parisc_driver:     checking dev "WB-96 Core
LAN (802.3)" (6)
------------------- register_parisc_driver:     checking dev "WB-96
(E45)" (62)
------------------- register_parisc_driver:     checking dev "Memory"
(63)
------------------- register_parisc_driver: entry
------------------- register_parisc_driver: name="EISA Bus Adapter"
------------------- register_parisc_driver: running dev loop:
------------------- register_parisc_driver:     checking dev "Java BC
GSC+ Port" (56)
------------------- register_parisc_driver:     checking dev "WB-96 Core
BA" (60)
------------------- register_parisc_driver:     checking dev "WB-96 Core
LAN (802.3)" (6)
------------------- register_parisc_driver:     checking dev "WB-96
(E45)" (62)
------------------- register_parisc_driver:     checking dev "Memory"
(63)
------------------- register_parisc_driver: entry
------------------- register_parisc_driver: name="Dino"
------------------- register_parisc_driver: running dev loop:
------------------- register_parisc_driver:     checking dev "Java BC
GSC+ Port" (56)
------------------- register_parisc_driver:     checking dev "WB-96 Core
BA" (60)
------------------- register_parisc_driver:     checking dev "WB-96 Core
LAN (802.3)" (6)
------------------- register_parisc_driver:     checking dev "WB-96
(E45)" (62)
------------------- register_parisc_driver:     checking dev "Memory"
(63)
POSIX conformance testing by UNIFIX
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Soft power switch support not available.
Starting kswapd
------------------- register_parisc_driver: entry
------------------- register_parisc_driver: name="Parallel"
------------------- register_parisc_driver: running dev loop:
------------------- register_parisc_driver:     checking dev "Java BC
GSC+ Port" (56)
------------------- register_parisc_driver:     checking dev "WB-96 Core
BA" (60)
------------------- register_parisc_driver:     checking dev "WB-96 Core
LAN (802.3)" (6)
------------------- register_parisc_driver:     checking dev "WB-96
(E45)" (62)
------------------- register_parisc_driver:     checking dev "Memory"
(63)
STI GSC/PCI graphics driver version 0.9
------------------- register_parisc_driver: entry
------------------- register_parisc_driver: name="sti (native)"
------------------- register_parisc_driver: running dev loop:
------------------- register_parisc_driver:     checking dev "Java BC
GSC+ Port" (56)
------------------- register_parisc_driver:     checking dev "WB-96 Core
BA" (60)
------------------- register_parisc_driver:     checking dev "WB-96 Core
LAN (802.3)" (6)
------------------- register_parisc_driver:     checking dev "WB-96
(E45)" (62)
------------------- register_parisc_driver:     checking dev "Memory"
(63)
pty: 256 Unix98 ptys configured
PDC Software Console version 0.3 (2001-11-17), christoph.plattner@gmx.at
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ
SERIAL_PCI enabled
------------------- register_parisc_driver: entry
------------------- register_parisc_driver: name="Serial RS232"
------------------- register_parisc_driver: running dev loop:
------------------- register_parisc_driver:     checking dev "Java BC
GSC+ Port" (56)
------------------- register_parisc_driver:     checking dev "WB-96 Core
BA" (60)
------------------- register_parisc_driver:     checking dev "WB-96 Core
LAN (802.3)" (6)
------------------- register_parisc_driver:     checking dev "WB-96
(E45)" (62)
------------------- register_parisc_driver:     checking dev "Memory"
(63)
------------------- register_parisc_driver: entry
------------------- register_parisc_driver: name="Serial RS232"
------------------- register_parisc_driver: running dev loop:
------------------- register_parisc_driver:     checking dev "Java BC
GSC+ Port" (56)
------------------- register_parisc_driver:     checking dev "WB-96 Core
BA" (60)
------------------- register_parisc_driver:     checking dev "WB-96 Core
LAN (802.3)" (6)
------------------- register_parisc_driver:     checking dev "WB-96
(E45)" (62)
------------------- register_parisc_driver:     checking dev "Memory"
(63)
------------------- register_parisc_driver: entry
------------------- register_parisc_driver: name="Lasi psaux"
------------------- register_parisc_driver: running dev loop:
------------------- register_parisc_driver:     checking dev "Java BC
GSC+ Port" (56)
------------------- register_parisc_driver:     checking dev "WB-96 Core
BA" (60)
------------------- register_parisc_driver:     checking dev "WB-96 Core
LAN (802.3)" (6)
------------------- register_parisc_driver:     checking dev "WB-96
(E45)" (62)
------------------- register_parisc_driver:     checking dev "Memory"
(63)
lp: driver loaded but no devices found
Generic RTC Driver v1.02 05/27/1999 Sam Creasey (sammy@oh.verio.com)
block: 128 slots per queue, batch=32
RAMDISK driver initialized: 16 RAM disks of 4096K size 1024 blocksize
loop: loaded (max 8 devices)
------------------- register_parisc_driver: entry
------------------- register_parisc_driver: name="Apricot"
------------------- register_parisc_driver: running dev loop:
------------------- register_parisc_driver:     checking dev "Java BC
GSC+ Port" (56)
------------------- register_parisc_driver:     checking dev "WB-96 Core
BA" (60)
------------------- register_parisc_driver:     checking dev "WB-96 Core
LAN (802.3)" (6)
------------------- register_parisc_driver:     running probe of device
"WB-96 Core LAN (802.3)"
Found i82596 at 0xf0107000, IRQ 87
eth0: 82596 at 0xf0107000, 08 00 09 96 D4 F6 IRQ 87.
82596.c $Revision: 1.29 $
------------------- claim_device: driver="Apricot", device="WB-96 Core
LAN (802.3)"
------------------- claim_device: dev info: hw_path=6, irq=87,
hpa=0xf0107000, num_addrs=0
------------------- register_parisc_driver:     checking dev "WB-96
(E45)" (62)
------------------- register_parisc_driver:     checking dev "Memory"
(63)
SCSI subsystem driver Revision: 1.00
------------------- register_parisc_driver: entry
------------------- register_parisc_driver: name="GSC SCSI (Zalon)"
------------------- register_parisc_driver: running dev loop:
------------------- register_parisc_driver:     checking dev "Java BC
GSC+ Port" (56)
------------------- register_parisc_driver:     checking dev "WB-96 Core
BA" (60)
------------------- register_parisc_driver:     checking dev "WB-96 Core
LAN (802.3)" (6)
------------------- register_parisc_driver:     checking dev "WB-96
(E45)" (62)
------------------- register_parisc_driver:     checking dev "Memory"
(63)
------------------- register_parisc_driver: entry
------------------- register_parisc_driver: name="Lasi SCSI"
------------------- register_parisc_driver: running dev loop:
------------------- register_parisc_driver:     checking dev "Java BC
GSC+ Port" (56)
------------------- register_parisc_driver:     checking dev "WB-96 Core
BA" (60)
------------------- register_parisc_driver:     checking dev "WB-96 Core
LAN (802.3)" (6)
------------------- register_parisc_driver:     checking dev "WB-96
(E45)" (62)
------------------- register_parisc_driver:     checking dev "Memory"
(63)
------------------- register_parisc_driver: entry
------------------- register_parisc_driver: name="Lasi Harmony"
------------------- register_parisc_driver: running dev loop:
------------------- register_parisc_driver:     checking dev "Java BC
GSC+ Port" (56)
------------------- register_parisc_driver:     checking dev "WB-96 Core
BA" (60)
------------------- register_parisc_driver:     checking dev "WB-96 Core
LAN (802.3)" (6)
------------------- register_parisc_driver:     checking dev "WB-96
(E45)" (62)
------------------- register_parisc_driver:     checking dev "Memory"
(63)
STI GSC/PCI graphics driver version 0.9
------------------- register_parisc_driver: entry
------------------- register_parisc_driver: name="sti (native)"
BUG: Skipping previously registered driver: sti (native)
NET4: Linux TCP/IP 1.0 for NET4.0
IP Protocols: ICMP, UDP, TCP, IGMP
IP: routing cache hash table of 512 buckets, 4Kbytes
TCP: Hash tables configured (established 4096 bind 8192)
eth0: link ok.
Sending BOOTP requests . OK
IP-Config: Got BOOTP answer from 196.1.1.50, my address is 196.1.1.100
IP-Config: Complete:
      device=eth0, addr=196.1.1.100, mask=255.255.255.0, gw=196.1.1.50,
     host=196.1.1.100, domain=pladom.at, nis-domain=pladom.at,
     bootserver=196.1.1.50, rootserver=196.1.1.50,
rootpath=/export/rootfs/rudolph/debian
NET4: Unix domain sockets 1.0/SMP for Linux NET4.0.
Looking up port of RPC 100003/2 on 196.1.1.50
Looking up port of RPC 100005/1 on 196.1.1.50
VFS: Mounted root (nfs filesystem).
Freeing unused kernel memory: 365k freed
INIT: version 2.84 booting
Activating swap.
System time was Wed Jun 26 21:33:41 UTC 2002.
Setting the System Clock using the Hardware Clock as reference...
System Clock set. System local time is now Wed Jun 26 21:34:02 UTC 2002.
Checking all file systems...
fsck 1.27 (8-Mar-2002)
Setting kernel variables.
Mounting local filesystems...
nothing was mounted
Cleaning: /etc/network/ifstate.
Setting up IP spoofing protection: rp_filter.
Configuring network interfaces: SIOCADDRT: File exists
done.
Starting portmap daemon: portmap.
Starting portmapper... Mounting remote filesystems...

Setting the System Clock using the Hardware Clock as reference...
System Clock set. Local time: Wed Jun 26 23:34:14 CEST 2002

Cleaning: /tmp /var/lock /var/run.
Initializing random number generator... done.
Recovering nvi editor sessions... done.
INIT: Entering runlevel: 2
Starting system log daemon: syslogd.
Starting kernel log daemon: klogd.
Starting NIS services: ypbind 
Starting internet superserver: xinetd.
Starting NTP server: ntpd.
Starting deferred execution scheduler: atd.
Starting periodic command scheduler: cron.

Debian GNU/Linux 3.0 rudolph ttyB0

rudolph login: 


-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
--------------3AC8D7198F72B65AB646159B
Content-Type: message/rfc822
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Return-Path: <parisc-linux-admin@lists.parisc-linux.org>
X-Flags: 0000
Delivered-To: GMX delivery to christoph.plattner@gmx.at
Received: (qmail 4878 invoked by uid 0); 26 Jun 2002 21:52:29 -0000
Received: from dsl2.external.hp.com (192.25.206.7)
  by mx0.gmx.net (mx008-rz3) with SMTP; 26 Jun 2002 21:52:29 -0000
Received: from dsl2.external.hp.com (localhost [127.0.0.1])
	by dsl2.external.hp.com (Postfix) with ESMTP
	id 17DC4482E; Wed, 26 Jun 2002 15:52:06 -0600 (MDT)
Delivered-To: parisc-linux@lists.parisc-linux.org
Received: from viefep15-int.chello.at (viefep15-int.chello.at [213.46.255.19])
	by dsl2.external.hp.com (Postfix) with ESMTP id F38C5482B
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Jun 2002 15:51:57 -0600 (MDT)
Received: from gmx.at ([62.178.92.247]) by viefep15-int.chello.at
          (InterMail vM.5.01.03.06 201-253-122-118-106-20010523) with ESMTP
          id <20020626215155.OJVW1259.viefep15-int.chello.at@gmx.at>
          for <parisc-linux@lists.parisc-linux.org>;
          Wed, 26 Jun 2002 23:51:55 +0200
Message-ID: <3D1A377A.E0CFABBD@gmx.at>
From: Christoph Plattner <christoph.plattner@gmx.at>
Organization: private
X-Mailer: Mozilla 4.76 [en] (X11; U; Linux 2.4.6 i686)
X-Accept-Language: en
MIME-Version: 1.0
To: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Subject: [parisc-linux] Problem find devices on the E55 I/O interfaces
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
X-BeenThere: parisc-linux@lists.parisc-linux.org
X-Mailman-Version: 2.0.8
Precedence: bulk
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>
Date: Wed, 26 Jun 2002 23:51:54 +0200
X-Mozilla-Status2: 00000000

Hello PARISC hackers !

I have problems in the device probing on the E55, and I need some
hints here. I am at the very starting point of the SCSI driver
development, and other (Rayn) will also need this for MUX (serial),
etc....

The E55 is a machine of the type "SYSTEM MAP TYPE".
I instrumented the code to read out the values and elements at the
inventory probing. I will append the log of my "debug helps", they
are quite self explaining.

The `walk_central_bus()' calls seems to do correct work. It finds the 
basic elements on my E55:

	On the "56" the bus converter
	On "62" and "63" components on the system (main) board
	- "62" is the CPU, "63" the Memory

	The search was started at the "60".

My problem now. The `walk_lower_bus()' under the device "56" cannot
find any further devices. Seen on PDC or HP-UX, under "56/52" the
SCSI controller is present, further the parallel interface and the 
serial MUX also should be found.

Do we use the wrong search address here, taken from io_io_low of
the `struct bc_module'. Do we access it in a wrong way ?
Is THIS structure documented in any of the PARISC documents, other-
wise, where does this structure come from ?

I hope you have some hints here ...

Best regards
Christoph P.

-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


--------------3AC8D7198F72B65AB646159B--

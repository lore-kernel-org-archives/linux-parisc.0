Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.istop.com (cpu1693.adsl.bellglobal.com [206.47.27.174])
	by dsl2.external.hp.com (Postfix) with ESMTP id F210D482C
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Dec 2001 10:02:09 -0700 (MST)
Received: from old@istop.magma.ca (herbr.istop.com [216.187.107.13])
	by ns.istop.com (Postfix) with ESMTP id 3A4AE1702B
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Dec 2001 12:05:21 -0500 (EST)
Message-Id: <5.1.0.14.0.20011212111857.0263d110@mail.magma.ca>
Date: Wed, 12 Dec 2001 12:01:45 -0500
To: parisc-linux@lists.parisc-linux.org
From: Herb Radford <herbr@magma.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Subject: [parisc-linux] Install on a D370!
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

OK, I have had success with the C110, C200 and a B180 system.
Now I'm trying a D370. No go. I tried with the 0.9.2 Cd just to see if it 
was alive or had basic problems. Got as far as the famous (for me anyway) 
"Branching to kernel entry point 0x00100000." and that's all folks! I tried 
both serial ports on the machine to no avail.
Yesterday I downloaded the 0.9.3-rc6.iso (it has the same md5sum as the 
official version so I assume congruency) and have had exactly the same results!
There is a FWSCSI card in the box with 6 drives attached and another card, 
a "Remote Management/Access Port" card in HSC 0 Slot 0.
I've seen a couple of messages about D350's which say all this stuff worked!

Does anyone have any suggestions?

Regards, Herb

And here's the log file:

Firmware Version  38.40



Duplex Console IO Dependent Code (IODC) revision 4



------------------------------------------------------------------------------

    (c) Copyright 1995-1998, Hewlett-Packard Company, All rights reserved

------------------------------------------------------------------------------



   Processor   Speed            State           Coprocessor State  Cache Size

   ---------  --------   ---------------------  -----------------  ----------

       0       160 MHz   Active                 Functional          512 KB



   Central Bus Speed (in MHz)  :        120



   Model: D370/1



   Available memory (bytes)    :  536870912

   Good memory required (bytes):   43753472



   Primary boot path:    8/16/5.4   (dec)

   Alternate boot path:  8/16/5.0   (dec)

   Console path:         8/20/1.0   (dec)

   Keyboard path:        8/16/7.0   (dec)



------- Main Menu -------------------------------------------------------------



         Command                         Description

         -------                         -----------

         BOot [PRI|ALT|<path>]           Boot from specified path

         PAth [PRI|ALT|CON|KEY] [<path>] Display or modify a path

         SEArch [DIsplay|IPL] [<path>]   Search for boot devices



         COnfiguration [<command>]       Access Configuration menu/commands

         INformation [<command>]         Access Information menu/commands

         SERvice [<command>]             Access Service menu/commands



         DIsplay                         Redisplay the current menu

         HElp [<menu>|<command>]         Display help for menu or command

         RESET                           Restart the system

-------

Main Menu: Enter command > sea iopl



Searching for device(s) with bootable media...

This may take several minutes.


To discontinue search, press any key (termination may not be immediate).




    Path Number        Device Path (dec)        Device Type and Utilities

    -----------        -----------------        -------------------------

    P0                 8/16/5.2                 Random access media

                                                IPL

    P1                 8/16/6.0                 LAN Module




Main Menu: Enter command > sea



Searching for potential boot device(s)...

This may take several minutes.


To discontinue search, press any key (termination may not be immediate).




    Path Number        Device Path (dec)        Device Type

    -----------        -----------------        -----------

    P0                 8/4.11                   Random access media

    P1                 8/4.10                   Random access media

    P2                 8/4.9                    Random access media

    P3                 8/4.8                    Random access media

    P4                 8/4.4                    Random access media

    P5                 8/16/5.2                 Random access media

    P6                 8/16/6.0                 LAN Module




Main Menu: Enter command > sea ipl



Searching for device(s) with bootable media...

This may take several minutes.


To discontinue search, press any key (termination may not be immediate).




    Path Number        Device Path (dec)        Device Type and Utilities

    -----------        -----------------        -------------------------

    P0                 8/16/5.2                 Random access media

                                                IPL

    P1                 8/16/6.0                 LAN Module




Main Menu: Enter command > bo p0

Interact with IPL (Y, N, or Cancel)?> n



Booting...

Boot IO Dependent Code (IODC) revision 1





HARD Booted.

palo ipl 0.96 root@palinux Fri Nov  2 16:31:18 MST 2001



Boot image contains:

     0/vmlinux32 3122078 bytes @ 0x4cf000

     0/vmlinux64 3990942 bytes @ 0x7c9800

     0/ramdisk 1946807 bytes @ 0xb98000



Information: No console specified on kernel command line. This is normal.

PALO will choose the console currently  used by firmware (serial).



Command line for kernel: 'root=/dev/ram console=ttyS0 TERM=vt102'

Selected kernel: /vmlinux from partition 0

Selected ramdisk: /ramdisk from partition 0

Warning: kernel name doesn't end with 32 or 64 -- Guessing...

This box can boot either 32 or 64-bit kernels...

Both kernels available, choosing 32-bit kernel

ELF32 executable

Entry 00100000 first 00100000 n 6

Segment 0 load 00100000 size 1618208 mediaptr 0x1000

Segment 1 load 0028c000 size 287728 mediaptr 0x18d000

Segment 2 load 002d4000 size 379072 mediaptr 0x1d4000

Segment 3 load 00334000 size 8192 mediaptr 0x231000

Segment 4 load 00338000 size 32768 mediaptr 0x233000

Segment 5 load 003750e8 size 83184 mediaptr 0x23b0e8

Loading ramdisk 1946807 bytes @ 1fe14000...

Branching to kernel entry point 0x00100000.  If this is the last

message you see, you may need to switch your console.  This is

a common symptom -- search the FAQ and mailing list at parisc-linux.org


Firmware Version  38.40



Duplex Console IO Dependent Code (IODC) revision 4



------------------------------------------------------------------------------

    (c) Copyright 1995-1998, Hewlett-Packard Company, All rights reserved

------------------------------------------------------------------------------



   Processor   Speed            State           Coprocessor State  Cache Size

   ---------  --------   ---------------------  -----------------  ----------

       0       160 MHz   Active                 Functional          512 KB



   Central Bus Speed (in MHz)  :        120



   Model: D370/1



   Available memory (bytes)    :  536870912

   Good memory required (bytes):   43753472



   Primary boot path:    8/16/5.4   (dec)

   Alternate boot path:  8/16/5.0   (dec)

   Console path:         8/20/1.0   (dec)

   Keyboard path:        8/16/7.0   (dec)



------- Main Menu -------------------------------------------------------------



         Command                         Description

         -------                         -----------

         BOot [PRI|ALT|<path>]           Boot from specified path

         PAth [PRI|ALT|CON|KEY] [<path>] Display or modify a path

         SEArch [DIsplay|IPL] [<path>]   Search for boot devices



         COnfiguration [<command>]       Access Configuration menu/commands

         INformation [<command>]         Access Information menu/commands

         SERvice [<command>]             Access Service menu/commands



         DIsplay                         Redisplay the current menu

         HElp [<menu>|<command>]         Display help for menu or command

         RESET                           Restart the system

-------

Main Menu: Enter command > pa



   Primary boot path:    8/16/5.4   (dec)

                         08/10/05.4   (hex)



   Alternate boot path:  8/16/5.0   (dec)

                         08/10/05.0   (hex)



   Console path:         8/20/1.0   (dec)

                         08/14/01.0   (hex)



   Keyboard path:        8/16/7.0   (dec)

                         08/10/07.0   (hex)



Main Menu: Enter command > di



------- Main Menu -------------------------------------------------------------



         Command                         Description

         -------                         -----------

         BOot [PRI|ALT|<path>]           Boot from specified path

         PAth [PRI|ALT|CON|KEY] [<path>] Display or modify a path

         SEArch [DIsplay|IPL] [<path>]   Search for boot devices



         COnfiguration [<command>]       Access Configuration menu/commands

         INformation [<command>]         Access Information menu/commands

         SERvice [<command>]             Access Service menu/commands



         DIsplay                         Redisplay the current menu

         HElp [<menu>|<command>]         Display help for menu or command

         RESET                           Restart the system

-------

Main Menu: Enter command > ser



------- Service Menu ----------------------------------------------------------



         Command                         Description

         -------                         -----------

         ChassisCodes [<proc>]           Display chassis codes

         CLEARPIM                        Clear (zero) the contents of PIM

         EepromRead [<addr>] [<len>]     Read EEPROM locations

         LCD [ON|OFF]                    Configure the front panel display

         MemRead <addr> [<len>]          Read memory locations

         PDT [CLEAR]                     Display or clear

                                         the Page Deallocation Table

         PIM [<proc> [HPMC|LPMC|TOC]]    Display PIM information



         BOot [PRI|ALT|<path>]           Boot from specified path

         DIsplay                         Redisplay the current menu

         HElp [<menu>|<command>]         Display help for menu or command

         RESET                           Restart the system

         MAin                            Return to Main menu

-------

Service Menu: Enter command > pim



PROCESSOR PIM INFORMATION



-----------------  Processor 0 HPMC Information ------------------


    No valid timestamp


HPMC Chassis Codes = No chassis codes logged



General Registers 0 - 31

00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000

04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000

08-11  0000000000000000  0000000000000000  0000000000000000  0000000000000000

12-15  0000000000000000  0000000000000000  0000000000000000  0000000000000000

16-19  0000000000000000  0000000000000000  0000000000000000  0000000000000000

20-23  0000000000000000  0000000000000000  0000000000000000  0000000000000000

24-27  0000000000000000  0000000000000000  0000000000000000  0000000000000000

28-31  0000000000000000  0000000000000000  0000000000000000  0000000000000000



<Press any key to continue (q to quit)>



Control Registers 0 - 31

00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000

04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000

08-11  0000000000000000  0000000000000000  0000000000000000  0000000000000000

12-15  0000000000000000  0000000000000000  0000000000000000  0000000000000000

16-19  0000000000000000  0000000000000000  0000000000000000  0000000000000000

20-23  0000000000000000  0000000000000000  0000000000000000  0000000000000000

24-27  0000000000000000  0000000000000000  0000000000000000  0000000000000000

28-31  0000000000000000  0000000000000000  0000000000000000  0000000000000000



Space Registers 0 - 7

00-03  00000000          00000000          00000000          00000000

04-07  00000000          00000000          00000000          00000000



<Press any key to continue (q to quit)>


IIA Space                    = 0x0000000000000000

IIA Offset                   = 0x0000000000000000

Check Type                   = 0x00000000

CPU State                    = 0x00000000

Cache Check                  = 0x00000000

TLB Check                    = 0x00000000

Bus Check                    = 0x00000000

Assists Check                = 0x00000000

Assist State                 = 0x00000000

Path Info                    = 0x00000000

System Responder Address     = 0x0000000000000000

System Requestor Address     = 0x0000000000000000

Check Summary                = 0x0000000000000000

Available Memory             = 0x0000000000000000

CPU Diagnose Register 2      = 0x0000000000000000

CPU Status Register 0        = 0x0000000000000000

CPU Status Register 1        = 0x0000000000000000

SADD LOG                     = 0x0000000000000000

Read Short LOG               = 0x0000000000000000



<Press any key to continue (q to quit)>



-----------------  Processor 0 LPMC Information ------------------


Check Type                   = 0x00000000

IC Parity Info               = 0x00000000

Cache Check                  = 0x00000000

TLB Check                    = 0x00000000

Bus Check                    = 0x00000000

Assists Check                = 0x00000000

Assist State                 = 0x00000000

Path Info                    = 0x00000000

System Responder Address     = 0x0000000000000000

System Requestor Address     = 0x0000000000000000




-----------------  Processor 0 TOC Information -------------------


General Registers 0 - 31

00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000

04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000

08-11  0000000000000000  0000000000000000  0000000000000000  0000000000000000

12-15  0000000000000000  0000000000000000  0000000000000000  0000000000000000

16-19  0000000000000000  0000000000000000  0000000000000000  0000000000000000

20-23  0000000000000000  0000000000000000  0000000000000000  0000000000000000

24-27  0000000000000000  0000000000000000  0000000000000000  0000000000000000

28-31  0000000000000000  0000000000000000  0000000000000000  0000000000000000



<Press any key to continue (q to quit)>



Control Registers 0 - 31

00-03  0000000000000000  0000000000000000  0000000000000000  0000000000000000

04-07  0000000000000000  0000000000000000  0000000000000000  0000000000000000

08-11  0000000000000000  0000000000000000  0000000000000000  0000000000000000

12-15  0000000000000000  0000000000000000  0000000000000000  0000000000000000

16-19  0000000000000000  0000000000000000  0000000000000000  0000000000000000

20-23  0000000000000000  0000000000000000  0000000000000000  0000000000000000

24-27  0000000000000000  0000000000000000  0000000000000000  0000000000000000

28-31  0000000000000000  0000000000000000  0000000000000000  0000000000000000



Space Registers 0 - 7

00-03  00000000          00000000          00000000          00000000

04-07  00000000          00000000          00000000          00000000



IIA Space                    = 0x0000000000000000

IIA Offset                   = 0x0000000000000000

CPU State                    = 0x00000000



<Press any key to continue (q to quit)>



Memory Error Log Information:


    No valid timestamp


    No memory errors logged




I/O Module Error Log Information:


    No valid timestamp


    No I/O module errors logged


<Press any key to continue (q to quit)>



IO Bus Converter Log

--------------------


IOA0 HPA            = 0x00000000

IOA0 UBC_IO_CONTROL = 0x00000000

GSC1 HPA            = 0x00000000

IOA0 IO_IO_LO       = 0x00000000

IOA0 IO_IO_HI       = 0x00000000

IOA0 IO_IO_LO_HV    = 0x00000000

IOA0 IO_IO_HI_HV    = 0x00000000



IOA1 HPA            = 0x00000000

IOA1 UBC_IO_CONTROL = 0x00000000

GSC2 HPA            = 0x00000000

IOA1 IO_IO_LO       = 0x00000000

IOA1 IO_IO_HI       = 0x00000000

IOA1 IO_IO_LO_HV    = 0x00000000

IOA1 IO_IO_HI_HV    = 0x00000000



   NIO bus converter register data is not available.





Service Menu: Enter command >  di



------- Service Menu ----------------------------------------------------------



         Command                         Description

         -------                         -----------

         ChassisCodes [<proc>]           Display chassis codes

         CLEARPIM                        Clear (zero) the contents of PIM

         EepromRead [<addr>] [<len>]     Read EEPROM locations

         LCD [ON|OFF]                    Configure the front panel display

         MemRead <addr> [<len>]          Read memory locations

         PDT [CLEAR]                     Display or clear

                                         the Page Deallocation Table

         PIM [<proc> [HPMC|LPMC|TOC]]    Display PIM information



         BOot [PRI|ALT|<path>]           Boot from specified path

         DIsplay                         Redisplay the current menu

         HElp [<menu>|<command>]         Display help for menu or command

         RESET                           Restart the system

         MAin                            Return to Main menu

-------

Service Menu: Enter command > ma



------- Main Menu -------------------------------------------------------------



         Command                         Description

         -------                         -----------

         BOot [PRI|ALT|<path>]           Boot from specified path

         PAth [PRI|ALT|CON|KEY] [<path>] Display or modify a path

         SEArch [DIsplay|IPL] [<path>]   Search for boot devices



         COnfiguration [<command>]       Access Configuration menu/commands

         INformation [<command>]         Access Information menu/commands

         SERvice [<command>]             Access Service menu/commands



         DIsplay                         Redisplay the current menu

         HElp [<menu>|<command>]         Display help for menu or command

         RESET                           Restart the system

-------

Main Menu: Enter command > co



------- Configuration Menu ----------------------------------------------------



         Command                         Description

         -------                         -----------

         AUto [BOot|SEArch] [ON|OFF]     Display or set specified auto flag

         BootID [<proc>] [<boot ID>]     Display or modify processor boot ID

         BootINfo                        Display boot-related information

         BootTimer [0 - 200]             Display or set boot delay time

         CPUconfig [<proc>] [ON|OFF]     Config/deconfig processor

         DEfault                         Set the system to predefined values

         FastBoot [ON|OFF]               Display or set boot tests execution

         LanConfig [ENABLE|DISABLE]      Enable or Disable the built-in LAN

         PAth [PRI|ALT|CON|KEY] [<path>] Display or modify a path

         SEArch [DIsplay|IPL] [<path>]   Search for boot devices

         TIme [c:y:m:d:h:m:[s]]          Read or set the real time clock in GMT



         BOot [PRI|ALT|<path>]           Boot from specified path

         DIsplay                         Redisplay the current menu

         HElp [<menu>|<command>]         Display help for menu or command

         RESET                           Restart the system

         MAin                            Return to Main menu

-------

Configuration Menu: Enter command > bin



BOOT INFORMATION


   Processor         Boot ID

   ---------         -------

       0                2



   Autoboot:             OFF

   Autosearch:           OFF

   Fastboot:             OFF



   Primary boot path:    8/16/5.4   (dec)

                         08/10/05.4   (hex)

   Alternate boot path:  8/16/5.0   (dec)

                         08/10/05.0   (hex)

   Console path:         8/20/1.0   (dec)

                         08/14/01.0   (hex)

   Keyboard path:        8/16/7.0   (dec)

                         08/10/07.0   (hex)



   LAN Station Address:  080009-d20c1e



   Wed Dec  12 16:08:40 GMT 2001    (20:01:12:12:16:08:40)


Configuration Menu: Enter command >

Configuration Menu: Enter command > di



------- Configuration Menu ----------------------------------------------------



         Command                         Description

         -------                         -----------

         AUto [BOot|SEArch] [ON|OFF]     Display or set specified auto flag

         BootID [<proc>] [<boot ID>]     Display or modify processor boot ID

         BootINfo                        Display boot-related information

         BootTimer [0 - 200]             Display or set boot delay time

         CPUconfig [<proc>] [ON|OFF]     Config/deconfig processor

         DEfault                         Set the system to predefined values

         FastBoot [ON|OFF]               Display or set boot tests execution

         LanConfig [ENABLE|DISABLE]      Enable or Disable the built-in LAN

         PAth [PRI|ALT|CON|KEY] [<path>] Display or modify a path

         SEArch [DIsplay|IPL] [<path>]   Search for boot devices

         TIme [c:y:m:d:h:m:[s]]          Read or set the real time clock in GMT



         BOot [PRI|ALT|<path>]           Boot from specified path

         DIsplay                         Redisplay the current menu

         HElp [<menu>|<command>]         Display help for menu or command

         RESET                           Restart the system

         MAin                            Return to Main menu

-------

Configuration Menu: Enter command > ma



------- Main Menu -------------------------------------------------------------



         Command                         Description

         -------                         -----------

         BOot [PRI|ALT|<path>]           Boot from specified path

         PAth [PRI|ALT|CON|KEY] [<path>] Display or modify a path

         SEArch [DIsplay|IPL] [<path>]   Search for boot devices



         COnfiguration [<command>]       Access Configuration menu/commands

         INformation [<command>]         Access Information menu/commands

         SERvice [<command>]             Access Service menu/commands



         DIsplay                         Redisplay the current menu

         HElp [<menu>|<command>]         Display help for menu or command

         RESET                           Restart the system

-------

Main Menu: Enter command > in all



PROCESSOR INFORMATION


                        HVERSION  SVERSION   CVERSION     Processor

   Processor   Speed     Model    Model/Op  (Revision)      State

   ---------  --------  --------  --------  ----------  -------------

       0       160 MHz   0x5a20    0x0481      769      Active



   Central Bus Speed (in MHz)  :        120

   HSC Bus Speed (in MHz)      :         39

   Software ID (dec)           : 2014794797

   Software ID (hex)           : 0x7817542d

   Software Capability         : 0xf0



   Model: D370/1



<Press any key to continue (q to quit)>



COPROCESSOR INFORMATION


                     Coprocessor   Coprocessor      Coprocessor

        Processor       Model        Revision          State

       -----------   -----------   -----------   -----------------

            0         0x0000000e           0      Functional





CACHE INFORMATION


        Processor    Instruction Cache Size    Data Cache Size

       -----------   -----------------------   ---------------

            0               512 KB                  512 KB



<Press any key to continue (q to quit)>



MEMORY INFORMATION



    MEMORY STATUS TABLE


    Slot     SIMM Pair Size     Status

    ----     --------------     ------

    0a/b      256MB            Configured

    1a/b      256MB            Configured

             ---------

    TOTAL     512MB



<Press any key to continue (q to quit)>




    DETAILED MEMORY CONFIGURATION TABLE



    SPA         GROUP  SMC  SMC Status   Bank  Bank Status  Size  Slot

    ---         -----  ---  ----------   ----  -----------  ----  ----

    0x00000000    0     0   Configured     3   Configured  128MB  1a/b

                        1   Configured     0   Configured  128MB  1a/b

                        2   Configured     1   Configured  128MB  0a/b

                        2   Configured     2   Configured  128MB  0a/b





    Group 0 interleaved  4 ways over  4 banks



<Press any key to continue (q to quit)>






    Active, installed memory (bytes)  :  536870912 of DRAM

    Deallocated pages (bytes)         -          0

                                         -----------

    Available memory (bytes)          :  536870912



    Good memory required by OS (bytes):   43753472



          Memory

    HVERSION  SVERSION

    -------- ----------

     0x0760  0x00000900


<Press any key to continue (q to quit)>



I/O MODULE INFORMATION


                                                                    IODC   IODC

Path (dec)   Type                Bus Slot Mod HVERSION  SVERSION   Vers   Dep

----         ----                --- ---- --- -------- ---------- ------ ------

8            I/O Adapter           0   2   0   0x580f  0x10000b50  0x00   0x00

8/0          Bus Converter         1   0   0   0x5000  0x00000c00  0x00   0x00

8/0/0        A Direct I/O          5   0   0   0x0100  0x00000d00  0x04   0x00

8/4          A DMA I/O             1   1   0   0x0131  0x00008980  0x98   0x00

8/16         Bus Adapter           1   4   0   0x02f0  0x00008100  0x00   0x00

8/16/5       Built-in SE SCSI     16   1   1   0x02f0  0x00008280  0x01   0x00

8/16/6       Built-in LAN         16   1   2   0x02f0  0x00008a00  0x02   0x00

8/16/0       Built-in Parallel    16   0   0   0x02f0  0x00007400  0x00   0x00

8/16/7       Built-in Keyboard    16   1   3   0x02f0  0x00008400  0x00   0x00

8/16/8       Built-in Mouse       16   2   0   0x02f0  0x00008400  0x00   0x00

8/20         Bus Adapter           1   5   0   0x0310  0x00008e00  0x00   0x00

8/20/5       Bus Adapter          20   1   1   0x0310  0x00009000  0x00   0x00

8/20/2       RS232 Port           20   0   2   0x0310  0x00008c00  0x00   0x00

10           I/O Adapter           0   2   2   0x580f  0x10000b50  0x00   0x00



<Press any key to continue (q to quit)>



Hot Swap module is present.



EISA Cards


Path        Type                            EISA ID

----        ----                            -------

8/20/5/1    EISA slot is empty

8/20/5/2    EISA slot is empty

8/20/5/3    EISA slot is empty

8/20/5/4    EISA slot is empty

8/20/5/5    EISA slot is empty

8/20/5/6    EISA slot is empty

8/20/5/7    EISA slot is empty

8/20/5/8    EISA slot is empty





<Press any key to continue (q to quit)>



BOOT INFORMATION


   Processor         Boot ID

   ---------         -------

       0                2



   Autoboot:             OFF

   Autosearch:           OFF

   Fastboot:             OFF



   Primary boot path:    8/16/5.4   (dec)

                         08/10/05.4   (hex)

   Alternate boot path:  8/16/5.0   (dec)

                         08/10/05.0   (hex)

   Console path:         8/20/1.0   (dec)

                         08/14/01.0   (hex)

   Keyboard path:        8/16/7.0   (dec)

                         08/10/07.0   (hex)



   LAN Station Address:  080009-d20c1e



   Wed Dec  12 16:10:43 GMT 2001    (20:01:12:12:16:10:43)


<Press any key to continue (q to quit)>



FIRMWARE INFORMATION


   Firmware Version:     38.40




CHIP REVISIONS


   Module                           Revision

   ------                           --------

   System Board                     0

   Processor Board                  0

   PA 8000-8000 CPU                 3.1

   Firmware                         24

   Master Memory Controller         9

   I/O Bus Adapter 0                15

   Fast/Wide SCSI Board             1

   Multifunction I/O Controller     0

   EISA Interface                   0

   I/O Bus Adapter 1                15



<Press any key to continue (q to quit)>



WARNINGS



No warnings to report.


Main Menu: Enter command > sea ipl



Searching for device(s) with bootable media...

This may take several minutes.


To discontinue search, press any key (termination may not be immediate).




    Path Number        Device Path (dec)        Device Type and Utilities

    -----------        -----------------        -------------------------

    P0                 8/16/5.2                 Random access media

                                                IPL

    P1                 8/16/6.0                 LAN Module




Main Menu: Enter command > bo p0

Interact with IPL (Y, N, or Cancel)?> y



Booting...

Boot IO Dependent Code (IODC) revision 1





HARD Booted.

palo ipl 0.96 root@palinux Fri Nov  2 16:31:18 MST 2001



Boot image contains:

     0/vmlinux32 3122078 bytes @ 0x4cf000

     0/vmlinux64 3990942 bytes @ 0x7c9800

     0/ramdisk 1946807 bytes @ 0xb98000



Information: No console specified on kernel command line. This is normal.

PALO will choose the console currently  used by firmware (serial).

Current command line:

0/vmlinux root=/dev/ram initrd=0/ramdisk console=ttyS0 TERM=vt102

  0: 0/vmlinux

  1: root=/dev/ram

  2: initrd=0/ramdisk

  3: console=ttyS0

  4: TERM=vt102



Edit which field?

(or 'b' to boot with this command line)? 0 b



Command line for kernel: 'root=/dev/ram console=ttyS0 TERM=vt102'

Selected kernel: /vmlinux from partition 0

Selected ramdisk: /ramdisk from partition 0

Warning: kernel name doesn't end with 32 or 64 -- Guessing...

This box can boot either 32 or 64-bit kernels...

Both kernels available, choosing 32-bit kernel

ELF32 executable

Entry 00100000 first 00100000 n 6

Segment 0 load 00100000 size 1618208 mediaptr 0x1000

Segment 1 load 0028c000 size 287728 mediaptr 0x18d000

Segment 2 load 002d4000 size 379072 mediaptr 0x1d4000

Segment 3 load 00334000 size 8192 mediaptr 0x231000

Segment 4 load 00338000 size 32768 mediaptr 0x233000

Segment 5 load 003750e8 size 83184 mediaptr 0x23b0e8

Loading ramdisk 1946807 bytes @ 1fe14000...

Branching to kernel entry point 0x00100000.  If this is the last

message you see, you may need to switch your console.  This is

a common symptom -- search the FAQ and mailing list at parisc-linux.org










[1;24r

From: Helge Deller <deller@gmx.de>
Subject: Board & CPU temperature of C8000 workstation with IPMI
Date: Fri, 14 Oct 2016 15:30:54 +0200
Message-ID: <5800DE0E.80809@gmx.de>
References: <xfk3dgbwtml2ipflw4qteta4.1476373659232@email.android.com>
 <CAL2AjcemWWonjOWNa+X+2Qsewfzohp0C4pFjh8CmAk2UbbC=-A@mail.gmail.com>
 <57FFB7C1.1040809@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: pannonmage <pannonmage@googlemail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <57FFB7C1.1040809@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi all,

I was asked about how to remotely find out the board/CPU temperature
of a HP C8000 workstation. Here is the way I found on Debian Linux:

Instruct the kernel to load the IPMI modules:
 modprobe ipmi_si
 modprobe ipmi_devintf

You need to have the "ipmitool" installed:
 apt-get install ipmitool

Then, you can run "ipmitool sdr" to get quite some information:
root@savaria:/# ipmitool sdr
Chassis Intrus   | 0x01              | ok
Chassis Open     | 0x00              | ok
Security         | Not Readable      | ns
Power Button     | 0x01              | ok
Power Button     | 0x00              | ok
Clear CMOS Jmpr  | 0x00              | ok
Safe Mode Jmpr   | 0x00              | ok
Clr Passwd Jmpr  | 0x00              | ok
Rsvd Jmpr        | Not Readable      | ns
Rsvd2 Jmpr       | Not Readable      | ns
Watchdog Timer   | Not Readable      | ns
Cooling 2 (CPU)  | 0x01              | ok
Cooling 3 (Mem)  | 0x01              | ok
Cooling 4 (Disk) | 0x01              | ok
Wake-on-LAN      | Not Readable      | ns
Missing Device   | Not Readable      | ns
Power Supply     | 0x01              | ok
Power Control    | 0x01              | ok
Pwr Pod 0 Fault  | 0x00              | ok
Pwr Pod 1 Fault  | Not Readable      | ns
Battery Voltage  | 0x00              | ok
Over-Voltage     | 0x00              | ok
Power Good       | 0x00              | ok
Ambient Temp     | 24 degrees C      | ok
Processor 0 Temp | 86 degrees C      | ok
Processor 1 Temp | no reading        | ns
Chassis Fan Tach | disabled          | ns
CPU0 Fan Tach    | disabled          | ns
CPU1 Fan Tach    | disabled          | ns
Memory Fan Tach  | disabled          | ns
Disk Fan Tach    | disabled          | ns
Chassis Fan      | 0x00              | ok
CPU0 Fan         | 0x00              | ok
CPU1 Fan         | 0x00              | ok
Memory Fan       | 0x00              | ok
Disk Fan         | 0x00              | ok
ACPI State       | 0x01              | ok
TOC Interrupt    | 0x00              | ok
SDR Time Set     | 0x00              | ok
SEL Time Set     | 0x00              | ok
Intrnl Watchdog  | Not Readable      | ns


Another temperature information can be gathered from the 
built-in SATA/SCSI drives:

Install smartmontools:
 apt-get install smartmontools

Get drive information:
 smartctl --all /dev/sda | grep -i temp
Temperature Warning:  Enabled
Current Drive Temperature:     44 C
Drive Trip Temperature:        68 C


Any other ideas ?
Additionally I wonder if it's possible to get more information filled in
for IPMI on C8000 machines. E.g. is it possible on HP-UX to remotely turn
the machine on and off ?

Helge

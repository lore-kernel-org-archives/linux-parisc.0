From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Board & CPU temperature of C8000 workstation with IPMI
Date: Fri, 14 Oct 2016 19:30:21 -0400
Message-ID: <9DC6B052-2B72-421C-A182-42B904DD5F2D@bell.net>
References: <xfk3dgbwtml2ipflw4qteta4.1476373659232@email.android.com> <CAL2AjcemWWonjOWNa+X+2Qsewfzohp0C4pFjh8CmAk2UbbC=-A@mail.gmail.com> <57FFB7C1.1040809@gmx.de> <5800DE0E.80809@gmx.de> <75fb661f-ccbd-84ab-ad08-3df37d09b295@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>,
        "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
        pannonmage <pannonmage@googlemail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <75fb661f-ccbd-84ab-ad08-3df37d09b295@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2016-10-14, at 9:51 AM, John David Anglin wrote:

> Hi Helge,
> 
> On 2016-10-14 9:30 AM, Helge Deller wrote:
>> Additionally I wonder if it's possible to get more information filled in
>> for IPMI on C8000 machines. E.g. is it possible on HP-UX to remotely turn
>> the machine on and off ?
>> 
> I had wondered that as well.  On rp3440, I see messages during boot that indicate that
> the ipmi doesn't know how to do it.
> 
> I will try ipmitool on rp3440 tonight.


mx3210:/home/dave# ipmitool sdr
Chassis Intrus   | 0x00              | ok
Chassis Open     | 0x00              | ok
Security         | Not Readable      | ns
Power Button     | 0x00              | ok
Power Button     | 0x00              | ok
Clear CMOS Jmpr  | Not Readable      | ns
Safe Mode Jmpr   | Not Readable      | ns
Clr Passwd Jmpr  | 0x00              | ok
Rsvd Jmpr        | Not Readable      | ns
Rsvd2 Jmpr       | Not Readable      | ns
Watchdog Timer   | Not Readable      | ns
Cooling 1 (Sys)  | 0x01              | ok
Cooling 2 (Mem)  | 0x01              | ok
Cooling 3 (Disk) | 0x01              | ok
Wake-on-LAN 100  | Not Readable      | ns
Wake-on-LAN 1Gb  | Not Readable      | ns
Missing Device   | Not Readable      | ns
SAF-TE Card      | Not Readable      | ns
Power Supply 1   | 0x01              | ok
Power Supply 2   | 0x00              | ok
Pwr Spply 1 Ctrl | Not Readable      | ns
Pwr Spply 2 Ctrl | Not Readable      | ns
Power Redundancy | 0x01              | ok
AC Pwr Supply 1  | Not Readable      | ns
AC Pwr Supply 2  | Not Readable      | ns
12V Pwr Supply 1 | 0x00              | ok
12V Pwr Supply 2 | 0x00              | ok
12V Rail 0       | 0x00              | ok
12V Rail 1       | 0x00              | ok
12V Rail 2       | 0x00              | ok
12V Rail 3       | 0x00              | ok
12V Rail 4       | 0x00              | ok
Battery Voltage  | 0x00              | ok
Over-Voltage     | 0x00              | ok
Power Good       | 0x00              | ok
Ambient Temp     | 22 degrees C      | ok
Processor 0 Temp | 56 degrees C      | ok
Processor 1 Temp | 56 degrees C      | ok
Fan 1R Tach      | 2610 RPM          | ok
Fan 1L Tach      | 2670 RPM          | ok
Fan CPU0 Tach    | 4470 RPM          | ok
Fan CPU1 Tach    | 4380 RPM          | ok
Fan 2F Tach      | 3870 RPM          | ok
Fan 2B Tach      | 4110 RPM          | ok
Fan 3F Tach      | 3090 RPM          | ok
Fan 3B Tach      | 2790 RPM          | ok
Fan 1R (Power)   | 0x00              | ok
Fan 1L (Power)   | 0x00              | ok
Fan CPU0 (R)     | 0x00              | ok
Fan CPU1 (L)     | 0x00              | ok
Fan 2F (Memory)  | 0x00              | ok
Fan 2B (Memory)  | 0x00              | ok
Fan 3F (Disk)    | 0x00              | ok
Fan 3B (Disk)    | 0x00              | ok
SCSI Device 0    | 0x01              | ok
SCSI Device 1    | 0x00              | ok
SCSI Device 2    | 0x01              | ok
SCSI ChA Cable   | 0x01              | ok
SCSI ChB Cable   | 0x01              | ok
SCSI ChExt Cable | 0x01              | ok
ACPI State       | 0x01              | ok
TOC Interrupt    | 0x00              | ok
SDR Time Set     | 0x00              | ok
SEL Time Set     | 0x00              | ok
Intrnl Watchdog  | Not Readable      | ns

--
John David Anglin	dave.anglin@bell.net




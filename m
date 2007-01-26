From: Michael Greene <listsnews@cox.net>
Subject: [parisc-linux] Re: Help with J5600 (Model: 9000/785/J5600)
Date: Fri, 26 Jan 2007 15:01:38 -0500
Message-ID: <45BA5E22.8000406__19860.8059123673$1416624634$gmane$org@cox.net>
References: <epbfs6$62t$1@sea.gmane.org>
	<20070126000539.GB13938@athena.road.mcmartin.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux@parisc-linux.org
To: Kyle McMartin <kyle@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070126000539.GB13938@athena.road.mcmartin.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Kyle McMartin wrote:
> On Thu, Jan 25, 2007 at 06:52:39PM -0500, Michael Greene wrote:
>> I am trying to get any version of hppa linux running on an old J5600, 
>> <snip>
>> SBA found Astro 2.1 at 0xfed00000
>> Elroy version TR4.0 (0x5) found at 0xfed30000
>> PCI: Enabled native mode for NS87415 (pif=0x8f)
>> iosapic: 0xfed30800 : no IRT entry for slot 12, pin 1
>> iosapic: no IRTE for 0000:00:0c.0 (IRQ not connected?)
>> iosapic: 0xfed30800 : no IRT entry for slot 13, pin 1
>> iosapic: no IRTE for 0000:00:0d.0 (IRQ not connected?)
>> iosapic: 0xfed30800 : no IRT entry for slot 14, pin 4
>> iosapic: no IRTE for 0000:00:0e.2 (IRQ not connected?)
>> iosapic: 0xfed30800 : no IRT entry for slot 15, pin 1
>> iosapic: no IRTE for 0000:00:0f.0 (IRQ not connected?)
>> iosapic: 0xfed30800 : no IRT entry for slot 15, pin 1
>> iosapic: no IRTE for 0000:00:0f.1 (IRQ not connected?)
>> Elroy version TR4.0 (0x5) found at 0xfed32000
> 
> Do you have any PCI cards in this machine? Something is badly
> broken in the firmware.

Ok, I was wrong:

I/O MODULE INFORMATION

 
IODC IODC
Path         Decimal     Type                  Location   HVER SVER 
Vers Dep
------------ ----------- --------------------- ---------- ---- ---- 
---- ----
PCI1         10/0/1/0    SCSI                  slot 1     0070 a300 
0x00 0x00
LAN          10/0/12/0   Ethernet              built-in   0040 a200 
0x02 0x00
AUDIO        10/0/13/0   Audio                 built-in
IDE          10/0/14/0   IDE                   built-in   0040 a300 
0x00 0x00
SUPERIO MISC 10/0/14/1   Bridge Device         built-in
SERIAL_1     10/0/14/1/1 RS232 Port            built-in   0040 8c00 
0x01 0x00
SERIAL_2     10/0/14/1/2 RS232 Port            built-in   0040 8c00 
0x01 0x00
PARALLEL     10/0/14/1/3 Parallel Port         built-in
USB          10/0/14/2   USB                   built-in   0040 a900 
0x98 0x00
SCSI         10/0/15/0   SCSI                  built-in   0040 a300 
0x00 0x00
FWSCSI       10/0/15/1   SCSI                  built-in   0040 a300 
0x00 0x00
PCI2         10/2/2/0    SCSI                  slot 2     0070 a300 
0x00 0x00
GRAPHICS(7)  10/6/7/0    HPA4982A              slot 7     0070 8500 
0x01 0x00

There were 2 A4976A PCI Fast Wide Differential SCSI Adapter installed 
(PCI1 and PCI2). I pulled both cards and the system boots fine.

Mike


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

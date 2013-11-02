From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Short notice: ipmi_si kills C8000
Date: Sat, 2 Nov 2013 12:18:33 -0400
Message-ID: <BLU0-SMTP6E3477044B0CC6EBE850B97F40@phx.gbl>
References: <2698496.oieJ4Vatqf@caliban.sf-tec.de> <20131026191720.5282c0c3@marga.jer-c2.orkz.net> <20131028105612.GB19852@alpha.franken.de> <20131029093706.GA6255@alpha.franken.de> <236d3862441c13623a9fde73e6988591@sf-mail.de> <20131029164151.GA10616@alpha.franken.de>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Rolf Eike Beer <eike-kernel@sf-tec.de>,
	linux-parisc@vger.kernel.org
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20131029164151.GA10616@alpha.franken.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 29-Oct-13, at 12:41 PM, Thomas Bogendoerfer wrote:

> I've played only with ipmitool, which gives something like
>
> c8000:~# ipmitool sdr
> Systemboard      | 30 degrees C      | ok
> CPU 1            | 43 degrees C      | ok
> Ambient          | 24.50 degrees C   | ok

I played with IPMI a bit on rp3440.  It works to a degree but so far I  
haven't been able
to get it to show sensor data:

mx3210:/boot# ipmitool mc info
Device ID                 : 50
Device Revision           : 1
Firmware Revision         : 3.52
IPMI Version              : 1.0
Manufacturer ID           : 11
Manufacturer Name         : Hewlett-Packard
Product ID                : 33281 (0x8201)
Product Name              : Unknown (0x8201)
Device Available          : yes
Provides Device SDRs      : yes
Additional Device Support :
     Sensor Device
     SDR Repository Device
     SEL Device
     FRU Inventory Device
     IPMB Event Receiver
     IPMB Event Generator
mx3210:/boot# ipmitool sdr info
SDR Version                         : 0x1
Record Count                        : 92
Free Space                          : 12336 bytes
Most recent Addition                :
Most recent Erase                   :
SDR overflow                        : no
SDR Repository Update Support       : unspecified
Delete SDR supported                : no
Partial Add SDR supported           : no
Reserve SDR repository supported    : yes
SDR Repository Alloc info supported : yes
mx3210:/boot# ipmitool -v sdr list
Running Get PICMG Properties my_addr 0x20, transit 0, target 0
Error Response 0xc2 from Get PICMG Properities
No PICMG Extenstion discovered
Sensor ID              : Chassis Intrus (0x1)
  Entity ID             : 23.1 (System Chassis)
  Sensor Type (Discrete): Physical Security (0x05)
  Sensor Reading        : No Reading
  Event Message Control : Per-threshold
  OEM                   : 0

Get SDR 5000 command failed: Timeout
Get SDR 5000 command failed: Timeout
Get SDR 5000 command failed: Timeout
Get SDR 5000 command failed: Timeout
Get SDR 5000 command failed: Timeout
mx3210:/boot# ipmitool sdr type Temperature
Ambient Temp     | D8h | ns  | 23.1 | No Reading
Processor 0 Temp | D9h | ns  |  3.1 | No Reading
Processor 1 Temp | DAh | ns  |  3.2 | No Reading
mx3210:/boot# ipmitool  fru print
FRU Device Description : Builtin FRU Device (ID 0)
  Chassis Type          : Rack Mount Chassis
  Board Mfg Date        : Mon May 24 14:50:00 2004
  Board Mfg             : JABIL
  Board Product         : rp3440 SYSTEM BOARD
  Board Serial          : 52JAPE4422169260
  Board Part Number     : A7136-60001
  Board Extra           : A1
  Board Extra           : 4419
  Board Extra           : D
  Board Extra           : 00000000000000000000000000000000
  Product Manufacturer  : hp
  Product Extra         : 09010000

FRU Device Description : I/O Backplane (ID 5)
  Device not present (Timeout)

Get SDR 300d command failed: Timeout
Get SDR 300d command failed: Timeout
Get SDR 300d command failed: Timeout
Get SDR 300d command failed: Timeout
Get SDR 300d command failed: Timeout
mx3210:/boot# ipmitool -V
ipmitool version 1.8.13

Thoughts?

Dave

--
John David Anglin	dave.anglin@bell.net




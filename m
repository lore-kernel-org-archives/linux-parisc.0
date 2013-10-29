From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: Short notice: ipmi_si kills C8000
Date: Tue, 29 Oct 2013 17:41:51 +0100
Message-ID: <20131029164151.GA10616@alpha.franken.de>
References: <2698496.oieJ4Vatqf@caliban.sf-tec.de>
 <20131026191720.5282c0c3@marga.jer-c2.orkz.net>
 <20131028105612.GB19852@alpha.franken.de>
 <20131029093706.GA6255@alpha.franken.de>
 <236d3862441c13623a9fde73e6988591@sf-mail.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <236d3862441c13623a9fde73e6988591@sf-mail.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Oct 29, 2013 at 11:41:08AM +0100, Rolf Eike Beer wrote:
> Oops, sorry, I misread the git log. I've now applied that patch to

no problem, maybe it's worth to send the fix to stable now it's
in 3.12

> 3.11.6 and the module loads fine. Am I supposed to see anything in
> the sysfs that I can query now?

I've played only with ipmitool, which gives something like

c8000:~# ipmitool sdr
Systemboard      | 30 degrees C      | ok
CPU 1            | 43 degrees C      | ok
Ambient          | 24.50 degrees C   | ok
Main +12V        | 12.25 Volts       | ok
Main -12V        | -12.45 Volts      | ok
Main +5V         | 5.00 Volts        | ok
Main 3.3V        | 3.35 Volts        | ok
Battery +3V      | 3.11 Volts        | ok
Stdby +3.3V      | 3.40 Volts        | ok
Main +1.5V       | 1.49 Volts        | ok
VTT              | 1.19 Volts        | ok
Main +1.8V       | 1.80 Volts        | ok
FAN1 SYS         | 6360 RPM          | ok
FAN2 SYS         | 6240 RPM          | ok
FAN3 SYS         | 6000 RPM          | ok
FAN4 SYS         | 6240 RPM          | ok
FAN5 SYS         | 5880 RPM          | ok
FAN1 PSU         | 2400 RPM          | ok
FAN2 PSU         | 2400 RPM          | ok
SEL Level        | 0 unspecified     | ok
CPU 1            | 0x80              | ok
PSU              | Not Readable      | ns
PS1              | 0x02              | ok
FAN1 SYS         | 0x01              | ok
FAN2 SYS         | 0x01              | ok
FAN3 SYS         | 0x01              | ok
FAN4 SYS         | 0x01              | ok
FAN5 SYS         | 0x01              | ok
FAN1 PSU         | 0x01              | ok
FAN2 PSU         | 0x01              | ok
Watchdog         | 0x00              | ok
iRMC request     | 0x00              | ok
System Mgmt SW   | Not Readable      | ns
local Mon.       | 0x02              | ok
Pwr Btn override | 0x01              | ok
Software NMI     | 0x00              | ok
System BIOS      | Not Readable      | ns
iRMC             | Not Readable      | ns


Thomas.


-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

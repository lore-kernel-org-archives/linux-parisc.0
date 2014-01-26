From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [C8000] serial console drops input
Date: Sun, 26 Jan 2014 16:01:53 -0500
Message-ID: <BLU0-SMTP67B7E8904072C1DACCE37597A30@phx.gbl>
References: <20140125054144.4ccfde5e@marga.jer-c2.orkz.net> <1417398.fmUESL4Ngr@eto> <BLU0-SMTP1495AAE1C79CFA59BC915E97A00@phx.gbl> <7905648.nun1s37FKj@eto> <20140125181348.67a2bf8f@marga.jer-c2.orkz.net> <BLU0-SMTP313201DB46978BF91A10FE97A00@phx.gbl> <20140126010218.33334dbd@marga.jer-c2.orkz.net> <52E524A6.2060703@gmx.de> <20140126212225.0c6e88f9@marga.jer-c2.orkz.net>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>,
	Rolf Eike Beer <eike-kernel@sf-tec.de>
To: Jeroen Roovers <jer@gentoo.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20140126212225.0c6e88f9@marga.jer-c2.orkz.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 26-Jan-14, at 3:22 PM, Jeroen Roovers wrote:

> Do serial cables deteriorate over time? :-)

Not much although the soldered/crimped connections could break.  More  
of an issue is the
drivers.  Many boards use +3.3V devices such as the MAX3232.  These  
don't put out as much voltage
on the cable as standard RS232 drivers.  So, they can't drive as much  
cable as a fully standard device.
Secondly, the driver chips are sensitive to ESD damage (particularly  
receiver).  So, they could
get zapped, particularly if devices are connected while running when a  
connection is made.
Currents can also flow through the cable when the grounds for the two  
pieces of equipment
is the same.  There is no isolation in RS232 so it is sensitive to ESD  
problem.  There is an 'E'
version of most RS232 driver devices which has improved (+15KV human  
body) ESD protection.

I've seen quite a few devices die in the lab.  The charge pump on  
these devices is also sometimes
a problem.

Without a scope, it's hard to tell when the signals are bad.  Best  
that can be done is to test both
units with third device using same/different cables, etc.

Dave
--
John David Anglin	dave.anglin@bell.net




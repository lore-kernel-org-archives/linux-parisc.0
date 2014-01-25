From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [C8000] serial console drops input
Date: Sat, 25 Jan 2014 15:13:47 -0500
Message-ID: <BLU0-SMTP313201DB46978BF91A10FE97A00@phx.gbl>
References: <20140125054144.4ccfde5e@marga.jer-c2.orkz.net> <1417398.fmUESL4Ngr@eto> <BLU0-SMTP1495AAE1C79CFA59BC915E97A00@phx.gbl> <7905648.nun1s37FKj@eto> <20140125181348.67a2bf8f@marga.jer-c2.orkz.net>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: linux-parisc@vger.kernel.org,
	Rolf Eike Beer <eike-kernel@sf-tec.de>
To: Jeroen Roovers <jer@gentoo.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20140125181348.67a2bf8f@marga.jer-c2.orkz.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 25-Jan-14, at 12:13 PM, Jeroen Roovers wrote:

> On Sat, 25 Jan 2014 18:03:17 +0100
> Rolf Eike Beer <eike-kernel@sf-tec.de> wrote:
>
>> Boot output looks fine. Cables are normal nullmodem. I can interact
>> using minicom with the firmware, i.e. typing "BO
>> PRI<return>N<return>" or things like that work fine.
>
> Yes, in the PDC everything still seems fine.
>
> But as early as in the IPL I can't paste a string without
> characters dropping (which is how I first noticed the issue, since
> that's where I normally do this to select a kernel to boot). So did  
> the
> IPL change as well, then?


Helge has made some changes to palo but I believe that we are on the  
PDC boot
console (ttyB0) until switch over here:

Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
17: ttyS0 at MMIO 0xfffffff0f05e0800 (irq = 75, base_baud = 115200) is  
a 16550A
console [ttyS0] enabled, bootconsole disabled
console [ttyS0] enabled, bootconsole disabled
18: ttyS1 at MMIO 0xfffffff0f05e2800 (irq = 76, base_baud = 115200) is  
a 16550A

The PDC code is in firmware.

How long is your cable?    There's no shield connection on DB9  
connector.  You just
need to cross transmit and receive data.  Signal ground is straight  
through.

Dave L is correct about USB keyboard and mouse confusing serial  
console support.

Dave
--
John David Anglin	dave.anglin@bell.net




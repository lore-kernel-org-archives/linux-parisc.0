From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: fix serial ports on C8000 workstation
Date: Sun, 9 Jun 2013 18:21:22 -0400
Message-ID: <BLU0-SMTP43B2DEB0FF4F94FB003F16979B0@phx.gbl>
References: <20130609210021.GA1009@p100.box> <3684361.ciEK0E58Qm@donald.sf-tec.de>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <3684361.ciEK0E58Qm@donald.sf-tec.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 9-Jun-13, at 5:49 PM, Rolf Eike Beer wrote:

>> 	/* 7.272727MHz on Lasi.  Assumed the same for Dino, Wax and Timi. */
>> -	uart.port.uartclk	= 7272727;
>> +	uart.port.uartclk	= (dev->id.sversion != 0xad) ?
>> +					7272727 : 1843200;
>
> If there is a nice comment explaining 72 another nice comment for  
> the other
> number should be added.

1.8432 MHz is a common oscillator frequency for UARTs.  See for example,
http://en.wikipedia.org/wiki/Crystal_oscillator_frequencies

Dave
--
John David Anglin	dave.anglin@bell.net




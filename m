From: Jeroen Roovers <jer@gentoo.org>
Subject: Re: [C8000] serial console drops input
Date: Sun, 26 Jan 2014 21:22:25 +0100
Message-ID: <20140126212225.0c6e88f9@marga.jer-c2.orkz.net>
References: <20140125054144.4ccfde5e@marga.jer-c2.orkz.net>
	<1417398.fmUESL4Ngr@eto>
	<BLU0-SMTP1495AAE1C79CFA59BC915E97A00@phx.gbl>
	<7905648.nun1s37FKj@eto>
	<20140125181348.67a2bf8f@marga.jer-c2.orkz.net>
	<BLU0-SMTP313201DB46978BF91A10FE97A00@phx.gbl>
	<20140126010218.33334dbd@marga.jer-c2.orkz.net>
	<52E524A6.2060703@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Helge Deller <deller@gmx.de>,
	John David Anglin <dave.anglin@bell.net>,
	Rolf Eike Beer <eike-kernel@sf-tec.de>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <52E524A6.2060703@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 26 Jan 2014 16:07:18 +0100
Helge Deller <deller@gmx.de> wrote:

> I'm pretty sure that I didn't changed anything in palo which is
> PDC-console related and which would explain why you have such
> problems. If there is a problem, then it might be because of kernel
> and/or cable.

Yes, that seems to be the case. I initially assumed something might
actually reconfigure the serial port in the IPL, but I can't find any
evidence in support.

I think I am seeing two problems:

1) Pasting strings doesn't work on either the PDC console or the
   IPL/Linux console.

2) Whereas typing on the PDC console works fine, even at some speed,
   the same is not true for the IPL/Linux console, which lose many
   characters along the way, and act as if the connection is
   temporarily lost. Switching the client side terminal program
   (I tested with minicom, picocom, screen) makes no difference.

Do serial cables deteriorate over time? :-)


Regards,
     jer

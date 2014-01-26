From: Jeroen Roovers <jer@gentoo.org>
Subject: Re: [C8000] serial console drops input
Date: Sun, 26 Jan 2014 01:02:18 +0100
Message-ID: <20140126010218.33334dbd@marga.jer-c2.orkz.net>
References: <20140125054144.4ccfde5e@marga.jer-c2.orkz.net>
	<1417398.fmUESL4Ngr@eto>
	<BLU0-SMTP1495AAE1C79CFA59BC915E97A00@phx.gbl>
	<7905648.nun1s37FKj@eto>
	<20140125181348.67a2bf8f@marga.jer-c2.orkz.net>
	<BLU0-SMTP313201DB46978BF91A10FE97A00@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: John David Anglin <dave.anglin@bell.net>,
	Rolf Eike Beer <eike-kernel@sf-tec.de>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP313201DB46978BF91A10FE97A00@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 25 Jan 2014 15:13:47 -0500
John David Anglin <dave.anglin@bell.net> wrote:

> Helge has made some changes to palo but I believe that we are on the  
> PDC boot
> console (ttyB0) until switch over here:

This.

> How long is your cable?    There's no shield connection on DB9  
> connector.  You just
> need to cross transmit and receive data.  Signal ground is straight  
> through.
> 
> Dave L is correct about USB keyboard and mouse confusing serial  
> console support.

Yes, but _all_ of that is entirely immaterial as the same hardware
worked fine for more than one and a half years, _until_ the changes to
palo/PDC console support were introduced.

I could easily revert the IPL to the former working version (1.18) and
see if that fixes the issue during boot. I'll report back with some
results.

From: Jeroen Roovers <jer@gentoo.org>
Subject: Re: [C8000] serial console drops input
Date: Sat, 25 Jan 2014 18:13:48 +0100
Message-ID: <20140125181348.67a2bf8f@marga.jer-c2.orkz.net>
References: <20140125054144.4ccfde5e@marga.jer-c2.orkz.net>
	<1417398.fmUESL4Ngr@eto>
	<BLU0-SMTP1495AAE1C79CFA59BC915E97A00@phx.gbl>
	<7905648.nun1s37FKj@eto>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Rolf Eike Beer <eike-kernel@sf-tec.de>,
	John David Anglin <dave.anglin@bell.net>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <7905648.nun1s37FKj@eto>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 25 Jan 2014 18:03:17 +0100
Rolf Eike Beer <eike-kernel@sf-tec.de> wrote:

> Boot output looks fine. Cables are normal nullmodem. I can interact
> using minicom with the firmware, i.e. typing "BO
> PRI<return>N<return>" or things like that work fine.

Yes, in the PDC everything still seems fine.

But as early as in the IPL I can't paste a string without
characters dropping (which is how I first noticed the issue, since
that's where I normally do this to select a kernel to boot). So did the
IPL change as well, then?



     jer

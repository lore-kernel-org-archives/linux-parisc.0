Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Wed, 15 Jan 2003 19:11:11 -0700
To: Nahkola Mikko <mnahkola@trinms01.ntc.nokia.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Interesting network card ...
Message-ID: <20030116021111.GD8543@dsl2.external.hp.com>
References: <20030115085619.GA17760@aurinko.ntc.nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030115085619.GA17760@aurinko.ntc.nokia.com>
From: grundler@dsl2.external.hp.com (Grant Grundler)
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Wed, Jan 15, 2003 at 10:56:20AM +0200, Nahkola Mikko wrote:
> What's the deal with the various HP-branded tulip-based NICs? Are they 
> expected to "just work" or what?

yes.

> I found one that sure doesn't, but then 
> again, but my kernel isn't actually new ... (2.4.18-32 packaged)

...a newer kernel would be more interesting.

> The card is the HP ANA-6911A/AUI (yes, it's a 10/100BT with coax and 
> AUI too), part# A3738-60001, and it _is_ found by the tulip driver, but 
> for some reason the driver claims that "no MII transceiver found",

This does sound like a bug (fixed) in the tulip driver relating to
MII initialization. But I'm surprised to see it manifest on a C240.

One should be aware that HP sold 4 different flavors of single port
100BT cards based on tulip chipsets. IIRC, they were:
o PCI "server" 
o GSC (card-mode Dino)
o PCI "workstation"
o PCI V-class only

(and an NIO 100BT also that I don't know anything about).

And each had a different HP-UX driver to go with it (btlan3-6).
Eventually all 4 drivers were merged into one but that's still fairly
recent history.

grant

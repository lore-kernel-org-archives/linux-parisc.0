Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Armijn Hemel <armijn@nl.linux.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] installing on b2600 fails 
In-Reply-To: Message from Armijn Hemel <armijn@nl.linux.org>
   of "Tue, 21 May 2002 17:53:28 +0200." <20020521175328.A2442@humbolt.geo.uu.nl>
References: <Pine.A41.4.44.0205211630470.17882-100000@stalin.acc.umu.se> <maswan@acc.umu.se> <20020521154508.99536482A@dsl2.external.hp.com>  <20020521175328.A2442@humbolt.geo.uu.nl> 
Date: Tue, 21 May 2002 12:05:53 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020521180553.5470F482A@dsl2.external.hp.com>
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

[ back on-list ]

Armijn Hemel wrote:
> Just burn them? How should I boot then? The b2600 doesn't have a floppy
> drive. Don't I need PALO on the CD?

yes. CD or LAN. The lifimage has palo and vmlinux embedded in it,
parisc firmware can boot a lifimage from LAN, tape, CD or HD.
Any IO device the box has IODC for.

"boot floppies" is a gross misnomer for parisc since that's
probably the only media I've never tried to boot from.
I don't know off hand which platforms support booting from floppy.
I would guess 712 and similar vintage supports that if the
lifimage could fit on a 1.44MB floppy.

> Or do you mean I should just put
> the floppy images on a server somewhere and boot those from the network?

booting from a network is an option too.

> I'm quite desperate to be honest (and I think it shows). The machines I
> have have to be returned to HP in .nl soon (they're from the demo pool,
> trying to port yet another distro (ROCK Linux) to HPPA).

cool - keep the p-l mailing list posted on your progress.

grant

> 
> armijn
> 
> -- 
>  ---------------------------------------------------------------------------
>    armijn@nl.linux.org | http://people.nl.linux.org/~armijn/ | Penguin Power
>  ---------------------------------------------------------------------------
>                  http://nl.linux.org/ | Alles over Linux
>  ---------------------------------------------------------------------------

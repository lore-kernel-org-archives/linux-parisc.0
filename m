Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Joel Soete <joel.soete@freebel.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] installing on b2600 fails 
In-Reply-To: Message from Joel Soete <joel.soete@freebel.net>
   of "Thu, 23 May 2002 18:19:56 -0000." <3CED32CC.2030500@freebel.net>
References: <20020517130527.J32014@humbolt.geo.uu.nl> <armijn@nl.linux.org> <20020517152054.4F2CE482A@dsl2.external.hp.com> <20020517172600.I29738@humbolt.geo.uu.nl> <armijn@nl.linux.org> <20020517154923.47C7E4838@dsl2.external.hp.com> <20020521155220.A28518@humbolt.geo.uu.nl> <20020523063531.GH3471@sleepie.demon.co.uk> <20020523110227.B10015@humbolt.geo.uu.nl>  <3CED32CC.2030500@freebel.net> 
Date: Fri, 24 May 2002 01:11:09 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020524071109.4EB53482A@dsl2.external.hp.com>
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

Joel Soete wrote:
> AFAIK you should prefer to install from a serial console

Good idea. Then update the kernel. That's not optional.
You might have to wait until Richard has spun a newer boot floppies lifimage.

> (anyway, i am not sure that usb keyboard and mouse are already supported?).

Yes. USB works.

I'm using a C3000 at home now with 1600x1200 on PCI Vis-EG card.
I think the FX gfx that's built-into the B2600 isn't supported.
I was using serial console (minicom on an OB600) until PCI vis-EG
support was working - post 0.9.3 release.

> You should also encounter another problem because the release of palo 
> installed with CD-0.9.3 do not yet support new scsi disk of 9Gb and more.

Could you clarify?
it's not listed in the release errata.
(http://www.parisc-linux.org/release-0.9/errata-093.html)

grant

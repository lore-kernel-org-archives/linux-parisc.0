Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from flaske.stud.ntnu.no (flaske.stud.ntnu.no [129.241.56.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id E0E294829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 30 Sep 2002 19:18:03 -0600 (MDT)
Date: Tue, 1 Oct 2002 03:18:00 +0200
From: Stian Soiland <stain@itea.ntnu.no>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 9000/802/K250 won't boot with images - serial/stack problem?
Message-ID: <20021001011800.GA11383@itea.ntnu.no>
References: <20020930200805.GA9133@itea.ntnu.no> <1033417191.31126.4.camel@beavis> <20020930204559.GB9133@itea.ntnu.no> <3D98D2B9.659E5A0B@gmx.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <3D98D2B9.659E5A0B@gmx.at>
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

On 2002-10-01 00:39:53, Christoph Plattner wrote:

> As far as I see the problem: YES, you must use the
> serial porton the MDP (port 0 !). Or use the PDC console
> instead of MUX driver, then you are on the safe side,
> concerning the console connecting method. The PDC
> conolse driver takes that interface, which is configured
> in the PDC monitor as console, independent of device
> type, chips, ports, etc...

Luckily - with the -PDC-images and ttyB0 everything worked out
perfectly, the kernel found all my disks, my network card,
it is now "Installing base packages..." - so I go home to eat dinner
and connect with ssh to the serial terminal server to watch for further
progress :=3D)

Well.. I delayed the dinner, and now the box is perfect :)
Brilliant work, everyone! I really had no idea it would
work that smooth.

  http://beist.ntnu.nu/

--=20
Stian S=F8iland               Det er ikke for lurt =E5 pr=F8ve noe nytt n=
=E5r man
ITEA systemdrift            egentlig er for sliten til =E5 spise is. [Hauge=
n]
http://www.stud.ntnu.no/   =20
                           =20

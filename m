Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dhcp23.swansea.linux.org.uk (cpc1-cwma1-5-0-cust4.swan.cable.ntl.com [80.5.120.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5266F48F6
	for <parisc-linux@lists.parisc-linux.org>; Wed,  8 Oct 2003 15:40:25 -0600 (MDT)
Received: from dhcp23.swansea.linux.org.uk (localhost.localdomain [127.0.0.1])
	by dhcp23.swansea.linux.org.uk (8.12.10/8.12.10) with ESMTP id h98LcImr011014;
	Wed, 8 Oct 2003 22:38:18 +0100
Received: (from alan@localhost)
	by dhcp23.swansea.linux.org.uk (8.12.10/8.12.10/Submit) id h98LcH3O011012;
	Wed, 8 Oct 2003 22:38:17 +0100
Subject: Re: [parisc-linux] A3591B (Tachyon) FC Card
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: "Padgett, Pat M [NTWK SVCS]" <PatPadgett@NMCC.SprintSpectrum.com>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <1289146742B56546AE580DFC6B711A8313482D@PKDWB07C.ad.sprint.com>
References: <1289146742B56546AE580DFC6B711A8313482D@PKDWB07C.ad.sprint.com>
Content-Type: text/plain
Message-Id: <1065649096.10567.11.camel@dhcp23.swansea.linux.org.uk>
Mime-Version: 1.0
Date: Wed, 08 Oct 2003 22:38:17 +0100
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

On Mer, 2003-10-08 at 15:28, Padgett, Pat M [NTWK SVCS] wrote:
> I haven't been able to find ANY documentation on this particular card
> (not counting the installation manual).  Does anyone else have docs for
> this card or the Tachyon(?) chipset it uses??

If I remember rightly tachyon is one of the FC chipsets where you have
to implement a *lot* of higher level FC handling yourself. As to using
the compaqfc code I wish you luck, but if you do clean it up so it is
understandable and sumbit the cleanups that will in itself be a good
deed for the year 8)

> I guess the icing on the cake is the fact that I don't have ANY
> experience writing device drivers. 

FC is not the place to start. The specifications are complex, frequently
bear no relation to the real world and you have a lot more to handle
than the scsi layer itself will look after.

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from wilson.mkp.net (rover.mkp.net [209.217.122.9])
	by dsl2.external.hp.com (Postfix) with ESMTP id A71B848F6
	for <parisc-linux@lists.parisc-linux.org>; Wed,  8 Oct 2003 16:06:04 -0600 (MDT)
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: "Padgett, Pat M [NTWK SVCS]" <PatPadgett@NMCC.SprintSpectrum.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] A3591B (Tachyon) FC Card
From: "Martin K. Petersen" <mkp@mkp.net>
References: <1289146742B56546AE580DFC6B711A8313482D@PKDWB07C.ad.sprint.com>
	<1065649096.10567.11.camel@dhcp23.swansea.linux.org.uk>
Date: 08 Oct 2003 18:05:56 -0400
In-Reply-To: <1065649096.10567.11.camel@dhcp23.swansea.linux.org.uk>
Message-ID: <yq1llrv5qrf.fsf@wilson.mkp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

>>>>> "Alan" == Alan Cox <alan@lxorguk.ukuu.org.uk> writes:

Alan> If I remember rightly tachyon is one of the FC chipsets where
Alan> you have to implement a *lot* of higher level FC handling
Alan> yourself. 

That's true only for the really old tachyon chips.  The TS and TL
chips supported by the Compaq driver as well as the XL2 are all recent
enough to have a fibre channel state machine on chip.

-- 
Martin K. Petersen      http://mkp.net/

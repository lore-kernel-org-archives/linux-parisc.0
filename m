Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mf1.bredband.net (mf1.lab.bredband.com [195.54.122.119])
	by dsl2.external.hp.com (Postfix) with ESMTP id B9B0C482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  7 Jan 2002 16:35:56 -0700 (MST)
Date: Tue, 8 Jan 2002 00:34:33 +0100
From: Daniel Engstrom <5116@telia.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Christian Suder <csuder@cisco.com>, sven.cronenberg@web.de,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PALinux on HP9000/735-125
Message-ID: <20020108003433.A13855@zaphod.halden.lillfab.se>
References: <3C388C82.6070509@web.de> <20020106201346.A14927@solo.franken.de> <20020106133432.08684bb1.csuder@cisco.com> <20020106232908.B19425@solo.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
In-Reply-To: <20020106232908.B19425@solo.franken.de>; from tsbogend@alpha.franken.de on Sun, Jan 06, 2002 at 23:29:08 +0100
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

On 2002.01.06 23:29 Thomas Bogendoerfer wrote:
> but that's not enough. I did that and setup the [EISA-] card with HPUX, but
> it's still unconfigured, when Linux finds it. 

I think that the PDC only initialize a card that is used for booting. I also
think that Matthew Wilcox had a HP 100MB Ethernet interface up and running a 
while ago. (The PDC might have initialzed that board when it searched for boot
devices.)
Another problem with EISA boards currently, is that most of them are bus-masters
and the current EISA support lacks the busmatering and DMA bits.

> The .cfg describes how to
> configure the different card parameters, eisa_config puts the selected
> params to a nvram, and some other part does the real card poking
> during kernel startup. Other platforms have that card poking stuff
> included into the firmware.

I have started an eeprom driver a while ago, and I started to try to decode the 
EISA parts of the EEPROM. I have about half of it figured out I think, but the
other half seems to be somewhat hard.

I looked a doing a parser for the CFG files, but it turns out that there are a
lot of options and stuff. Even binary code overlays that are supposed to be
loaded and executed by the ECU (EISA configuration utility) exists. Adaptec 
uses one for the AHA-274x. Not suppoered by HPUX, though.

/Daneil

-- 

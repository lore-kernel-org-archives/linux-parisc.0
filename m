Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (pD951C978.dip.t-dialin.net [217.81.201.120])
	by dsl2.external.hp.com (Postfix) with ESMTP id DB49B482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  7 Jan 2002 18:14:10 -0700 (MST)
Date: Tue, 8 Jan 2002 02:11:12 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Daniel Engstrom <5116@telia.com>
Cc: Christian Suder <csuder@cisco.com>, sven.cronenberg@web.de,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PALinux on HP9000/735-125
Message-ID: <20020108021112.A15052@solo.franken.de>
References: <3C388C82.6070509@web.de> <20020106201346.A14927@solo.franken.de> <20020106133432.08684bb1.csuder@cisco.com> <20020106232908.B19425@solo.franken.de> <20020108003433.A13855@zaphod.halden.lillfab.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020108003433.A13855@zaphod.halden.lillfab.se>; from 5116@telia.com on Tue, Jan 08, 2002 at 12:34:33AM +0100
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

On Tue, Jan 08, 2002 at 12:34:33AM +0100, Daniel Engstrom wrote:
> I think that the PDC only initialize a card that is used for booting. I also
> think that Matthew Wilcox had a HP 100MB Ethernet interface up and running a 
> while ago. (The PDC might have initialzed that board when it searched for boot
> devices.)

hmm, I had a quick glance over the hp100.c and it looks like the driver
does the eisa config itself. So that would explain why it worked.

> Another problem with EISA boards currently, is that most of them are
>  bus-masters and the current EISA support lacks the busmatering and DMA bits.

that's why I was looking into the problem. I wanted to improve EISA support.

> I have started an eeprom driver a while ago, and I started to try to decode
> the EISA parts of the EEPROM. I have about half of it figured out I think,
> but the other half seems to be somewhat hard.

that's a start. Do you have a patch for your eeprom driver somewhere ?

> I looked a doing a parser for the CFG files, but it turns out that there are a
> lot of options and stuff. Even binary code overlays that are supposed to be
> loaded and executed by the ECU (EISA configuration utility) exists. Adaptec 
> uses one for the AHA-274x. Not suppoered by HPUX, though.

I saw that overlay thing also for the AHA-1742. I just removed it from the
.cfg to get eisa_config running with it.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]

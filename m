Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sj-msg-core-2.cisco.com (sj-msg-core-2.cisco.com [171.69.24.11])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4512C482E
	for <parisc-linux@lists.parisc-linux.org>; Sun,  6 Jan 2002 14:34:36 -0700 (MST)
Date: Sun, 6 Jan 2002 13:34:32 -0800
From: Christian Suder <csuder@cisco.com>
To: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: sven.cronenberg@web.de, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PALinux on HP9000/735-125
Message-Id: <20020106133432.08684bb1.csuder@cisco.com>
In-Reply-To: <20020106201346.A14927@solo.franken.de>
References: <3C388C82.6070509@web.de>
	<20020106201346.A14927@solo.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> 
> > - has someone been able to make the 100mbit EISA-ethernet-card 3c597
work> >   in the HP9000/735 under Linux?
> 
> IMHO no EISA card will work at the moment. During the weekend I tried
> to get an Adapatec 1742 card going in my B132, and the problem is,
> that the pdc doesn't initialize EISA cards. Looks like that is done
> by HPUX. So before any EISA cards will work, we need something like 
> that for Linux, too.
> 

I was trying to get EISA cards working a while ago. The basic problem is,
as Thomas indicated, that the EISA cards need to be configured by a
configuration utility before you can use them. HPUX has a utility called
eisa_config, but there is no equivalent in Linux. Seems all other EISA
platforms (i386, alpha, mips) can be configured by booting a diskette, so
nobody bothered with a linux version yet. 

I think it should work to boot HPUX, get the correct EISA .cfg file and
use the eisa_config utility. The configuration is actually stored in an
eeprom, so it's not tied to the OS. I can't test this though as the only
HPUX CDs I have are too old for the machine.

Another option may be to run the utility on Linux, tried that once but it
complained it could not access /dev/eeprom. A bit scary too, if something
goes wrong one could end up with a corrupt eeprom.... 

	Christian 

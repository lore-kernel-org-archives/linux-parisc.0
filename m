Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dc-mx13.cluster1.charter.net (dc-mx13.cluster1.charter.net [209.225.8.23])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8EA2C4830
	for <parisc-linux@lists.parisc-linux.org>; Sun, 18 Aug 2002 09:54:20 -0600 (MDT)
Message-ID: <3D5FC35F.7060402@charter.net>
Date: Sun, 18 Aug 2002 11:55:11 -0400
From: "B. Douglas Hilton" <bdhilton@charter.net>
MIME-Version: 1.0
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org, saw@saw.sw.com.sg
Subject: Re: [parisc-linux] PCI Intel EtherExpressPro100 strangeness on C200
 machine.
References: <3D5EB2D6.9090403@charter.net>  <20020817223713.GA25852@gate450.dyndns.org> <20020818051633.209BD4829@dsl2.external.hp.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Here is my dmesg output that your requested, and my
ifconfig status right after booting. I typed this in
by hand, hopefully no typos.


eepro100.c:v1.09j-t 9/29/99 Donald Becker http://www.scyld.com/network/eepro100.html
eepro100.c: $Revision: 1.36 $ 2000/11/17 Modified by Andrey V. Savochkin <saw@saw.sw.com.sg> and others
eth0: Intel Corp. 82557 [Ethernet Pro 100], 00:90:27:60:CB:E6, IRQ 130.
   Board assembly 721383-006, Physical connectors present: RJ45
   Primary interface chip i82555 PHY #1.
   General self-test: passed.
   Serial sub-system self-test: passed.
   Internal registers self-test: passed.
   ROM checksum self-test: passed (0x8b51f404).


eth0    Link encap:Ethernet  HWaddr:00:90:27:60:CB:E6
         inet addr:192.168.100.115  Bcast:192.168.100.255  Mask:255.255.255.0
         RX packets:25 errors:0 dropped:0 overruns:0 frame:0
         TX packets:9 errors:0 dropped:0 overruns:0 carrier:0
         collisions:0 txqueuelen:100
         RX bytes:2668 (2.6 KiB)  TX bytes:558 (558.0 b)
         Interrupt:130 Base address:0xf000



Well, I'm heading out to camp. Back on Monday.

Cheers!
- Doug




Grant Grundler wrote:
> Andreas Seltenreich wrote:
> 
>>just append " || defined(__hppa__)" to line 47 of drivers/net/eepro100.c
>>I got mine working that way.
> 
> 
> The RX_ALIGN shouldn't strictly be needed. It's a performance improvement.
> It means the misaligned access handling isn't working right. And should be
> spewing something to the kernel dmesg buf. IIRC, Randolph Chung has done a
> great job on getting most of the misaligned access emulation working right.
> If you get console/dmesg output when using eepro100, please post it here.
> 
> If someone with CVS access has time, please enable the RX_ALIGN
> code for __hppa__ as well. I have other changes outstanding (cpqfc)
> that I want to finished up and committed first.
> 
> grant
> 

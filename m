Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "B. Douglas Hilton" <bdhilton@charter.net>,
	parisc-linux@lists.parisc-linux.org, saw@saw.sw.com.sg
Subject: Re: [parisc-linux] PCI Intel EtherExpressPro100 strangeness on C200 machine. 
In-Reply-To: Message from Andreas Seltenreich <s_selten@informatik.uni-karlsruhe.de>
   of "Sun, 18 Aug 2002 00:37:15 +0200." <20020817223713.GA25852@gate450.dyndns.org>
References: <3D5EB2D6.9090403@charter.net>  <20020817223713.GA25852@gate450.dyndns.org> 
Date: Sat, 17 Aug 2002 23:16:32 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020818051633.209BD4829@dsl2.external.hp.com>
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

Andreas Seltenreich wrote:
> just append " || defined(__hppa__)" to line 47 of drivers/net/eepro100.c
> I got mine working that way.

The RX_ALIGN shouldn't strictly be needed. It's a performance improvement.
It means the misaligned access handling isn't working right. And should be
spewing something to the kernel dmesg buf. IIRC, Randolph Chung has done a
great job on getting most of the misaligned access emulation working right.
If you get console/dmesg output when using eepro100, please post it here.

If someone with CVS access has time, please enable the RX_ALIGN
code for __hppa__ as well. I have other changes outstanding (cpqfc)
that I want to finished up and committed first.

grant

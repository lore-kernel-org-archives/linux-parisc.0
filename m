Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo1.tiscali.be [62.235.13.210])
	by dsl2.external.hp.com (Postfix) with ESMTP id BFD734841
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 Oct 2003 12:32:27 -0700 (MST)
Message-ID: <3F9EC44D.6040106@tiscali.be>
Date: Tue, 28 Oct 2003 19:32:29 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Joel Soete <soete.joel@tiscali.be>
Cc: Grant Grundler <grundler@parisc-linux.org>,
	Matthew Wilcox <willy@debian.org>,
	parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] C110 builtin nic slow?
References: <3F98D67D00001BC1@ocpmta3.freegates.net>
In-Reply-To: <3F98D67D00001BC1@ocpmta3.freegates.net>
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

Hi all,

Sorry for this auto-answer but don't see how better follow-up without 
breacking thread?


Joel Soete wrote:
> Grant, Matthew,
> 
> 
> I will check on my own pc (hp cards but don't remember the model)
> 
> hmm I test here with a 3C905B (on an hp vectra) but:
> # ethtool eth0
> Settings for eth0:
> No data available
> 
> ???
> 
> (same results on a b180 with eth0: Digital DS21143 Tulip rev 65 [last kernel
> 2.4.21])
> 
And unfortunately no better results:
[...]
hp100: eth0: Busmaster mode enabled.
hp100: eth0: HP J2585B at 0xe400, IRQ 10, PCI bus, 32k SRAM (rx/tx 75%).
hp100: eth0: Adapter is attached to 10Mb/s network.
[...]

hmm I don't find the second nic in may dmesg (I just know that is also 
an hp but a bit older)?

Anyway:
  # ethtool eth1
Settings for eth1:
No data available
  # ethtool eth0
Settings for eth0:
No data available

Any idea (may be switching the two interfaces: I mean just change 
interfaces)?

Thanks again for your attention,
	Joel

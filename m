Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7B9A7483C
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 24 Mar 2004 10:39:04 -0700 (MST)
Date: Wed, 24 Mar 2004 10:39:03 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Linux only see 2Gb of ram of N4k
Message-ID: <20040324173903.GB32052@colo.lackof.org>
References: <40561EAF00005B43@ocpmta1.freegates.net>
	<40561E71000066FA@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <40561E71000066FA@ocpmta2.freegates.net>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Wed, Mar 24, 2004 at 05:42:06PM +0100, Joel Soete wrote:
...
> And actual results would be:
> <==== return by setup_bootmem() ====>
> pmem_ranges[0].start_pfn = 0.
> pmem_ranges[0].pages = 524288.
> pmem_ranges[1].start_pfn = 1572864.
> 
> Is it much more in accordance to your knowledge?

It's more or less what I was expecting, yes.

> PS: May I risk to play with CONFIG_DISCONTIGMEM?

Isn't this open source? of course you can.

thanks,
grant

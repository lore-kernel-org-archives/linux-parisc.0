Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2B9B74868
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 19 Jan 2004 11:57:20 -0700 (MST)
Date: Mon, 19 Jan 2004 11:57:18 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] init and exit text problem
Message-ID: <20040119185718.GA872@colo.lackof.org>
References: <20040117081720.GA29918@colo.lackof.org>
	<40047B6A000037F2@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <40047B6A000037F2@ocpmta2.freegates.net>
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Mon, Jan 19, 2004 at 12:16:40PM +0100, Joel Soete wrote:
> Grant,
> 
> A great news: your kernel (2.6.1-pa4) boot well on the N4000-55 :)

awesome! thanks for trying it.

> If i well find back your mail and references to this "bridge_ctl" patch otc
> I don't reach to apply Russel's patch like this (against 2.6.1) to test on
> my B2k (which you know don't work yet with pdc_cons). Can you make your "bridge_ctl"
> patch available on ftp.p-l.o?

yes - certainly ftp://ftp.parisc-linux.org/patches/diff-2.6.1-bridge_ctl

> PS: an additional question regarding pdc_cons: in 2.4 there was a device
> driver in devices/char/pdc_console.[ch] which allowing to use ttyB device.
> But in 2.6 there isn't anymore such driver? any idea?

sorry - I don't know.

grant

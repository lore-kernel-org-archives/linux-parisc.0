Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from brain.fop.ns.ca (u135n18.eastlink.ca [24.224.135.18])
	by dsl2.external.hp.com (Postfix) with ESMTP id C57074840
	for <parisc-linux@parisc-linux.org>; Tue, 18 Nov 2003 11:34:51 -0700 (MST)
Date: Tue, 18 Nov 2003 14:34:49 -0400 (AST)
From: Steve Bromwich <lists@fop.ns.ca>
To: Joel Soete <soete.joel@tiscali.be>
Cc: parisc-linux@parisc-linux.org
Subject: RE: [parisc-linux] Processes stuck in D state on 715/100XC with
 2.4.22-pa17
In-Reply-To: <3FB265EC0000392B@ocpmta3.freegates.net>
Message-ID: <Pine.LNX.4.58.0311181432590.11677@brain.fop.ns.ca>
References: <3FB265EC0000392B@ocpmta3.freegates.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Hi Joel,

Just to clarify, this is happening during operation, not bootup. Next time
it happens (probably tomorrow morning) I'll break on serial and try
piminfo - is there anything else useful in there that might be worth
looking at?

I'm using Debian stable, with the 2.2.5-11.5 libc package installed.

Cheers, Steve

On Tue, 18 Nov 2003, Joel Soete wrote:

> Hi Steve,
>
> The toc 'process' don't display anything (excepted may be on lcd). To see
> 'piminfo', you should interupt the boot and collect the 'piminfo' (iirc >
> ser pim).
>
> hth,
>     Joel
>
> PS: btw which glibc is installed on your system?

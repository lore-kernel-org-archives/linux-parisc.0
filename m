Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 267014841
	for <parisc-linux@lists.parisc-linux.org>; Wed, 22 Oct 2003 09:43:46 -0600 (MDT)
Date: Wed, 22 Oct 2003 09:43:44 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Riccardo Mottola <zuse@libero.it>
Cc: parisc <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] SCSI problems
Message-ID: <20031022154344.GA7470@colo.lackof.org>
References: <BBBC0CDE.9A52%zuse@libero.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <BBBC0CDE.9A52%zuse@libero.it>
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

On Wed, Oct 22, 2003 at 10:30:55AM +0200, Riccardo Mottola wrote:
> Since I get absolutely no errors but just a freeze it is
> difficult to know anything further

See http://www.parisc-linux.org/faq/kernelbug-howto.html
You might find an HPMC occurred (which killed serial console)
in the "ser pim" output from PDC "BOOT_ADMIN" prompt.

> One question I have, the kernel says it usees the LASI driver. But the hp
> 720 "cobra" has no LASI chip, but the ASP chip using the NCR 53C700
> controller. Are they compatible?

Yes, mostly. Read LASI documentation to compare chips in your 720
with what's on LASI.

grant

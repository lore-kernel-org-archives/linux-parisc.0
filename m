Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 47492482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 26 Jun 2001 11:39:35 -0600 (MDT)
Message-Id: <200106261738.LAA16490@puffin.external.hp.com>
To: Stan Sieler <sieler@allegro.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HP9000 - 822 - a gift? 
In-Reply-To: Your message of "Mon, 25 Jun 2001 20:21:48 PDT."
             <200106260321.UAA03457@opus.allegro.com>
Date: Tue, 26 Jun 2001 11:38:39 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Stan Sieler wrote:
> > I just was 'gifted' a hp9000 822 with 
> > Am I going to get linux up on this baby or the install
> > hpux?
> 
> Not linux, but HP-UX should work.  I can't recall if 11.00
> will run on it, but certainly earlier versions will.

11.0 might but you can bet it wasn't tested by the core HPUX team.
822 has CIO slots. Officially support for CIO was dropped
in early 10.x timeframe - 10.10 I think. Later versions might still
work but it's a "don't call HP when it fails" kind of thing.

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253

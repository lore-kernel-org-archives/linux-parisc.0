Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.zigoo.net (d108.dhcp212-198-139.noos.fr [212.198.139.108])
	by dsl2.external.hp.com (Postfix) with ESMTP id CE560485E
	for <parisc-linux@lists.parisc-linux.org>; Tue, 19 Aug 2003 04:28:46 -0600 (MDT)
Date: Tue, 19 Aug 2003 12:28:38 +0200
From: Thibaut VARENE <varenet@esiee.fr>
To: "Lev Assinovsky" <LAssinovsky@algorithm.aelita.com>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Help: Need instruction sequence for gdb
 breakpoint
Message-Id: <20030819122838.2b362689.varenet@esiee.fr>
In-Reply-To: <3F6F4712B759A34ABD453A8B39C10D62C4670F@bagman.edm.com>
References: <3F6F4712B759A34ABD453A8B39C10D62C4670F@bagman.edm.com>
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

On Mon, 4 Aug 2003 14:37:13 +0400
"Lev Assinovsky" <LAssinovsky@algorithm.aelita.com> wrote:

> Hello all!
> I badly need pa-risc 1.1 instruction sequence suitable for gdb.
> I would like to implement "hard breakpoint". 
> I tried "BREAK 4,8" - gdb stops but can't continue.
> Any help will be appreciated!
> 

We've looked into this already, and as far as we could find out, there is
no hardware support for hardware breakpoints on parisc.
They'd have to be emulated.

You can take a look at what we did for kgdb by checking this page:
http://pateam.esiee.fr/kgdb.html

Anyway, as far as i know, gdb isn't really supported for hppa.

HTH,


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/

Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 81C1A4891
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 19 Jan 2004 07:35:52 -0700 (MST)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i0JEZja02759; Mon, 19 Jan 2004 09:35:45 -0500
Subject: Re: [parisc-linux] 32bit parisc kernel 2.6.1 and pcmcia
From: James Bottomley <James.Bottomley@steeleye.com>
To: Helge Deller <deller@gmx.de>
In-Reply-To: <200401182059.34270.deller@gmx.de>
References: <200401182059.34270.deller@gmx.de>
Content-Type: text/plain
Date: 19 Jan 2004 09:35:41 -0500
Message-Id: <1074522943.2201.1.camel@mulgrave>
Mime-Version: 1.0
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sun, 2004-01-18 at 14:59, Helge Deller wrote:
> ..now inserting my TDK ISDN/serial modem PCMCIA card....

Sorry, I'm an idiot...these type of cards don't seem to work (they seem
to require ISA IRQ routing rules, which we can't provide).

Do you have a network or wireless card you could try instead?

James

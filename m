Return-Path: <James.Bottomley@SteelEye.com>
Received: from hancock.sc.steeleye.com (stat1.steeleye.com [65.114.3.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id 277D4492F
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 18 Jan 2004 16:45:03 -0700 (MST)
Received: from midgard.sc.steeleye.com (midgard.sc.steeleye.com [172.17.6.40])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id
	i0INj0a30876; Sun, 18 Jan 2004 18:45:00 -0500
Subject: Re: [parisc-linux] 32bit parisc kernel 2.6.1 and pcmcia
From: James Bottomley <James.Bottomley@steeleye.com>
To: Helge Deller <deller@gmx.de>
In-Reply-To: <200401182059.34270.deller@gmx.de>
References: <200401182059.34270.deller@gmx.de>
Content-Type: text/plain
Date: 18 Jan 2004 18:44:55 -0500
Message-Id: <1074469497.1805.25.camel@mulgrave>
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
> Dino fff80000: stuck interrupt 4
> cs IO ports 0x0-0x7 allocated in parent Dino I/O Port

Erk, I assume this is a yenta socket with two PCMCIA slots?

I wasn't sure what the setting should be when I constructed the code in
the pa patch set (I only did it to get my PCI<->cardbus bridge working
with a single slot yenta PCI card).

What information does the Yenta driver print?

James

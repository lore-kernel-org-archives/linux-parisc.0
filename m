Return-Path: <randolph@tausq.org>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id D3C3C48D8
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 27 Feb 2004 03:20:55 -0700 (MST)
Date: Fri, 27 Feb 2004 02:21:00 -0800
From: Randolph Chung <randolph@tausq.org>
To: Eggert Ehmke <eggert.ehmke@berlin.de>
Subject: Re: [parisc-linux] kernel 2.6.3 compile problem
Message-ID: <20040227102100.GJ18493@tausq.org>
References: <200402271110.50459.eggert.ehmke@berlin.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200402271110.50459.eggert.ehmke@berlin.de>
Cc: parisc-linux@lists.parisc-linux.org
Reply-To: Randolph Chung <randolph@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> There is indeed no file include/asm/vga.h. But if I understand the 
> documentation right, I need to include VGA support. Can you please tell me 
> where I am wrong? These are my console settings in .config:

no, you don't want VGA console. STI console (and possibly serial
console) is the one you want.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 21100482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 24 Nov 2002 13:37:21 -0700 (MST)
Date: Sun, 24 Nov 2002 12:42:08 -0800
From: Randolph Chung <randolph@tausq.org>
To: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.5.47-paX STI(?) null pointer deref
Message-ID: <20021124204208.GO21187@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <Pine.BSF.4.44.0211242029230.39295-100000@e0-0.zab2.int.zabbadoz.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.BSF.4.44.0211242029230.39295-100000@e0-0.zab2.int.zabbadoz.net>
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

> How to debug this one ???

take a look at http://www.parisc-linux.org/faq/kernelbug-howto.html

for 2.5, if you are doing native compiles, you can also turn on
CONFIG_KALLSYMS to make the stack dump a bit more useful.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/

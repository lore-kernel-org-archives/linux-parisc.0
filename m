Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.zrt.nl (ns.zrt.nl [212.153.94.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7B3CC4829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  5 Aug 2002 07:23:37 -0600 (MDT)
Received: (from fwmaster@localhost) by ns.zrt.nl (8.9.1a/8.6.12) id PAA26129 for <parisc-linux@lists.parisc-linux.org>; Mon, 5 Aug 2002 15:23:36 +0200 (MET DST)
Message-Id: <sd4e97dd.056@ms-zrt1>
Date: Mon, 05 Aug 2002 14:51:56 +0200
From: "Jurriaan Kalkman" <Jurriaan.Kalkman@zrt.nl>
To: <Ralf.Hildebrandt@charite.de>, <rbradetich@uswest.net>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Betr.: Re: [parisc-linux] 2.4.19 tree merged in.
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

>On Sun, Aug 04, 2002 at 05:25:59PM -0600, Ryan Bradetich wrote:
>> Hello parisc-linux hackers,
>>=20
>> The merge upto linux 2.4.19 was just committed into the parisc-linux
>> cvs tree.  This kernel boots fine on my 712 and C200.
>
>For me, it doesn't even BUILD!
>
There is a noxious problem where the latest debian modutils are still at
2.4.15, and kernel-2.4.19 needs newer modutils. This can be solved
by downloading a newer version of modutils (2.4.19 is the latest, IIRC) =
and
installing those. The symptoms of too old modutils are lot of unresolved
symbols - like  you see.

Good luck,
Jurriaan

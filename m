Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from irongate.swansea.linux.org.uk (pc2-cwma1-5-cust12.swa.cable.ntl.com [80.5.121.12])
	by dsl2.external.hp.com (Postfix) with ESMTP id F1B60482B
	for <parisc-linux@parisc-linux.org>; Sat,  3 Aug 2002 12:06:16 -0600 (MDT)
Received: from irongate.swansea.linux.org.uk (localhost [127.0.0.1])
	by irongate.swansea.linux.org.uk (8.12.2/8.11.6) with ESMTP id g73JODu6002597;
	Sat, 3 Aug 2002 20:24:14 +0100
Received: (from alan@localhost)
	by irongate.swansea.linux.org.uk (8.12.2/8.12.2/Submit) id g73JOCLG002595;
	Sat, 3 Aug 2002 20:24:12 +0100
Subject: Re: [parisc-linux] Linux-2.4.19 released
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: Joel Soete <joel.soete@freebel.net>
Cc: HPPA List <parisc-linux@parisc-linux.org>
In-Reply-To: <3D4C275D.5010104@freebel.net>
References: <3D4C275D.5010104@freebel.net>
Content-Type: text/plain
Date: 03 Aug 2002 20:24:12 +0100
Message-Id: <1028402652.1760.18.camel@irongate.swansea.linux.org.uk>
Mime-Version: 1.0
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

On Sat, 2002-08-03 at 19:56, Joel Soete wrote:
> Hi all,
> 
> Now that Linux-2.4.19 is released what will be programm for pl?
> 
> Just to now how to be helpfull in right direction.

I've sent Marcelo the main parisc diffs and asked him to merge them for
2.4.20-pre1. Thats basically all the stuff which is parisc unique. If
that works out ok then I can start feeding him the other stuff piece by
piece after its been tested in -ac

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id DE80A482E
	for <parisc-linux@lists.parisc-linux.org>; Sun, 25 Nov 2001 13:00:50 -0700 (MST)
Message-Id: <200111251956.MAA02318@puffin.external.hp.com>
To: Bernd Eckenfels <lists@lina.inka.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 715/50 does not find image on cd 
In-Reply-To: Message from Bernd Eckenfels <lists@lina.inka.de>
   of "Sat, 24 Nov 2001 16:07:48 +0100." <20011124160748.B18913@lina.inka.de>
Date: Sun, 25 Nov 2001 12:56:24 -0700
From: Grant Grundler <grundler@puffin.external.hp.com>
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

Bernd Eckenfels wrote:
> If I do a "search" in boot admin, it does not list me any "bootable media".
> Looks to me, like it is seeing the CDROM, but unable to find the IPL on it?

Search the parisc-linux mail archive for "spinup" or "target initiated
negotiation". It might be possible to make this drive work with
the older boxes but it's probably easier to just try a different one.

> I thought the Firmaware may be the problem, but I dont know where i see the
> firmware revision and how to update it.. 

See #7 on the FAQ
http://www.parisc-linux.org/faq/index.html

grant

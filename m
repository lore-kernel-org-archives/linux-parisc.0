Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.comcast.net (smtp.comcast.net [24.153.64.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id 025A24833
	for <parisc-linux@lists.parisc-linux.org>; Sat, 20 Apr 2002 22:08:19 -0600 (MDT)
Received: from kenny (pcp944901pcs.cstltn01.in.comcast.net [68.58.113.28])
 by mtaout45-01.icomcast.net
 (iPlanet Messaging Server 5.1 HotFix 0.3 (built Apr  8 2002))
 with SMTP id <0GUW0046BGTRSA@mtaout45-01.icomcast.net> for
 parisc-linux@lists.parisc-linux.org; Sun, 21 Apr 2002 00:08:15 -0400 (EDT)
Date: Sat, 20 Apr 2002 23:08:17 -0500
From: James S <smithjames@comcast.net>
Subject: Re: [parisc-linux] not freeing initmem and power button
To: parisc-linux@lists.parisc-linux.org
Reply-To: James S <smithjames@comcast.net>
Message-id: <004901c1e8ea$2ac79a00$02c1a8c0@james.co.uk>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
References: <F124jLDxo1dHkLl0atJ00008874@hotmail.com>
 <OE54mEB4HGXAwxXSXI3000037e7@hotmail.com> <200204201751.27272.deller@gmx.de>
 <OE45GXh6xHs3X0yb7bO00001eac@hotmail.com>
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

> Nope, soft power-off is enabled as you can see in my attached dmesg. BTW,
> when using the old 2.4.9 kernel nothing happened when pressing this
switch.
>

for what its worth :)

using the 2.4.17 kernel on my 712/60 here & the power switch does an orderly
shutdown

found this kernel fairly stable (no crashes in everyday use) with smbfs
compiled in


James S

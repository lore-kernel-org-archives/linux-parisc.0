Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from irongate.swansea.linux.org.uk (pc2-cwma1-4-cust86.swan.cable.ntl.com [213.105.254.86])
	by dsl2.external.hp.com (Postfix) with ESMTP id 394F24830
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Mar 2003 11:03:11 -0700 (MST)
Received: from irongate.swansea.linux.org.uk (localhost [127.0.0.1])
	by irongate.swansea.linux.org.uk (8.12.7/8.12.7) with ESMTP id h2BJAdYf019977;
	Tue, 11 Mar 2003 19:10:40 GMT
Received: (from alan@localhost)
	by irongate.swansea.linux.org.uk (8.12.7/8.12.7/Submit) id h2BJAbfj019975;
	Tue, 11 Mar 2003 19:10:37 GMT
Subject: Re: [parisc-linux] ndelay() ?
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3E689FC400001167@ocpmta1.freegates.net>
References: <3E689FC400001167@ocpmta1.freegates.net>
Content-Type: text/plain
Message-Id: <1047409836.19931.3.camel@irongate.swansea.linux.org.uk>
Mime-Version: 1.0
Date: 11 Mar 2003 19:10:37 +0000
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

On Tue, 2003-03-11 at 16:27, Joel Soete wrote:
> Hi all,
> 
> In the new 2.4.21-pre5 we need a ndelay() function (ide support for b2k at
> least).

If you can't do ndelay well, udelay(1) as an equivalent is just fine.
What it must be is at least the required nSec delay

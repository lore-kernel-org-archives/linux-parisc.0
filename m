Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from lxorguk.ukuu.org.uk (pc2-cwma1-4-cust86.swan.cable.ntl.com [213.105.254.86])
	by dsl2.external.hp.com (Postfix) with ESMTP id BD446483B
	for <parisc-linux@parisc-linux.org>; Mon,  7 Jul 2003 10:08:34 -0600 (MDT)
Received: from dhcp22.swansea.linux.org.uk (dhcp22.swansea.linux.org.uk [127.0.0.1])
	by lxorguk.ukuu.org.uk (8.12.8/8.12.5) with ESMTP id h67G5rKd003516;
	Mon, 7 Jul 2003 17:05:54 +0100
Received: (from alan@localhost)
	by dhcp22.swansea.linux.org.uk (8.12.8/8.12.8/Submit) id h67G5qBC003514;
	Mon, 7 Jul 2003 17:05:52 +0100
Subject: Re: [parisc-linux] warning: minor abi change
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: Matthew Wilcox <willy@debian.org>,
	HPPA List <parisc-linux@parisc-linux.org>
In-Reply-To: <3F03A42100000903@ocpmta1.freegates.net>
References: <3F03A42100000903@ocpmta1.freegates.net>
Content-Type: text/plain
Message-Id: <1057593949.2749.59.camel@dhcp22.swansea.linux.org.uk>
Mime-Version: 1.0
Date: 07 Jul 2003 17:05:52 +0100
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

On Llu, 2003-07-07 at 17:00, Joel Soete wrote:
> > Get the HP ones into 2.5 then they are fixed "right" values
> 
> Ok but now in 2.4.22-pre3:
> [...]
>   	KERN_EXCEPTION_TRACE=58,	/* boolean: exception trace */
> [...]

Same comment still applies. The 2.5. ones are definitive. If someone
submits a 2.4 one clashing with a different 2.5 one tell Marcelo to
revert it ASAP.

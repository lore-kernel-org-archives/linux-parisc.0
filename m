Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from lxorguk.ukuu.org.uk (pc2-cwma1-4-cust86.swan.cable.ntl.com [213.105.254.86])
	by dsl2.external.hp.com (Postfix) with ESMTP id AAA5C4829
	for <parisc-linux@parisc-linux.org>; Fri, 27 Jun 2003 10:55:05 -0600 (MDT)
Received: from dhcp22.swansea.linux.org.uk (dhcp22.swansea.linux.org.uk [127.0.0.1])
	by lxorguk.ukuu.org.uk (8.12.8/8.12.5) with ESMTP id h5RGqAKd005042;
	Fri, 27 Jun 2003 17:52:11 +0100
Received: (from alan@localhost)
	by dhcp22.swansea.linux.org.uk (8.12.8/8.12.8/Submit) id h5RGq9tX005040;
	Fri, 27 Jun 2003 17:52:09 +0100
Subject: Re: [parisc-linux] warning: minor abi change
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: Matthew Wilcox <willy@debian.org>,
	HPPA List <parisc-linux@parisc-linux.org>
In-Reply-To: <3ED70CF10000AE35@ocpmta2.freegates.net>
References: <3ED70CF10000AE35@ocpmta2.freegates.net>
Content-Type: text/plain
Message-Id: <1056732728.4348.52.camel@dhcp22.swansea.linux.org.uk>
Mime-Version: 1.0
Date: 27 Jun 2003 17:52:08 +0100
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

On Gwe, 2003-06-27 at 17:21, Joel Soete wrote:
> which interfere with your:
>  	KERN_HPPA_PWRSW=57,	/* int: hppa soft-power enable */
>  	KERN_HPPA_UNALIGNED=58,	/* int: hppa unaligned-trap enable */
> };
> 
> What to do?

Get the HP ones into 2.5 then they are fixed "right" values

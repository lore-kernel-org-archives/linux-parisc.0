Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6F4334843
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Mar 2002 09:54:06 -0700 (MST)
To: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] STI without PCI
Message-ID: <1016470438.3c961ba69aa41@webmail.tiscalinet.be>
Date: Mon, 18 Mar 2002 17:53:58 +0100 (CET)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net, Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
References: <1016466919.3c960de7350ce@webmail.tiscalinet.be> <20020318155833.M21765@parcelfarce.linux.theplanet.co.uk> <1016468351.3c96137f696f0@webmail.tiscalinet.be> <20020318162436.N21765@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20020318162436.N21765@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Quoting Matthew Wilcox <willy@debian.org>:

...
> 
> That's very strange.  Are you sure you have CONFIG_MSDOS_PARTITION=y in
> your .config?  Otherwise, I gess there could be a problem with reading
> the partition table off the disc... but that seems unlikely.

It was on the original at least (but i could not check, right now, if uncheck of
CONFIG_PCI did not remove it by make menuconfig; I can check as soon as my last
build will be finished).

Joel
> 
> -- 
> Revolutions do not require corporate support.
> 
> 


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)

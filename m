Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id ED935482B
	for <parisc-linux@lists.parisc-linux.org>; Mon,  9 Jul 2001 01:47:37 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 45618B00C; Mon,  9 Jul 2001 08:46:33 +0100 (BST)
Date: Mon, 9 Jul 2001 08:46:33 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: =?iso-8859-1?Q?Jo=EBl_Soete?= <jso@europay.com>
Cc: "Richard Hirst <rhirst" <rhirst%linuxcare.com%SMTP%EUROPAY@mastercard.com>,
	parisc-linux@lists.parisc-linux.org, puffin@esiee.net
Subject: Re: [parisc-linux] palinux 0.9.1
Message-ID: <20010709084633.C23509@linuxcare.com>
References: <OFE6582140.671FFFD5-ONC1256A81.00401A6F@LocalDomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <OFE6582140.671FFFD5-ONC1256A81.00401A6F@LocalDomain>; from jso@europay.com on Fri, Jul 06, 2001 at 02:57:19PM +0200
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Jul 06, 2001 at 02:57:19PM +0200, Joël Soete wrote:
> 
> 
> Hello Richard,
> 
> The problem ip_local_deliver:... cames in fact from the dhcp_client which
> is started by default?

I reproduced that problem; hadn't seen it before because I usually
use dhcp to configure my network.  Seems you only get the errors if
dhcp-client doesn't have any real interfaces to configure.

> For the sti console, I do have to be unlucky; I get backup the kernel
> installed with 0.9 then ps2 kbd works back ( I also suspect the kbd and
> change it, no difference)? what could be the problem? I also try to get the
> last firmware but HP prevent to install it over the builtin ?

You are not the only person with this problem, so hopefully someone will
fix it soon.

Richard

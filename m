Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id BA864482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Jul 2001 02:33:34 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 6592CB00C; Wed, 11 Jul 2001 09:32:17 +0100 (BST)
Date: Wed, 11 Jul 2001 09:32:17 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: rpengelly <rpengelly@ati.stlawrencec.on.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] install problems on the 735/99
Message-ID: <20010711093217.E18375@linuxcare.com>
References: <004901c1096c$290de920$0f809b8e@ati.stlawrencec.on.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <004901c1096c$290de920$0f809b8e@ati.stlawrencec.on.ca>; from rpengelly@ati.stlawrencec.on.ca on Tue, Jul 10, 2001 at 02:14:29PM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Jul 10, 2001 at 02:14:29PM -0400, rpengelly wrote:
> Well so far we've gotten the installer to boot using the serial console. The problem lies in installing the base system. It will download and extract the files needed then it hangs during installation. Anyone encounter this? 

735 uses a PA7100, PCX-T cpu, so I'd expect 0.9 to have problems.

> I'm currently downloading the 0.91 release. WIll this solve that problem?

Yes, it should do.

Richard

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 009A1484E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 27 Oct 2003 12:39:12 -0700 (MST)
Date: Mon, 27 Oct 2003 12:39:11 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] C110 builtin nic slow?
Message-ID: <20031027193911.GA16012@colo.lackof.org>
References: <3F9BFB00.5090008@tiscali.be> <20031026172531.GA32146@colo.lackof.org> <3F9C3154.4060105@tiscali.be> <3F9C3854.80001@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F9C3854.80001@tiscali.be>
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

On Sun, Oct 26, 2003 at 09:10:44PM +0000, Joel Soete wrote:
> How may I find and reset the speed setup of a nic (I mean which 10 or 
> 100 Mb, half or full duplex)?

ethtool?

> In a second though I just remember that the pc boot first (i need 
> minicom console to boot c110) then latter the c110. So it could be that 
> the first one is set in 100 half as default (no connection at boot time) 
> and the second 10 half?

shouldn't matter unless auto-negotiation is broken for one driver or
the other. If they are point-to-point, I expect the negotiation
to take place when the link is brought up with the second NIC.

grant

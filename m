Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from primare.xs4all.nl (primare.xs4all.nl [213.84.188.140])
	by dsl2.external.hp.com (Postfix) with ESMTP id A717F485B
	for <parisc-linux@lists.parisc-linux.org>; Sun, 21 Jul 2002 13:22:58 -0600 (MDT)
Date: Sun, 21 Jul 2002 21:23:46 +0200
From: DJ Tha Muggs <djmuggs@primare.xs4all.nl>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Systems Console hangs!
Message-ID: <20020721212346.A17400@primare.xs4all.nl>
References: <20020721183508.C16644@primare.xs4all.nl> <djmuggs@primare.xs4all.nl> <20020721183637.5E5DB484B@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020721183637.5E5DB484B@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Sun, Jul 21, 2002 at 12:36:37PM -0600
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

Grant,

Thank you for your reply, after looking at the FAQs i found this:

The system boots up on the STI Console but no "login:" prompt appears, what do I do ? 
Uncomment the tty0 in /etc/inittab.

I'm now trying this.

Cristian.

On Sun, Jul 21, 2002 at 12:36:37PM -0600, Grant Grundler wrote:
> DJ Tha Muggs wrote:
> > So it looks like the system boots fine, but i can't use it with a monitor con
> >   nected :(
> 
> Which graphics card is installed?
> FWIW, only PCI Vis-EG gfx card is supported to date.
> I thought the FAQ and "Supported HW" web pages covered this.
> 
> grant
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

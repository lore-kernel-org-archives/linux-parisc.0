Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 51A354829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Apr 2003 11:59:05 -0600 (MDT)
Date: Wed, 16 Apr 2003 18:59:02 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] color recovery
In-Reply-To: <20030416175223.GB4982@solo.franken.de>
Message-ID: <Pine.LNX.4.44.0304161854341.28370-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Wed, 16 Apr 2003, Thomas Bogendoerfer wrote:

> On Wed, Apr 16, 2003 at 01:28:43PM +0100, M. Grabert wrote:
> > My Precisionbook obviously has a Visualize-EG with just 2MB.
> > So it should be able to display at least 800x600 in 24/32bit and
> > 1024x768 in 16bit, but it refuses to do so. 'dmesg' ALWAYS shows
> > only 8bit colour depth regardless of the display resolution.
>
> Visualize-EG is 8 bit only. That's a hardware limitation.

The manual says something different/strange ... the LCD actually supports
16M colours, and so does the Visualize-EG (HP Graphitti).

... together with the fact that it just has 2MB onboard there is only
one possibility: they are referring to HP's color recovery technique.

Is there ANY way that color recovery will be supported anytime in the future?

> > My question is know, does STIfb also supports 16bit? How can I force
> > 16bit and 24/32bit colour depths? What does sti=8/24 exactly mean?
>
> stifb supports 32bit, if the hardware supports it. sti=8/24 is the
> hardware path taken from PDC.

Thanks, Max

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.calyx.net (mail.calyx.com [216.82.160.19])
	by dsl2.external.hp.com (Postfix) with SMTP id 632C848B1
	for <parisc-linux@lists.parisc-linux.org>; Tue, 16 Jul 2002 13:53:13 -0600 (MDT)
Date: Tue, 16 Jul 2002 15:52:59 -0400 (EDT)
From: "Brian S. Julin" <bri@mojo.calyx.net>
To: Matthew Wilcox <willy@debian.org>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] HOWTO: Using HIL keyboard and HIL mouse on PARISC
In-Reply-To: <20020630231349.D29045@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.BSO.4.33.0207161535550.10023-100000@mojo.calyx.net>
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

On Sun, 30 Jun 2002, Matthew Wilcox wrote:

> On Sun, Jun 30, 2002 at 07:33:43PM +0200, Helge Deller wrote:
> > The new HIL drivers were written by Brian S. Julin and I mostly only did some
> > bugfixing, cleanups and re-integration/re-organization  into our CVS kernel.
>
> Thanks to both of you for doing this.  It's great to have support for
> these devices in the Linux kernel.

NP.  There's still a lot of work to do on them; I haven't had much time
recently.  However if not fully functional they are at least
completely stable.  I have them loaded at work and am boasting a pretty
good uptime at this point (many thanks to whoever for doing whatever,
suddently my spurious system hangs came to a stop.)

I like Helge's strategy of moving the old keyboard driver to
a "simple driver" because eventually when all the keymaps are worked out
in the current driver, I think a simpler irq-only read-only interface
(without support for any other HP SDC functions) would be pretty easy
and good to have, and the old driver can be evolved into this whenever the
old linux keyboard system starts to be decomissioned.

Mostly my main concern with the driver right now is it keeps a tasklet
scheduled so often that it affects CPU statistics.  The simple driver
would not do this, but would not be able to support host-to-hil transfers.
Since I have yet to get my hands on any host-to-hil devices yet, I doubt
many people would miss host-to-hil support.

I'm not familiar with the hardware that we are currently getting the
100Hz clock from, but if can, and we do, follow suit with i386 and
increase HZ to 1000 this would make the timing of the driver much easier.
Otherwise being a little less agressive at the risk of an occasional
event latency would probably be best.

Anyway, back to catching up on e-mail.

--
Brian S. Julin

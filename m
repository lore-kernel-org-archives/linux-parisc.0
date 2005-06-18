From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [OT] USB Keyboard on C3600?
Date: Sat, 18 Jun 2005 15:50:07 -0600
Message-ID: <20050618215007.GA24175@colo.lackof.org>
References: <87slzhudu4.fsf@deprecated.intranet.astaro.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Sven Schnelle <sschnelle@astaro.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <87slzhudu4.fsf@deprecated.intranet.astaro.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Jun 17, 2005 at 06:50:59PM +0200, Sven Schnelle wrote:
> i've got a "new" HP9000-C3600, and now i'm wondering if a standard
> PC-USB Keyboard should work on this machine.

Most likely.

>  I've got a blank screen,
> and the HP is switching to serial console. i think there's a message
> like "failed to initialize PCI 2" or something like this appearing in the
> Display, but the PDC doesn't display me any errors.

"PCI 2" is slot 2 where the graphics card is expected to be installed.

> The Primary Console is switched to GRAPHICS(2)/USB, so the serial
> Console is probably only a fallback.

Correct

> Should this HP display something on the screen, even without keyboard?

Probably Yes though I haven't tried this in a while.
It suggested the video doesn't match the monitor.
Plug in the USB keyboard and hit <TAB> key until
something shows up on the monitor.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

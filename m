Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep12-int.chello.at (viefep12-int.chello.at [213.46.255.25])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8757D487B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 15 Feb 2002 15:41:33 -0700 (MST)
Message-ID: <3C6D8E9A.AE842F7E@gmx.at>
Date: Fri, 15 Feb 2002 23:41:30 +0100
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: James S <smith-james@home.com>
Cc: parisc-linux@lists.parisc-linux.org,
	grundler@dsl2.external.hp.com
Subject: Re: [parisc-linux] Power LED
References: <000f01c1b5de$dee4fa80$02c1a8c0@james.co.uk>
Content-Type: text/plain; charset=us-ascii
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

YES !!! The LED is software controlled !

I know, that my LED on the 712/60 flashed, as long as I am in
the PDC boot loader, after booting the OS, the LED stays on,
shutting down the switched off the LED.

I think the LED is normally controlled by the PDC LED control,
where RUN/WARNING/CAUTION/FATAL/.... can be defined, but on the
712 I never tried it. On the E55 I could control the LEDs in this
way, which is definitly different to the 720/730 and to the
machines with LCD.

Bye
Christoph P.


James S wrote:
> 
> this might be a daft question.......
> 
> what causes the power led to go out on the 712 systems ?
> 
> is it software controlled ?
> 
> James S
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from reactor.hyte.de (reactor.hyte.de [212.84.215.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id D9A81486C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Jun 2002 15:41:21 -0600 (MDT)
Date: Thu, 20 Jun 2002 23:39:57 +0200 (CEST)
From: Joachim Steiger <roh@hyte.de>
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] serial on hp712/80 buggy?
In-Reply-To: <20020620174820.GE4111@systemhalted>
Message-ID: <Pine.LNX.4.21.0206202330240.5438-100000@reactor.hyte.de>
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

On Thu, 20 Jun 2002, Carlos O'Donell wrote:
> Where did you set the baud rate?
> In minicom _and_ the console (Boot admin)?
i used the hppa just as 'console' to access an embedded-ppc
i reconnected the same cable to my pc and started minicom there
and it worked
on 9600baud i can use minicom on the hppa as on the pc

i also know there seems to be some kind of 'bug' that on most computers i
have to close and reopen the serial-device to get the baudrate change
through
in case of minicom it means to set the baudrate, save it as default , then
quit and restart minicom

> It's up to both ends to support automatic baud rate selection
> via a terminal protocol. I don't think the console on the
> 712 will do that (I'm sure VT-MODEM can...).
if setting it manually don't work, how should a automatic work??

there is no terminal protocol, its just that accessing the ootloader on
the ppc happens via 9k6 and 'flashing' it happens with 57600

i'm fairly shure that it MUST be an hppa soft/hardwareproblem since i
switched the cables and they are working correctly on other machines as on
9k6 on the hppa

regards

roh

ps: i will try to find out which is the setting my serial-port is is when
it should be 57600 by just feeding it with different baudrates and watch
when its displayed correctly soon

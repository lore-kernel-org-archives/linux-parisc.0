Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from medea.theophys.kth.se (medea.theophys.kth.se [130.237.25.82])
	by dsl2.external.hp.com (Postfix) with SMTP id B39C4482C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Nov 2001 07:04:37 -0700 (MST)
Date: Thu, 22 Nov 2001 15:04:33 +0100 (CET)
From: Jurij Smakov <jurijus@theophys.kth.se>
To: Kaj-Michael Lang <milang@tal.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Power button on 712
In-Reply-To: <003801c1735c$6581b7b0$56dc10c3@amos>
Message-ID: <Pine.LNX.4.21.0111221501480.22553-100000@uranus.theophys.kth.se>
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

On Thu, 22 Nov 2001, Kaj-Michael Lang wrote:

> This might sound really strange but anyway:
> 
> Should the power button work under Linux ?
> Even after halting I need to pull the cord to get my machine to power down,
> as it won't respond to the the power button.

Hi!

That's not the normal behaviour. After I do a shutdown -h on a 712, the
LED on the front panel goes off and it is possible to turn off the power
using the front power switch. I have to pull the plug only after I get a
kernel panic or something like this.

Best regards,

Jurij.

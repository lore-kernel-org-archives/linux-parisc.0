Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from medea.theophys.kth.se (medea.theophys.kth.se [130.237.25.82])
	by dsl2.external.hp.com (Postfix) with SMTP id 0B253482C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Nov 2001 07:39:33 -0700 (MST)
Date: Thu, 22 Nov 2001 15:39:31 +0100 (CET)
From: Jurij Smakov <jurijus@theophys.kth.se>
To: "Witvliet, Hans" <Hans.Witvliet@Alcatel.nl>
Cc: parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] Power button on 712
In-Reply-To: <1A8904C3797ED411AC2E0008C7E6F88117CAC0@nlntmail2b.ats.nld.alcatel.nl>
Message-ID: <Pine.LNX.4.21.0111221534400.22553-100000@uranus.theophys.kth.se>
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

On Thu, 22 Nov 2001, Witvliet, Hans wrote:

> Under hp-ux, if you press the "power-button" on the front, the system traps
> it, and performs a "shutdown -h now"  (at least it takes ages to stop)
> So the button on the front is not a BRS, but just generates a irq (on some
> systems anyway....)
> 
> I presume this irq could be trapped under linux aswell, not?

Hi!

I've posted a question about that on the list some time ago. According to
lasi docs, cutting of the power with the power switch should generate a
power failure interrupt, which I thought I could catch and make a clean
shutdown. I suppose, that it should be an interruption with code 2, so
I've added a handler for that in arch/parisc/kernel/traps.c (I think).
Well, it never became triggered by the power switch, and I have no idea,
why.

Best regards,

Jurij

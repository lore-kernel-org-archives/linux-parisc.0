Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from interzone.ucc.ie (interzone.ucc.ie [143.239.1.134])
	by dsl2.external.hp.com (Postfix) with ESMTP id 32BB34829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 17 Aug 2002 22:21:37 -0600 (MDT)
Date: Sun, 18 Aug 2002 05:21:34 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: "B. Douglas Hilton" <bdhilton@charter.net>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.LNX.4.44.0208180419120.1348-100000@sal.ucc.ie>
Message-ID: <Pine.LNX.4.44.0208180453380.1348-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Hints to debug, was: Voodoo3 PCI on C200 experiment pending!
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

On Sun, 18 Aug 2002, M. Grabert wrote:

> On Sat, 17 Aug 2002, B. Douglas Hilton wrote:
>
> > I just scarfed up a somewhat used Voodoo3 PCI graphics
> > card from Ebay and intend to try it out with Debian/HPPA
> > and a custom built kernel.

[...]

> I think I have to disappoint you. I doesn't work for me :-(

[...]

> But unfortunately sticking the Voodoo into a 32bit PCI slot doesn't get
> much further: starting XFree86 will cause a HPMC shortly after a message
> like "Lasi: barking without apparent reason" (obviously from gsc/lasi.c).
> This is just before it is about to initialize the Voodoo3 (with the
> Intel emulator in XFree86). At least the messages printed on the console
> seem to be like the last messages XFree86 usually prints out just before
> activating the graphics card on other platforms.

Does anybody can give me some hints what to do to debug this issue?
I'm not a kernel hacker, and I don't have any knowledge about PA-RISC
linux internals and PA-RISC assembler programming (but I hope I'll improve
this situation in the future ;)

However I know C quite well (and debugging, stack manipulation, reverse
engineering), and I used it not only as a hobby.

Can anybody give me some hints how I should compile the kernel (-g), how
and if I should use the kernel debugger and recompile X with debugging
symbols in order to get some more interesting information about how and
why it Voodoo/X fails on PA-RISC linux? I'm sure will not be able to fix
the problem, but I probably can feed you with some information that will
help you to locate and solve the problem.
At least this is an interesting/annoying bug for two people (probably
more) and we could investigate it a little bit more while you don't have
to waste too much time on this issue yourself.

greetings max

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 870CC482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  4 Jul 2003 05:08:34 -0600 (MDT)
Date: Fri, 4 Jul 2003 12:08:27 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Joel Soete <jsoe0708@tiscali.be>
Cc: Martin <inkubus@interalpha.co.uk>,
	<parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] RDI Precision Book 160
In-Reply-To: <3F03A473000009CA@ocpmta4.freegates.net>
Message-ID: <Pine.LNX.4.44.0307041203090.1144-100000@sal.ucc.ie>
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

On Fri, 4 Jul 2003, Joel Soete wrote:

> Hi Martin,
>
> >    I've recently acquired an RDI Precision Book 160 which is currently
> > running HP-UX 10.2.  From what I can find in the relevant documentation
> > it is allegidly completely compatible with the HP B series workstations
> > and thus should run Linux.  Does anyone have any experience with
> > installing / running Linux on these?  It is possible?  What devices are
> > supported?  Is Linux the best choice for this machine?
>
> Yes it works have a look on the thread:
> <http://lists.parisc-linux.org/pipermail/parisc-linux/2003-March/019613.html>

Yes, I also bought one of these RDI Precisionbooks from eBay (probably
even from the same guy as you did).
It works fine, except I have some problems with the (internal) keyboard,
ie. the control/function keys are mapped somewhat weird, eg. CapsLock = Ctrl.

A second thing is that stifb only works for me if you attach a external
monitor, but sticon works fine with the internal LCD. I suspect that the
stifb driver clears some flag that it should use the internal LCD during
initialization.

If someone is interested I'd sell mine, since I need some money :-/

greetings, Max

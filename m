Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from medea.theophys.kth.se (medea.theophys.kth.se [130.237.25.82])
	by dsl2.external.hp.com (Postfix) with SMTP id 1AF8B482C
	for <parisc-linux@lists.parisc-linux.org>; Sat, 10 Nov 2001 12:30:08 -0700 (MST)
Date: Sat, 10 Nov 2001 20:30:05 +0100 (CET)
From: Jurij Smakov <jurijus@theophys.kth.se>
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Floppy on a 712/60 
In-Reply-To: <200111100555.WAA01416@puffin.external.hp.com>
Message-ID: <Pine.LNX.4.21.0111102023200.344-100000@uranus.theophys.kth.se>
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

Hi!

On Fri, 9 Nov 2001, Grant Grundler wrote:

> Jan-Benedict Glaw wrote:
> > Well, the box is missing it's floppy drive.
> > Can I attach a standard floppy drive ripped off an ordinary PC?
> 
> I haven't tried it but I think so.
> Please try and tell us.
> If you fry the box I'll replace it.

I've tried that on 712/80. Connected a standard PC floppy, didn't burn
the box but didn't get any signs of life from the floppy either. The
floppy LED never goes on, not even in the initial bootup stage. I've then
tried writing different values to the floppy registers through lasi,
following the controller docs, trying to reset it or at least get to do
something. No success. Main floppy status register always returns 0 - no
good. Given any ideas I might try to do it again.

Best regards,

Jurij.

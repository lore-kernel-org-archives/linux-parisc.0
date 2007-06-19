From: "Helge Deller" <deller@gmx.de>
Subject: Re: [parisc-linux] Unaligned handler broken (kernel BUG at
	mm/mmap.c:1991!)
Date: Tue, 19 Jun 2007 21:28:56 +0200
Message-ID: <20070619192856.137150__41760.30775202$1416624399$gmane$org@gmx.net>
References: <JJVMMO$BDDF688E008708C3728947C9158A4B1D@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
To: "Joel Soete" <soete.joel@scarlet.be>,
 parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <JJVMMO$BDDF688E008708C3728947C9158A4B1D@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi Joel,

Von: "Joel Soete" <soete.joel@scarlet.be>
> Did your system actually crashed?

No it didn't.
 
> I run your test case and read well same messages on console but my b180
> runing also 2.6.22-rc5-pa1 (a merge of mine obviously) was still 
> alive after this run???

Yes.

> Even thought I don't know what to thought about ultimate message:
> "Fixing ... but reboot is needed!"

Yeah. There is some major bug though : "kernel BUG at mm/mmap.c:1991!"
 
> A critical pb would launch a LPMC or a panic?

That's the worst thing which can happen.

> Should I actualy reboot it (as it's still alive)?

I have no idea. Probably the best is to reboot.

Helge
-- 
Psssst! Schon vom neuen GMX MultiMessenger gehört?
Der kanns mit allen: http://www.gmx.net/de/go/multimessenger
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

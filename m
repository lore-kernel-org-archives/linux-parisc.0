From: "Joel Soete" <soete.joel@scarlet.be>
Subject: Re: [parisc-linux] Unaligned handler broken (kernel BUG at
	mm/mmap.c:1991!)
Date: Tue, 19 Jun 2007 11:35:12 +0200
Message-ID: <JJVMMO$BDDF688E008708C3728947C9158A4B1D__30060.3789197796$1416624399$gmane$org@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
To: "parisc-linux" <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Helge,

Did your system actually crashed?

I run your test case and read well same messages on console but my b180 r=
uning
also 2.6.22-rc5-pa1 (a merge of mine obviously) was still alive after thi=
s run???

Even thought I don't know what to thought about ultimate message:
"Fixing ... but reboot is needed!"

A critical pb would launch a LPMC or a panic?

Should I actualy reboot it (as it's still alive)?

Thx,
    Joel
=0A---=0Ahttp://www.scarlet.be/

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

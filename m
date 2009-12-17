From: Berthold Gunreben <b.gunreben@web.de>
Subject: Re: vfork test case.
Date: Thu, 17 Dec 2009 22:40:22 +0100
Message-ID: <200912172240.22252.b.gunreben@web.de>
References: <119aab440912061319y5b863203ve5dc3dc568a6ccec@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
To: "linux-parisc" <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440912061319y5b863203ve5dc3dc568a6ccec@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Carlos,

On Sunday 06 December 2009 22:19:13 Carlos O'Donell wrote:
> Kyle, James,
> 
> I have constructed a vfork test case which shows some of the problems
> I have using vfork reliably. This fails every time on my PA8700 system
> running 2.6.32-rc6. It appears as though r28 (ret0) in the parent is
> being corrupted.

this reminds me of a problem with vfork that I encountered some years ago. The 
problem as described in 
http://sourceware.org/ml/libc-alpha/2003-02/msg00042.html
was fixed for many architectures, but not for hppa as far as I remember. See 
also 
http://sourceware.org/ml/libc-hacker/2003-02/msg00015.html

I have no idea if this is related, but thought it won't hurt to mention this.

Berthold


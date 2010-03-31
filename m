From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: CFI directives.
Date: Wed, 31 Mar 2010 10:58:38 -0400
Message-ID: <l2z119aab441003310758w994a04cv70a09146e2aa634f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Dave,

I've added CFI directives to all of the syscall stubs in glibc, do you
see anything wrong with that?

I have not yet added CFI directives for the bespoke *.S implementations.

Cheers,
Carlos.

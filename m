Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id 741B4482A
	for <parisc-linux@parisc-linux.org>; Sat, 26 May 2001 10:53:34 -0600 (MDT)
Message-Id: <200105261645.KAA19506@puffin.external.hp.com>
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: parisc-linux@parisc-linux.org, debian-hppa@lists.debian.org
Subject: Re: [parisc-linux] List of packages for hppa ISO release 
In-Reply-To: Your message of "Fri, 25 May 2001 18:10:59 MDT."
             <20010526001059.283B437C8F@carmen.fc.hp.com>
Date: Sat, 26 May 2001 10:45:55 -0600
From: Grant Grundler <grundler@puffin.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Matt Taggart wrote:
> http://puffin.external.hp.com/~taggart/selections.20010525
> 
> There are still a few missing dependencies but those should be taken care of 
> in the next few days. If you have additions/deletions to the list please send
> them to me.

o ditch ipchains and add iptables instead.
o add cvs
o add an irc client? (tirc? tinyirc? ircii?)
o any memory or selftest tools we can include?
  (even untested - I'm looking at x86 package that has mem/cpu test)

grant

Grant Grundler
parisc-linux {PCI|IOMMU|SMP} hacker
+1.408.447.7253

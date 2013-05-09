From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: make default cross compiler search more robust
Date: Thu, 09 May 2013 15:14:51 +0200
Message-ID: <518BA14B.4060808@gmx.de>
References: <1368076115-22262-1-git-send-email-vapier@gentoo.org> <20130509142823.444ac244@marga.jer-c2.orkz.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org, Mike Frysinger <vapier@gentoo.org>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	John David Anglin <dave.anglin@bell.net>
To: Jeroen Roovers <jer@gentoo.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130509142823.444ac244@marga.jer-c2.orkz.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 05/09/2013 02:28 PM, Jeroen Roovers wrote:
> On Thu,  9 May 2013 01:08:35 -0400
> Mike Frysinger <vapier@gentoo.org> wrote:
> 
>> People/distros vary how they prefix the toolchain name for 64bit
>> builds. Rather than enforce one convention over another, add a for
>> loop which does a search for all the general prefixes.  This code
>> will run for both native and cross builds when CROSS_COMPILE isn't
>> explicitly set.
> 
> Several architectures appear to use a scriptlet called 
> cc-cross-prefix for this. See scripts/Kbuild.include.

That's cool :-)

Basically this

+ifneq ($(SUBARCH),$(ARCH))
+       ifeq ($(CROSS_COMPILE),)
+               CROSS_COMPILE := $(call cc-cross-prefix, hppa$(WIDTH)-linux- hppa$(WIDTH)-linux-gnu-)
+       endif
 endif

should then be enough.

Do we really need to search for: 
	hppa1.1-unknown-linux-gnu
	hppa1.1-linux-gnu
	hppa1.1-linux
	hppa2.0-unknown-linux-gnu
	hppa2.0-linux-gnu
	hppa2.0-linux
on 32bit?

Helge

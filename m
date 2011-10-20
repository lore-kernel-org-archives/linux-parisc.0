From: Carlos O'Donell <carlos@systemhalted.org>
Subject: Re: Removing HPPA Linuxthreads support in glibc-ports.
Date: Thu, 20 Oct 2011 16:35:22 -0400
Message-ID: <4EA0860A.3030901@systemhalted.org>
References: <CADZpyiwAqDmsb4TLCwo0KGBm9c_Y1P9iLir8gXJBOJPOTiRr4g@mail.gmail.com> <201110201631.52046.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	Debian HPPA Port List <debian-hppa@lists.debian.org>,
	Gentoo HPPA <gentoo-hppa@lists.gentoo.org>
To: Mike Frysinger <vapier@gentoo.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <201110201631.52046.vapier@gentoo.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 10/20/2011 4:31 PM, Mike Frysinger wrote:

> On Thursday 20 October 2011 14:55:46 Carlos O'Donell wrote:

>> I plan to remove all HPPA Linuxthreads support from glibc-ports.

>>

>> The support is well past bit-rotten.

>>

>> Is anyone opposed to this?

> 

> guess we don't have much choice since it's been purged from the core.  but 

> nptl support isn't mainlined yet right ? :/



I'm pushing those patches out ASAP.



The patches have been around forever though and we've ironed out a lot of kinks.



Cheers,

Carlos.




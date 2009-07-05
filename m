From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: HPPA and Squeeze
Date: Sun, 5 Jul 2009 19:59:59 -0400
Message-ID: <119aab440907051659p5d3cb93dk1034ce053034d192@mail.gmail.com>
References: <4A506D2C.6080801@gmx.de>
	 <20090705171929.5C7205146@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Helge Deller <deller@gmx.de>, kurt@roeckx.be, pkern@debian.org,
	debian-hppa@lists.debian.org, linux-parisc@vger.kernel.org,
	debian-release@lists.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090705171929.5C7205146@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Jul 5, 2009 at 1:19 PM, John David
Anglin<dave@hiauly1.hia.nrc.ca> wrote:
> Carlos, what do you think?

I think the dynamic linker is always the first to touch the mmap'd
file and therefore the most likely to fail if something is wrong in
our VM layer.

Cheers,
Carlos.

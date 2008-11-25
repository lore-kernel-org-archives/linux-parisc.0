From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: 2.6.28-rcX in pretty bad shape on parisc
Date: Tue, 25 Nov 2008 08:33:24 -0500
Message-ID: <119aab440811250533y1a09a396i318dfc057ad0d659@mail.gmail.com>
References: <20081123165718.0D5A94DCB@hiauly1.hia.nrc.ca>
	 <20081125025421.9745A4FB6@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: grundler@parisc-linux.org, deller@gmx.de,
	linux-parisc@vger.kernel.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081125025421.9745A4FB6@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Nov 24, 2008 at 9:54 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
> The segv looks to be in _dl_fixup at 0xf3b8 in /lib/ld.so.1.

The dynamic loader is sensitive to VM bugs, as are several of the
glibc tests. Too bad you probably can't run the glibc testsuite on
this kernel.

Given your earlier comments it would seen the segfault is not
reproducible and happens often and randomly?

The _dl_fixup routine is very complicated, and eventually responsible
for mapping in a new shared library. This could tickle any number of
VM bugs.

The only way I know how to solve this class of problem is to start
bisecting the kernel until it works again and determine what commit
made the stability worse.

$0.02.

I'm still organizing the new house Kristine and I are renting, and my
rack is only partly cabled up at this point. I'll try to get on that
ASAP so I can also have a look at the latest kernel.

Cheers,
Carlos.

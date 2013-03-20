From: Jeroen Roovers <jer@gentoo.org>
Subject: Re: PA8800 with 3.9.0-rc1-JeR-10942-g6dbe51c : WARNING: at
 lib/timerqueue.c:74
Date: Wed, 20 Mar 2013 20:34:37 +0100
Message-ID: <20130320203437.5e5359ac@marga.jer-c2.orkz.net>
References: <20130315152226.46ad0993@marga.jer-c2.orkz.net>
	<BLU0-SMTP3801FFE58A0BCC9C8836A597EE0@phx.gbl>
	<20130318135831.7c14b6e7@marga.jer-c2.orkz.net>
	<5148E903.1020105@gmx.de>
	<20130320182756.7b0e4f5d@marga.jer-c2.orkz.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: Helge Deller <deller@gmx.de>,
	John David Anglin <dave.anglin@bell.net>
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20130320182756.7b0e4f5d@marga.jer-c2.orkz.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 20 Mar 2013 18:27:56 +0100
Jeroen Roovers <jer@gentoo.org> wrote:

> > -# CONFIG_SLAB is not set
> > -CONFIG_SLUB=y
> > +CONFIG_SLAB=y
> > +# CONFIG_SLUB is not set
> > +# CONFIG_SLOB is not set

> All of the above are changed by just this change:

Except SLAB/SLOB/SLUB, of course.


      jer

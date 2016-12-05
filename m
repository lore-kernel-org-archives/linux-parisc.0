From: Jeroen Roovers <jer@gentoo.org>
Subject: Re: mmap problem in localedef
Date: Mon, 5 Dec 2016 22:17:03 +0100
Message-ID: <20161205221703.6f0620f2@rej.fritz.box>
References: <alpine.LRH.2.20.1612051330040.25582@math.ut.ee>
        <20161205181048.b2go7er5csdxekno@raspberrypi-2.musicnaut.iki.fi>
        <134f93f3-c4cb-8fd8-15b0-8b660a099338@bell.net>
        <alpine.LRH.2.20.1612052309450.4997@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: John David Anglin <dave.anglin@bell.net>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        linux-parisc@vger.kernel.org
To: Meelis Roos <mroos@linux.ee>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.20.1612052309450.4997@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, 5 Dec 2016 23:12:38 +0200 (EET)
Meelis Roos <mroos@linux.ee> wrote:

> > I think the local-shmlba.diff patch was removed but I can't check
> > at the moment.
> > https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=725508  

Perhaps Gentoo dropped that patch at some glibc version bump?

> Should have been upstreamed in 2014?

That precisely how Debian does not do and has never done things. Sadly.


     jer

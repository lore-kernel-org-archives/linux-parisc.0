From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Confusion in usr/include/asm-generic/fcntl.h
Date: Wed, 21 Jan 2009 17:43:34 -0500 (EST)
Message-ID: <20090121224335.099C94F30@hiauly1.hia.nrc.ca>
References: <20090121222522.GB15211@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: arnd@arndb.de, davem@davemloft.net, jaswinder@kernel.org,
	mingo@elte.hu, x86@kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090121222522.GB15211@colo.lackof.org> from "Grant Grundler" at Jan 21, 2009 03:25:22 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > CONFIG_64BIT on parisc user space looks very wrong.
> 
> This shouldn't be exported to user space. Is that what you meant?

This does get exported to user space as applications sometimes need
to know whether they are running under a 32 or 64-bit kernel.  See
config.guess.  However, it certainly would be wrong to use this
to make decisions about user space.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

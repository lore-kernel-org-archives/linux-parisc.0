From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: futex.c and EWOULDBLOCK vs. EAGAIN patch
Date: Sat, 15 May 2010 20:38:34 -0400 (EDT)
Message-ID: <20100516003835.362434E77@hiauly1.hia.nrc.ca>
References: <4BE86174.1080008@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org, carlos@systemhalted.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4BE86174.1080008@gmx.de> from "Helge Deller" at May 10, 2010 09:41:40 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Since PARISC is the only Linux architecture which has different values
> for EAGAIN and EWOULDBLOCK, we are running in various issues.
> 
> One of them is, that e.g. glibc checks for EAGAIN instead of EWOULDBLOCK
> (and vise versa) in nptl/pthread_mutex_trylock.c. This doesn't hurt
> other architectures, but it hurts parisc.

Glibc should be fixed so that it is complient with IEEE Std 1003.1.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

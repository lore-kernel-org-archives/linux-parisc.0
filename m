From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Kernel Panic during init with 2.6.29-gb609308 (fresh clone of git
Date: Sat, 2 May 2009 17:30:49 -0400 (EDT)
Message-ID: <20090502213050.502294EE8@hiauly1.hia.nrc.ca>
References: <7d01f9f00905021341h796fc3aan92693c3850055be8@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: T-Bone@parisc-linux.org (Thibaut VARENE)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <7d01f9f00905021341h796fc3aan92693c3850055be8@mail.gmail.com> from "Thibaut VARENE" at May 2, 2009 10:41:11 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

You might try building with the 4.1 branch.  I have had more luck
with it.

> For the sake of making this half less useless, it happened with a
> 64bit kernel (A500). ;^P
> 
> On Sat, May 2, 2009 at 9:04 PM, Thibaut VARENE <T-Bone@parisc-linux.org> wrote:
> > Fresh clone of kyle's parisc-2.6 master branch from kernel.org.
> >
> > Not much to say, it went AWOL during init while starting snmpd...
> >
> > I dunno if that's worth debugging tho, seems like everybody is using
> > 2.6.30 already (I must have misunderstood how to use git again :P)
> >
> > HTH
> >
> > Linux version 2.6.29-gb609308 (varenet@mkhppa3) (gcc version 4.2.4
> > (Debian 4.2.4-6)) #1 SMP Sat May 2 20:39:12 CEST 2009

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

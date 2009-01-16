From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [PATCH] Remove needless flush_dcache_page call
Date: Fri, 16 Jan 2009 10:34:29 -0700
Message-ID: <20090116173429.GA5628@colo.lackof.org>
References: <20090116052804.GA18737@barrios-desktop> <20090116053338.GC31013@parisc-linux.org> <20090116055119.GA6515@barrios-desktop> <20090116055927.GA22810@wotan.suse.de> <20090116060124.GG31013@parisc-linux.org> <20090116073413.GC22810@wotan.suse.de> <1232116101.3224.14.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Nick Piggin <npiggin@suse.de>, Matthew Wilcox <matthew@wil.cx>,
	linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1232116101.3224.14.camel@localhost.localdomain>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jan 16, 2009 at 09:28:21AM -0500, James Bottomley wrote:
...`
> They can be taken as checked luggage ... however, what Matthew means is
> that by being in Vancouver he's already in transit to Australia.
> However, we can give you access to the several remote test rings we
> have, either Cupertino (send ssh key to Rick Jones <raj@netperf.org> or
> Thiabut Var??ne <varenet@parisc-linux.org>)

Rick just gets me physical access when we have time to mess with the rack.

Kyle is correct that Nick still has a login to Cupertino ring though he
might need one of us to update his .ssh/authorized keys:
grundler@lp1000r:~$ finger nick
Login: npiggin                          Name: Nick Piggin
Directory: /home/npiggin                Shell: /bin/bash
Office Phone: +xx x xxxx xxxx
Last login Wed Aug  3 22:35 2005 (PDT) on pts/5 from 203-173-7-11.dyn.iinet.net.au
No mail.
No Plan.

IIRC, i gave him access to a "beefier" ia64 machine at the time (and those are
all still there too).

> I thought we also had a wiki page listing all the machines, but I can't
> find it.

    http://www.parisc-linux.org/cluster.html

I've intentionally left it unlinked from the main page.


> They all use the HP Guardian Service Processor console, which
> gives you remote console, power and all the other good things you need.

And most of the parisc machines are in a sorry state right now.
I'll update the web page with current state.

hth,
grant

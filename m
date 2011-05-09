From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [PATCH] Don't mlock guardpage if the stack is growing up
Date: Mon, 9 May 2011 22:08:41 +0100
Message-ID: <20110509210841.GB9253@agk-dp.fab.redhat.com>
References: <alpine.DEB.2.00.1105082045250.15552@artax.karlin.mff.cuni.cz> <BANLkTikEpaRZK3X4YReeQAwgcv3HAGUwSw@mail.gmail.com> <alpine.DEB.2.00.1105091246550.32299@artax.karlin.mff.cuni.cz> <4DC7D37F.9040308@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: Zdenek Kabelac <zkabelac@redhat.com>,
	Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-parisc@vg
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4DC7D37F.9040308@redhat.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, May 09, 2011 at 01:43:59PM +0200, Zdenek Kabelac wrote:
> Dne 9.5.2011 13:01, Mikulas Patocka napsal(a):
> > So, when LVM used mlockall, it consumed >100MB memory and it caused 
> > out-of-memory problems in system installers.

The way glibc and some distros have implemented locales makes mlockall()
quite useless for many purposes now in practice IMHO.  We discussed the
options at the time and wrote the extra code to implement the only
solution we were offered.

(1) There was no possibility of some distros not using a single locale
database (reasons: optimisation and packaging convenience);
(2) there was no possibility of glibc providing a mechanism to unmap the
locale database (if you reset your locale to the default glibc will not
unmap the file and indeed doesn't rule out doing something similar with
other files in future - these are glibc internals and it's none of our
business).

Alasdair



Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Fri, 20 Dec 2002 13:22:08 -0700
To: Gavin Hubbard <ghub005@xtra.co.nz>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] rp2430 questions
Message-ID: <20021220202208.GB13478@dsl2.external.hp.com>
References: <20021219020815.LKJS14518.web4-rme.xtra.co.nz@[127.0.0.1]>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021219020815.LKJS14518.web4-rme.xtra.co.nz@[127.0.0.1]>
From: grundler@dsl2.external.hp.com (Grant Grundler)
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Thu, Dec 19, 2002 at 03:08:15PM +1300, Gavin Hubbard wrote:
> The other difference is the PCI controller support - the rp2430 has two
> working PCI slots and two disabled slots which are enabled by the upgrade.

ok. I didn't know that.

> Since I don't actually know how the device disabling is done in hardware,
> I'm not convinced that parisc-linux will come up smoothly after
> I install the upgrade (I'm not worried about HP-UX - it will be fine).

Well, if you really end up with the equivalent to an rp2470, then
I can assure you there is a kernel out there that will work since
that's what several developers are using (including myself).

> Can anyone shed light on this?

I suspect the rp2430 PDC simply doesn't report one (or two) of the
PCI bus controllers. Neither HPUX nor parisc-linux will see those slots.
Very simple to implement and requires no HW changes.

grant

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Sun, 16 Feb 2003 01:31:10 -0700
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Watchdog on parisc?
Message-ID: <20030216083110.GC18888@dsl2.external.hp.com>
References: <20030214181124.GJ13355@lug-owl.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030214181124.GJ13355@lug-owl.de>
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

On Fri, Feb 14, 2003 at 07:11:24PM +0100, Jan-Benedict Glaw wrote:
> Hi!
> 
> I'm currently playing a bit with my B132L and 715. They're working quite
> nice, except that kernels aren't too stable (gcc-3.2, I'll do some more
> test compiles with gcc-3.0, too).

gcc-3.2.1 has a few bugs that have bitten us already (search mail
archive on "pty.c"). I'm not sure if it's better to stick with
gcc 3.0 or grab something that's bleeding edge (gcc 3.3.x).

> I've looked through the docs available if a watchdog is mentioned. In
> ./docs/platforms/b1xx-service.pdf there's a watchdog timeout error
> declared (during selftest) so I *think* there is a watchdog, isn't
> there?

I'm not sure what this is refering to. The CPU has some HW checking
that is a sort of watchdog but it's CPU internal and only the firmware
touches those.

> I've not yet seen a driver for it, nor have I seen any
> documentation. Is there a watchdog (and possibly some docu or an hpux
> vmunix to disassemble) so I could possibly write something better than
> softdog.c?

not if it's what I'm thinking of (transaction timeout, ie causes an
HPMC). This is a built-in HW feature. 

grant

From: Michal Hocko <mhocko@kernel.org>
Subject: Re: linux-next: Tree for Nov 7
Date: Tue, 14 Nov 2017 10:04:44 +0100
Message-ID: <20171114090444.lhrkuywuls26g6lu@dhcp22.suse.cz>
References: <20171107162217.382cd754@canb.auug.org.au>
 <CACPK8Xfd4nqkf=Lk3n6+TNHAAi327r0dkUfGypZ3TpR0LqfS4Q@mail.gmail.com>
 <20171108142050.7w3yliulxjeco3b7@dhcp22.suse.cz>
 <20171110123054.5pnefm3mczsfv7bz@dhcp22.suse.cz>
 <CACPK8Xe5uUKEytkRiszdX511b_cYTD-z3X=ZsMcNJ-NOYnXfuQ@mail.gmail.com>
 <20171113092006.cjw2njjukt6limvb@dhcp22.suse.cz>
 <20171113094203.aofz2e7kueitk55y@dhcp22.suse.cz>
 <87lgjawgx1.fsf@concordia.ellerman.id.au>
 <20171113120057.555mvrs4fjq5tyng@dhcp22.suse.cz>
 <87h8txw87w.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Joel Stanley <joel@jms.id.au>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        "James E.J. Bottomley" <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        "David S. Miller" <davem@davemloft.net>,
        Chris Zankel <chris@zankel.net>,
        Max Filippov <jcmvbkbc@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-mips@linux-mips.org,
To: Michael Ellerman <mpe@ellerman.id.au>
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <87h8txw87w.fsf@concordia.ellerman.id.au>
List-ID: <linux-next.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue 14-11-17 19:54:59, Michael Ellerman wrote:
> Michal Hocko <mhocko@kernel.org> writes:
[...]
> > So this was the most simple solution I could come up
> > with. If there was a general interest for MAP_FIXED_SAFE then we can
> > introduce it later of course. I would just like the hardening merged
> > sooner rather than later.
> 
> Sure. But in the scheme of things one more kernel release is not that
> big a deal to get it right. Given that the simple approach of dropping
> MAP_FIXED turns out to not be simple at all.

Well, my idea was to push this hardening to older kernels because those
were more vulnerable for the PIE base vs. stack placement and stack
controllable size from userspace etc... Anyway, as per [1] it seems that
the MAP_FIXED_SAFE doesn't look terrible from the backporting POV.

If there is a general consensus that this is the preferred way to go, I
will post the patch as an RFC to linux-api

[1] http://lkml.kernel.org/r/20171113160637.jhekbdyfpccme3be@dhcp22.suse.cz
-- 
Michal Hocko
SUSE Labs

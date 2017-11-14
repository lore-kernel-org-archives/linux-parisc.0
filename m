From: Khalid Aziz <khalid.aziz@oracle.com>
Subject: Re: linux-next: Tree for Nov 7
Date: Tue, 14 Nov 2017 07:52:25 -0700
Message-ID: <1510671145.4344.1.camel@oracle.com>
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
 <20171114090444.lhrkuywuls26g6lu@dhcp22.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Cc: linux-mips@linux-mips.org, Rich Felker <dalias@libc.org>,
 linux-sh@vger.kernel.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 "James
 E.J. Bottomley" <jejb@parisc-linux.org>, Max Filippov <jcmvbkbc@gmail.com>,
 sparclinux@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>,
 Russell King <linux@armlinux.org.uk>,
 Abdul Haleem <abdhalee@linux.vnet.ibm.com>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Joel Stanley <joel@jms.id.au>, linux-xtensa@linux-xtensa.org,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 linux-parisc@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
To: Michal Hocko <mhocko@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20171114090444.lhrkuywuls26g6lu@dhcp22.suse.cz>
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org

On Tue, 2017-11-14 at 10:04 +0100, Michal Hocko wrote:
> If there is a general consensus that this is the preferred way to go,
> I
> will post the patch as an RFC to linux-api
> 
> [1] http://lkml.kernel.org/r/20171113160637.jhekbdyfpccme3be@dhcp22.s
> use.cz

I prefer the new flag. It is cleaner and avoids unintended breakage for
existing flag.

--
Khalid

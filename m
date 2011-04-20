From: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
Subject: Re: [PATCH v3] mm: make expand_downwards symmetrical to expand_upwards
Date: Wed, 20 Apr 2011 11:57:48 +0900 (JST)
Message-ID: <20110420115804.461E.A69D9226@jp.fujitsu.com>
References: <20110420102314.4604.A69D9226@jp.fujitsu.com> <1303267733.11237.42.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: kosaki.motohiro@jp.fujitsu.com,
 Christoph Lameter <cl@linux.com>,
 Pekka Enberg <penberg@kernel.org>,
 Michal Hocko <mhocko@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>,
 Hugh Dickins <hughd@google.com>,
 linux-mm@kvack.org,
 LKML <linux-kernel@vger.kernel.org>,
 linux-parisc@vger.kernel.org,
 David Rientjes <rientjes@google.com>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <1303267733.11237.42.camel@mulgrave.site>
List-ID: <linux-mm.kvack.org>

> On Wed, 2011-04-20 at 10:23 +0900, KOSAKI Motohiro wrote:
> > > On Tue, 19 Apr 2011, James Bottomley wrote:
> > >=20
> > > > > Which part of me telling you that you will break lots of other =
things in
> > > > > the core kernel dont you get?
> > > >
> > > > I get that you tell me this ... however, the systems that, accord=
ing to
> > > > you, should be failing to get to boot prompt do, in fact, manage =
it.
> > >=20
> > > If you dont use certain subsystems then it may work. Also do you ru=
n with
> > > debuggin on.
> > >=20
> > > The following patch is I think what would be needed to fix it.
> >=20
> > I'm worry about this patch. A lot of mm code assume !NUMA systems=20
> > only have node 0. Not only SLUB.
> >=20
> > I'm not sure why this unfortunate mismatch occur. but I think DISCONT=
IG
> > hacks makes less sense. Can we consider parisc turn NUMA on instead?
>=20
> Well, you mean a patch like this?  It won't build ... obviously we need
> some more machinery
>=20
>   CC      arch/parisc/kernel/asm-offsets.s
> In file included from include/linux/sched.h:78,
>                  from arch/parisc/kernel/asm-offsets.c:31:
> include/linux/topology.h:212:2: error: #error Please define an appropri=
ate SD_NODE_INIT in include/asm/topology.h!!!
> In file included from include/linux/sched.h:78,
>                  from arch/parisc/kernel/asm-offsets.c:31:
> include/linux/topology.h: In function 'numa_node_id':
> include/linux/topology.h:255: error: implicit declaration of function '=
cpu_to_node'

Sorry about that. I'll see more carefully the code later. Probably long
time discontig-mem uninterest made multiple level breakage. Grr. ;-)



--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Fight unfair telecom internet charges in Canada: sign http://stopthemeter=
.ca/
Don't email: <a href=3Dmailto:"dont@kvack.org"> email@kvack.org </a>

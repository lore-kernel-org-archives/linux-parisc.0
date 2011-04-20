From: Pekka Enberg <penberg@kernel.org>
Subject: Re: [PATCH v3] mm: make expand_downwards symmetrical to expand_upwards
Date: Wed, 20 Apr 2011 10:34:23 +0300
Message-ID: <BANLkTimfpY3gq8oY6bPDajBW7JN6Hp+A0A@mail.gmail.com>
References: <20110420102314.4604.A69D9226@jp.fujitsu.com>
	<BANLkTi=mxWwLPEnB+rGg29b06xNUD0XvsA@mail.gmail.com>
	<20110420161615.462D.A69D9226@jp.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Christoph Lameter <cl@linux.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Michal Hocko <mhocko@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hugh Dickins <hughd@google.com>, linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>,
	linux-parisc@vger.kernel.org, David Rientjes <rientjes@google.com>,
	Ingo Molnar <mingo@elte.hu>, x86 maintainers <x86@kernel.org>
To: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110420161615.462D.A69D9226@jp.fujitsu.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi!

On Wed, Apr 20, 2011 at 4:23 AM, KOSAKI Motohiro
>> <kosaki.motohiro@jp.fujitsu.com> wrote:
>> > I'm worry about this patch. A lot of mm code assume !NUMA systems
>> > only have node 0. Not only SLUB.
>>
>> So is that a valid assumption or not? Christoph seems to think it is
>> and James seems to think it's not. Which way should we aim to fix it=
?
>> Would be nice if other people chimed in as we already know what Jame=
s
>> and Christoph think.

On Wed, Apr 20, 2011 at 10:15 AM, KOSAKI Motohiro
<kosaki.motohiro@jp.fujitsu.com> wrote:
> I'm sorry. I don't know it really. The fact was gone into historical =
myst. ;-)
>
> Now, CONFIG_NUMA has mainly five meanings.
>
> 1) system may has !0 node id.
> 2) compile mm/mempolicy.c (ie enable mempolicy APIs)
> 3) Allocator (kmalloc, vmalloc, alloc_page, et al) awake NUMA topolog=
y.
> 4) enable zone-reclaim feature
> 5) scheduler makes per-node load balancing scheduler domain
>
> Anyway, we have to fix this issue. =A0I'm digging which fixing way ha=
s least risk.
>
>
> btw, x86 don't have an issue. Probably it's a reason why this issue w=
as neglected
> long time.
>
> arch/x86/Kconfig
> -------------------------------------
> config ARCH_DISCONTIGMEM_ENABLE
> =A0 =A0 =A0 =A0def_bool y
> =A0 =A0 =A0 =A0depends on NUMA && X86_32

That part makes me think the best option is to make parisc do
CONFIG_NUMA as well regardless of the historical intent was.

                        Pekka
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

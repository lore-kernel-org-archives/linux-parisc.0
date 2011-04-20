From: Pekka Enberg <penberg@kernel.org>
Subject: Re: [PATCH v3] mm: make expand_downwards symmetrical to expand_upwards
Date: Wed, 20 Apr 2011 14:28:26 +0300
Message-ID: <BANLkTim+m-v-4k17HUSOYSbmNFDtJTgD6g@mail.gmail.com>
References: <20110420102314.4604.A69D9226@jp.fujitsu.com>
	<BANLkTi=mxWwLPEnB+rGg29b06xNUD0XvsA@mail.gmail.com>
	<20110420161615.462D.A69D9226@jp.fujitsu.com>
	<BANLkTimfpY3gq8oY6bPDajBW7JN6Hp+A0A@mail.gmail.com>
	<20110420112020.GA31296@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>,
	Christoph Lameter <cl@linux.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Michal Hocko <mhocko@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hugh Dickins <hughd@google.com>, linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>,
	linux-parisc@vger.kernel.org, David Rientjes <rientjes@google.com>,
	Ingo Molnar <mingo@elte.hu>, x86 maintainers <x86@kernel.org>
To: Matthew Wilcox <matthew@wil.cx>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110420112020.GA31296@parisc-linux.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Matthew,

On Wed, Apr 20, 2011 at 10:34:23AM +0300, Pekka Enberg wrote:
>> That part makes me think the best option is to make parisc do
>> CONFIG_NUMA as well regardless of the historical intent was.

On Wed, Apr 20, 2011 at 2:20 PM, Matthew Wilcox <matthew@wil.cx> wrote:
> But it's not just parisc. =A0It's six other architectures as well, so=
me
> of which aren't even SMP. =A0Does !SMP && NUMA make any kind of sense=
?

IIRC, we actually fixed SLAB or SLUB to work on such configs in the pas=
t.

On Wed, Apr 20, 2011 at 2:20 PM, Matthew Wilcox <matthew@wil.cx> wrote:
> I think really, this is just a giant horrible misunderstanding on the=
 part
> of the MM people. =A0There's no reason why an ARM chip with 16MB of m=
emory
> at 0 and 16MB of memory at 1GB should be saddled with all the NUMA gu=
nk.

Right. My point was simply that since x86 doesn't support DISCONTIGMEM
without NUMA, the misunderstanding is likely very wide-spread.

                       Pekka
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html

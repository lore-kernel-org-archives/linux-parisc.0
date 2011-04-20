From: Pekka Enberg <penberg@kernel.org>
Subject: Re: [PATCH v3] mm: make expand_downwards symmetrical to expand_upwards
Date: Wed, 20 Apr 2011 08:53:41 +0300
Message-ID: <BANLkTi=mxWwLPEnB+rGg29b06xNUD0XvsA@mail.gmail.com>
References: <1303249716.11237.26.camel@mulgrave.site>
	<alpine.DEB.2.00.1104191657030.26867@router.home>
	<20110420102314.4604.A69D9226@jp.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Christoph Lameter <cl@linux.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Michal Hocko <mhocko@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hugh Dickins <hughd@google.com>, linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>,
	linux-parisc@vger.kernel.org, David Rientjes <rientjes@google.com>
To: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110420102314.4604.A69D9226@jp.fujitsu.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Apr 20, 2011 at 4:23 AM, KOSAKI Motohiro
<kosaki.motohiro@jp.fujitsu.com> wrote:
> I'm worry about this patch. A lot of mm code assume !NUMA systems
> only have node 0. Not only SLUB.

So is that a valid assumption or not? Christoph seems to think it is
and James seems to think it's not. Which way should we aim to fix it?
Would be nice if other people chimed in as we already know what James
and Christoph think.

                        Pekka

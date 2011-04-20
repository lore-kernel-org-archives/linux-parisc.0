From: Christoph Lameter <cl@linux.com>
Subject: Re: [PATCH v3] mm: make expand_downwards symmetrical to
 expand_upwards
Date: Wed, 20 Apr 2011 09:07:50 -0500 (CDT)
Message-ID: <alpine.DEB.2.00.1104200906170.8634@router.home>
References: <20110420102314.4604.A69D9226@jp.fujitsu.com> <BANLkTi=mxWwLPEnB+rGg29b06xNUD0XvsA@mail.gmail.com> <20110420161615.462D.A69D9226@jp.fujitsu.com> <BANLkTimfpY3gq8oY6bPDajBW7JN6Hp+A0A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Michal Hocko <mhocko@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Hugh Dickins <hughd@google.com>, linux-mm@kvack.org,
	LKML <linux-kernel@vger.kernel.org>,
	linux-parisc@vger.kernel.org, David Rientjes <rientjes@google.com>,
	Ingo Molnar <mingo@elte.hu>, x86 maintainers <x86@kernel.org>,
	Tejun Heo <tj@kernel.org>
To: Pekka Enberg <penberg@kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BANLkTimfpY3gq8oY6bPDajBW7JN6Hp+A0A@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 20 Apr 2011, Pekka Enberg wrote:

> That part makes me think the best option is to make parisc do
> CONFIG_NUMA as well regardless of the historical intent was.

Another possilibity is to use SPARSEMEM instead? We can do the same for
the other arches that we have done to x86.



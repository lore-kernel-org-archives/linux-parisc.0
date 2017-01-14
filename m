From: Johannes Weiner <hannes@cmpxchg.org>
Subject: Re: [RFC PATCH 3/4] arch, mm: remove arch specific show_mem
Date: Sat, 14 Jan 2017 11:29:15 -0500
Message-ID: <20170114162915.GF26139@cmpxchg.org>
References: <20170112131659.23058-1-mhocko@kernel.org>
 <20170112131659.23058-4-mhocko@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	Mel Gorman <mgorman@suse.de>, David Rientjes <rientjes@google.com>,
	Michal Hocko <mhocko@suse.com>, Tony Luck <tony.luck@intel.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	Helge Deller <deller@gmx.de>,
	"David S. Miller" <davem@davemloft.net>,
	Chris Metcalf <cmetcalf@mellanox.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, linux-ia64@vger.kernel.org,
	linux-parisc@vger.kernel.org
To: Michal Hocko <mhocko@kernel.org>
Return-path: <owner-linux-mm@kvack.org>
In-Reply-To: <20170112131659.23058-4-mhocko@kernel.org>
List-ID: <linux-mm.kvack.org>

On Thu, Jan 12, 2017 at 02:16:58PM +0100, Michal Hocko wrote:
> From: Michal Hocko <mhocko@suse.com>
> 
> We have a generic implementation for quite some time already. If there
> is any arch specific information to be printed then we should add a
> callback called from the generic code rather than duplicate the whole
> show_mem. The current code has resulted in the code duplication and
> the output divergence which is both confusing and adds maintainance
> costs. Let's just get rid of this mess.
> 
> Cc: Tony Luck <tony.luck@intel.com>
> Cc: Fenghua Yu <fenghua.yu@intel.com>
> Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>
> Cc: Helge Deller <deller@gmx.de>
> Cc: "David S. Miller" <davem@davemloft.net>
> Cc: Chris Metcalf <cmetcalf@mellanox.com>
> Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>
> Cc: linux-ia64@vger.kernel.org
> Cc: linux-parisc@vger.kernel.org
> Signed-off-by: Michal Hocko <mhocko@suse.com>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>

--
To unsubscribe, send a message with 'unsubscribe linux-mm' in
the body to majordomo@kvack.org.  For more info on Linux MM,
see: http://www.linux-mm.org/ .
Don't email: <a href=mailto:"dont@kvack.org"> email@kvack.org </a>

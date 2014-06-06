From: Jason Low <jason.low2@hp.com>
Subject: Re: [PATCH 1/2] locking/rwsem: Add CONFIG_RWSEM_SPIN_ON_OWNER
Date: Fri, 06 Jun 2014 10:13:08 -0700
Message-ID: <1402074788.6680.50.camel@j-VirtualBox>
References: <1402070140-15090-1-git-send-email-davidlohr@hp.com>
	 <1402070140-15090-2-git-send-email-davidlohr@hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: peterz@infradead.org, mingo@kernel.org, mpatocka@redhat.com,
	torvalds@linux-foundation.org, waiman.long@hp.com,
	jejb@parisc-linux.org, paulmck@linux.vnet.ibm.com,
	dave.anglin@bell.net, aswin@hp.com, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org
To: Davidlohr Bueso <davidlohr@hp.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1402070140-15090-2-git-send-email-davidlohr@hp.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 2014-06-06 at 08:55 -0700, Davidlohr Bueso wrote:
> Just like with mutexes (CONFIG_MUTEX_SPIN_ON_OWNER),
> encapsulate the dependencies for rwsem optimistic spinning.
> No logical changes here as it continues to depend on both
> SMP and the XADD algorithm variant.
> 
> Signed-off-by: Davidlohr Bueso <davidlohr@hp.com>
> ---
>  include/linux/rwsem.h  | 4 ++--
>  kernel/Kconfig.locks   | 4 ++++
>  kernel/locking/rwsem.c | 2 +-
>  3 files changed, 7 insertions(+), 3 deletions(-)

Do we also want to add an #ifdef CONFIG_RWSEM_SPIN_ON_OWNER in
__init_rwsem() and in the optimistic spinning functions for rwsem-xadd?


Besides that:

Acked-by: Jason Low <jason.low2@hp.com>



From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH] parisc: led: Remove deprecated
 create_singlethread_workqueue
Date: Wed, 31 Aug 2016 10:05:56 -0400
Message-ID: <20160831140556.GF12660@htj.duckdns.org>
References: <20160830163343.GA25952@Karyakshetra>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
        linux-kernel@vger.kernel.org
To: Bhaktipriya Shridhar <bhaktipriya96@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20160830163343.GA25952@Karyakshetra>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Aug 30, 2016 at 10:03:43PM +0530, Bhaktipriya Shridhar wrote:
> The workqueue "led_wq" queues a single work item &led_task and hence
> doesn't require ordering. It is involved in managing when and which
> chassis LCD/LED gets updated and hence, is not being used on a memory
> reclaim path. Hence, it has been converted to use system_wq.
> 
> System workqueues have been able to handle high level of concurrency
> for a long time now and hence it's not required to have a singlethreaded
> workqueue just to gain concurrency. Unlike a dedicated per-cpu workqueue
> created with create_singlethread_workqueue(), system_wq allows multiple
> work items to overlap executions even on the same CPU; however, a
> per-cpu workqueue doesn't have any CPU locality or global ordering
> guarantee unless the target CPU is explicitly specified and thus the
> increase of local concurrency shouldn't make any difference.
> 
> The work item has been sync cancelled in led_halt to ensure that
> there are no pending tasks while disconnecting the driver.
> 
> Signed-off-by: Bhaktipriya Shridhar <bhaktipriya96@gmail.com>

Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun

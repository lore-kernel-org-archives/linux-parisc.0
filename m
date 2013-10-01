From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH] [workqueue] check values of pwq and wq in
 print_worker_info() before use
Date: Tue, 1 Oct 2013 18:47:02 -0400
Message-ID: <20131001224702.GB28618@mtj.dyndns.org>
References: <20131001203520.GA8248@p100.box>
 <20131001204352.GA27149@mtj.dyndns.org>
 <524B364B.3010405@gmx.de>
 <20131001210348.GB27149@mtj.dyndns.org>
 <20131001210735.GA27867@mtj.dyndns.org>
 <524B4E0D.9050107@gmx.de>
 <20131001224023.GA28618@mtj.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Libin <huawei.libin@huawei.com>, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20131001224023.GA28618@mtj.dyndns.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Oct 01, 2013 at 06:40:23PM -0400, Tejun Heo wrote:
> Because it is using probe_kernel_read() and such test wouldn't mean
> anything?  It may be NULL, it may be 1 or full Fs.  NULL is just one
> of many illegal pointers which may happen.  Why add code which doesn't
> achieve anything when you're explicitly trying to access pointers
> which you know could be invalid?  Why is that "clean"?  Is "if (p)
> kfree(p)" cleaner than "kfree(p)"?

Here's one general rule of thumb for "cleanliness" - try to do the
minimal because that's something many people can agree on.  If people
do stuff which aren't necessary, naturally different people would have
different opinions on what's cleaner / better and inevitably end up
with different choices as the choices made are functionally superflous
none would fail and we'll end up with various variants for the same
thing for no good reason, which is messy.  Adding if (p) in front of
probe_kernel_read(p) is inherently superflous and you wouldn't have
any way to enforce or even encourage such practice and the end result
would inevitably be if (p) being sprayed randomly, which is the
opposite of cleanliness.

So, no, please don't add random tests which aren't essential.  It is
inherently messy thing to do.

Thanks.

-- 
tejun

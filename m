From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH] [workqueue] check values of pwq and wq in
 print_worker_info() before use
Date: Tue, 1 Oct 2013 17:03:48 -0400
Message-ID: <20131001210348.GB27149@mtj.dyndns.org>
References: <20131001203520.GA8248@p100.box>
 <20131001204352.GA27149@mtj.dyndns.org>
 <524B364B.3010405@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Libin <huawei.libin@huawei.com>, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <524B364B.3010405@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Oct 01, 2013 at 10:53:31PM +0200, Helge Deller wrote:
> So, in summary my patch here is not really necessary, but for the sake of
> clean code I think it doesn't hurt either and as such it would be nice if
> you could apply it.

What? function *must* take any value and try to access it and not
cause failure.  That's the *whole* purpose of that interface.  How is
having incomplete spurious checks around it "clean code" in any sense
of the word?  That doesn't make any sense.

 Nacked-by: Tejun Heo <tj@kernel.org>

and *please* don't add any checks like that anywhere else in the
kernel.

Thanks.

-- 
tejun

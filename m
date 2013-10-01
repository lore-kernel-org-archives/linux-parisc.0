From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH] [workqueue] check values of pwq and wq in
 print_worker_info() before use
Date: Tue, 1 Oct 2013 17:07:35 -0400
Message-ID: <20131001210735.GA27867@mtj.dyndns.org>
References: <20131001203520.GA8248@p100.box>
 <20131001204352.GA27149@mtj.dyndns.org>
 <524B364B.3010405@gmx.de>
 <20131001210348.GB27149@mtj.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Libin <huawei.libin@huawei.com>, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20131001210348.GB27149@mtj.dyndns.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Oct 01, 2013 at 05:03:48PM -0400, Tejun Heo wrote:
> On Tue, Oct 01, 2013 at 10:53:31PM +0200, Helge Deller wrote:
> > So, in summary my patch here is not really necessary, but for the sake of
> > clean code I think it doesn't hurt either and as such it would be nice if
> > you could apply it.
> 
> What? function *must* take any value and try to access it and not
> cause failure.  That's the *whole* purpose of that interface.  How is
> having incomplete spurious checks around it "clean code" in any sense
> of the word?  That doesn't make any sense.

Just in case you didn't know already.  probe_kernel_read()'s role is
to take any ulong value and dereference it if it can.  If not, it can
return any value, but it shouldn't crash in any case.  If you're just
adding NULL test in probe_kernel_read(), you're just masking a common
failure pattern and the kernel still *will* panic while dumping the
states.  If a specific arch doesn't have proper probe_kernel_read()
implementation, adding if (!NULL) test there could be a temporary
workaround, but it should be clearly marked as such.

-- 
tejun

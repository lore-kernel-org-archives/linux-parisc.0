From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: what's parisc execve_wrapper doing in the end?
Date: Wed, 10 Oct 2012 05:26:21 +0100
Message-ID: <20121010042621.GA2616@ZenIV.linux.org.uk>
References: <20121004045150.GH23473@ZenIV.linux.org.uk>
 <1349343019.2706.3.camel@dabdike.int.hansenpartnership.com>
 <1349435268.3638.42.camel@dabdike.int.hansenpartnership.com>
 <1349444664.3638.46.camel@dabdike.int.hansenpartnership.com>
 <20121005144819.GO23473@ZenIV.linux.org.uk>
 <1349448936.3638.64.camel@dabdike.int.hansenpartnership.com>
 <20121005230441.GB2616@ZenIV.linux.org.uk>
 <1349695707.2615.38.camel@dabdike.int.hansenpartnership.com>
 <1349776521.2615.54.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1349776521.2615.54.camel@dabdike.int.hansenpartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Oct 09, 2012 at 10:55:21AM +0100, James Bottomley wrote:
> On Mon, 2012-10-08 at 12:28 +0100, James Bottomley wrote:
> > Even with the patch applied, it's hanging on boot around the first
> > kthread spawns.  I'm investigating.
> 
> Actually an obvious fix: you can't set up ksp and then zero the
> registers.
> 
> I note that the stack frame you're creating is too big since
> THREAD_SZ_ALGN includes space for a stack frame by design so adding
> another one is redundant.  However, this confusion seems to permeate the
> syscall code as well, so perhaps fixing it up later is better.
> 
> With this patch applied, I can now boot up successfully to a login
> prompt.

Thanks.  Folded and pushed with the rebase - it's in experimental-kernel_thread
pushed right now.  Should propagate to git.kernel.org shortly...

From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: what's parisc execve_wrapper doing in the end?
Date: Fri, 5 Oct 2012 20:21:33 +0100
Message-ID: <20121005192133.GA2616@ZenIV.linux.org.uk>
References: <20121004045150.GH23473@ZenIV.linux.org.uk>
 <1349343019.2706.3.camel@dabdike.int.hansenpartnership.com>
 <1349435268.3638.42.camel@dabdike.int.hansenpartnership.com>
 <1349444664.3638.46.camel@dabdike.int.hansenpartnership.com>
 <20121005144819.GO23473@ZenIV.linux.org.uk>
 <1349448936.3638.64.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1349448936.3638.64.camel@dabdike.int.hansenpartnership.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Oct 05, 2012 at 03:55:36PM +0100, James Bottomley wrote:

> But there's not a lot of point.  forking an idle thread actually doesn't
> care about any of the register execution setup because it never really
> uses it to execute.  That's why it was safe for us to use the user
> thread setup ... I suppose the interior of the kernel thread case could
> be conditioned on if (usp).

FWIW, I'm digging through the fork_idle() interplay with copy_thread()
right now and the more I'm looking the less I like having called
copy_thread() at all on that path.  Note that copy_process() can trivially
tell it from the normal (do_fork()) caller, just by checking if pid
is non-NULL.  And it has to check that anyway when it decides to generate
the pid for child...

Hell knows; I wonder how much of copy_thread() work is needed in that case...

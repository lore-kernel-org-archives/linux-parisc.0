From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: Stuck gnat1 processes
Date: Fri, 10 Jun 2011 06:37:19 -0600
Message-ID: <20110610123719.GD29089@parisc-linux.org>
References: <20110610013034.GA5353@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20110610013034.GA5353@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Jun 09, 2011 at 09:30:35PM -0400, John David Anglin wrote:
> As far as I can tell, all are stuck in the kernel.  Gdb can't step
> the code, nor do breaks on the next instruction ever get hit.  This
> may have something to do with the fact that the instruction is trying
> to read from text (C switch statement).

sysrq-l will show a backtrace for all CPUs.  That might be helpful in
diagnosing this problem.

-- 
Matthew Wilcox				Intel Open Source Technology Centre
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."

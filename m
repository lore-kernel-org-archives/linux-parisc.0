From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] crash without pim info
Date: Fri, 12 Aug 2005 19:52:16 -0600
Message-ID: <20050813015216.GD32609@colo.lackof.org>
References: <113446137@web.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Berthold Gunreben <b.gunreben@web.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <113446137@web.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Aug 12, 2005 at 04:22:50PM +0200, Berthold Gunreben wrote:
> Kernel panic - not syncing: BUG!

that's not much to go on. :^(

...
> I already upgraded the kernel to kernel 2.6.13-rc6-pa1 (compiled with gcc version 3.3.5).

John David Anglin seems to have uncovered what might be causing
such lock-ups on 2.6.13 kernels.  The discussion for this just started.
Can you follow that and try a new kernel once the fix is committed to CVS?

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

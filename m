Return-Path: <carlos@baldric.uwo.ca>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4B1C54844
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  6 Apr 2004 07:25:06 -0600 (MDT)
Date: Tue, 6 Apr 2004 09:21:58 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20040406132158.GP26344@baldric.uwo.ca>
References: <20040405174131.84BF1494194@palinux.hppa>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040405174131.84BF1494194@palinux.hppa>
Cc: James Bottomley <James.Bottomley@steeleye.com>
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 jejb
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Mon, Apr 05, 2004 at 11:41:31AM -0600, James Bottomley wrote:
> CVSROOT:	/var/cvs
> Module name:	linux-2.6
> Changes by:	jejb	04/04/05 11:41:31
> 
> Modified files:
> 	.              : Makefile 
> 	include/asm-parisc: cacheflush.h 
> 
> Log message:
> Fix our gdb breakpoint problem
> 
> Removing the full cache flush on non-current process access showed up a
> but in copy_to_user_page(), which is now fixed.
> 
> I also revoked the uselessly named
> 
> flush_icache_user_range()

What was the fix? Can you explain the change please? :)

The glibc test-suite almost completed without issue on the newest
kernel, though I saw a transient failure in one of the resolv tests, it
wasn't a failure in the test, but rather the test ran longer than 2
seconds and was killed. The test uses mtrace() and I've not been able to
duplicate the failure, the test should *not* have run over the
milisecond mark.  I wasn't running anything on the box at that point so
it worries me quite a bit. With the box up and running I'm no longer
able to trigger the slow behaviour that caused the timeout. Previous to
this I had run the entire compile + testsuite from a clean boot, I'll
see if doing that again triggers the failure. It might not be related to
anything you've done, I don't think I've ever run a glibc build and
testsuite from a cold boot... who knows what VM issues lurk?

c.

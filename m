From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] bitops.h: fls(unsigned long )
Date: Wed, 25 Aug 2004 16:10:43 -0400
Message-ID: <20040825201042.GX5207@baldric.uwo.ca>
References: <20040824164542.GR5207@baldric.uwo.ca>
	<412135A800004CFE@ocpmta3.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <412135A800004CFE@ocpmta3.freegates.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Aug 24, 2004 at 07:06:02PM +0200, Joel Soete wrote:
> And even a 64bit (using jejb 64bit lib :), just don't inline fls (if inline
> it does a segfault when finish)):
> 
> See attachment:
> bitops-tc3.c

Thanks! I'll check this out in 5 days, I'm very busy right now. If it
looks to work I'll check the test into out userspace test area.

Then I'll look at the kernel stuff.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

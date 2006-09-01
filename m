From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [PATCH] timer_interrupt and gettimeoffset.
Date: Fri, 1 Sep 2006 16:59:04 -0600
Message-ID: <20060901225904.GE4041@colo.lackof.org>
References: <119aab440608292148s4ee3ffb0xaac62a74c0f1403b@mail.gmail.com>
	<20060831065327.GG3999@colo.lackof.org>
	<20060901224825.GD4041@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060901224825.GD4041@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Sep 01, 2006 at 04:48:25PM -0600, Grant Grundler wrote:
> On Thu, Aug 31, 2006 at 12:53:27AM -0600, Grant Grundler wrote:
> > And I've hacked your version some more.
> > diff is below.
> 
> version #3: seems to be working fine on 64-bit SMP.
> 32-bit UP kernel is still under construction.
...
> gettimeoffset printk is busticated. I'll fix that in the next version.
> But it looks like wrapped values are causing problems.

Looks like only the printk is broken.

The attached test program (based on Guy's description) seems
to be working fine on 32-bit UP/b2600:
...
Time : 1157151360 sec, 106770 usec
Time : 1157151361 sec, 116765 usec
Time : 1157151362 sec, 126770 usec
Time : 1157151363 sec, 136764 usec
...

Note there is ~10ms shift on each "Time" output.
I believe this is because the task will run on the next
tick _after_ the 1 second time has expired.

hth,
grant


#include <stdio.h>
#include <sys/time.h>
#include <time.h>
main()
{
	struct timeval tv;

	while(gettimeofday(&tv, NULL) == 0) {
		printf("Time : %d sec, %d usec\n", tv.tv_sec, tv.tv_usec);
		sleep(1);
	}
}
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

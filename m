From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] more cpup.c results
Date: Wed, 5 Jan 2005 09:02:14 -0700
Message-ID: <20050105160214.GA24439@colo.lackof.org>
References: <20050105055412.68E06495698@palinux.hppa>
	<20050105061613.GA12455@colo.lackof.org>
	<1104914456.8221.34.camel@beavis>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Ryan Bradetich <rbradetich@uswest.net>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1104914456.8221.34.camel@beavis>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Jan 05, 2005 at 01:40:56AM -0700, Ryan Bradetich wrote:
> This is on a 64-bit kernel:
> $ uname -a
> Linux vega 2.6.10-pa3 #1 Sun Jan 2 14:28:36 MST 2005 parisc64 GNU/Linux
> 
> TEST 1
>           First Loop : min   9990  avg  11444  median  10352
>          Later Loops : min   6290  avg   8673  median   8885
...


thanks for the results!

> This is on a 32-bit kernel:
> $ uname -a
> Linux vega 2.6.10-pa5 #1 Wed Jan 5 01:14:00 MST 2005 parisc GNU/Linux
> 
> TEST 1
>           First Loop : min  10924  avg  11555  median  11090
>          Later Loops : min   7744  avg   8196  median   8130
>           First Loop : min   9584  avg  10251  median   9790
>          Later Loops : min   6451  avg   6836  median   6784
>           First Loop : min   9487  avg  10104  median   9673
>          Later Loops : min   6202  avg   6604  median   6550

Interesting that cpup3 is slightly faster than cpup2 with
the 32-bit kernel. Since user space is 32-bit always, I wouldn't
have expected a difference in "Later Loops" output.

> The K460 is a 8000 processor ... I'll see if I can get the K460
> installed and updated to give you results from that system as well.  I

Well, don't sweat it. Others might have PA8000 box already up and running.

> am also working on getting you results from a 715/100 
> as well (currently in the middle of a new debian install).

715 is PA1.1. cpup2/3 won't work there.
It would be worth trying variants of cpup0 (32-bit) scheduling
on PA1.1 machines. I'll leave that as an excercise for others.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

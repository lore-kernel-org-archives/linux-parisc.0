From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Improving performance of munmap
Date: Fri, 8 Oct 2004 11:35:01 -0600
Message-ID: <20041008173501.GA16958@colo.lackof.org>
References: <20041007230232.GF14151@tausq.org>
	<20041008020343.GN24430@baldric.uwo.ca>
	<20041008041657.GG14151@tausq.org>
	<20041008165926.GI14151@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041008165926.GI14151@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Oct 08, 2004 at 09:59:26AM -0700, Randolph Chung wrote:
> +#define FLUSH_THRESHOLD 0x80000 /* 0.5MB */
> +int parisc_cache_flush_threshold = FLUSH_THRESHOLD;

6 monthes or so ago Alex Williamson ran some perf tests comparing a
CONSTANT vs global when tuning the IOMMU page size on IA64 ZX1 chipsets.
IIRC, using a global was 3-5% slower if it was the same value as the constant.
I don't know if parisc will offer a similar performance difference and if so,
a per arch (PA11 vs PA20) should work fine for everything but PA8800.
It may not be a problem, just something to consider.

The rest looks "correct" to me - ie I don't see any obviously wrong.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

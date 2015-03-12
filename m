From: Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: BUG: non-zero nr_pmds on freeing mm: -1
Date: Thu, 12 Mar 2015 22:15:35 +0200
Message-ID: <20150312201535.GG587@fuloong-minipc.musicnaut.iki.fi>
References: <BLU436-SMTP11459F3D9DC424BE50626A797190@phx.gbl>
 <CADjby3WS3cJs2BOmYT4Cdr4i9FncD=BYjrkuQiBH3=VmOndRPw@mail.gmail.com>
 <BLU436-SMTP234E13E9344CBB4D18CEB0D97190@phx.gbl>
 <CAFk90B8ZRnte0K-r8EBacx_WEEEL4fpTLkkVVgj42s1HO6QhFA@mail.gmail.com>
 <BLU436-SMTP233C66DF7A4433DBEA2897997060@phx.gbl>
 <20150312193556.GE587@fuloong-minipc.musicnaut.iki.fi>
 <BLU436-SMTP114E0E2B73148E5EE40047897060@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Graham Gower <graham.gower@gmail.com>,
	Domenico Andreoli <cavokz@gmail.com>,
	linux-parisc List <linux-parisc@vger.kernel.org>,
	kirill@shutemov.name
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU436-SMTP114E0E2B73148E5EE40047897060@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi,

On Thu, Mar 12, 2015 at 03:51:11PM -0400, John David Anglin wrote:
> On 2015-03-12 3:35 PM, Aaro Koskinen wrote:
> >On Wed, Mar 11, 2015 at 08:21:35PM -0400, John David Anglin wrote:
> >>On 2015-03-11, at 7:31 PM, Graham Gower wrote:
> >>>I thought this patch was supposed to address the problem?
> >>>https://lkml.org/lkml/2015/2/26/230
> >>>
> >>>However, its not fixed it for me either in 4.0.0-rc3.
> >>I doubt the patch is correct for parisc. I believe the system where
> >>I saw the BUG messages has PT_NLEVELS == 3.
> >For 32-bit kernels, the fix helped.
> 32-bit kernels have PT_NLEVELS == 2.  I think the define needs to be moved
> outside #if/#endif
> but didn't get a chance to test last night.

Not sure if that would be correct. The fix disabled PMD accounting
on 32-bit kernels because that level does not exist, but on
64-bit you probably would need it? Maybe your bug is different.
Does it occur on every process exit, or just occasionally?
(On 32-bit every exit triggered it.)

A.

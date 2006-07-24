From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: Re: [parisc-linux] The problem on the PA8800 is all in the data-cache.
Date: Mon, 24 Jul 2006 00:15:59 -0400
Message-ID: <7d01f9f00607232115n18865924s4f07f64d84e45dce@mail.gmail.com>
References: <119aab440607221050w3b6a949j49862c2766d5c7ef@mail.gmail.com>
	<1153708426.1235.11.camel@mulgrave.il.steeleye.com>
	<7d01f9f00607231954m7b9992e8r6148bb26b7b461da@mail.gmail.com>
	<20060724033223.GE29603@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: James Bottomley <James.Bottomley@steeleye.com>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Matthew Wilcox" <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060724033223.GE29603@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 7/23/06, Matthew Wilcox <matthew@wil.cx> wrote:
> On Sun, Jul 23, 2006 at 10:54:38PM -0400, Thibaut VARENE wrote:
> > My take is that we see that bug so much more on pa8800 because of its
> > huge cache and thus because we hit cache much more often than on all
> > other machines...
>
> I don't think so.  pa8800 has less cache per core than pa8700.  The L2
> cache is ignorable for the purposes of this scenario, since it's
> transparent to software.

I don't think so :)

On B180, 1MB cache addon is "transparent" and the kernel doesn't see
it at all (/proc/cpuinfo doesn't even show it).

On pa8800, the kernel sees L2 (/proc/cpuinfo shows it) and computes
the flush routines based on L2 size, so I really don't understand how
it is transparent...

Which is why I'm making the point that either our cache flush
computations are wrong on pa8800 (and ggg says they aren't), or the L2
is /not/ transparent and what I said previously wrt huge cache size
should make some sense, shouldn't it?

HTH

T-Bone

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

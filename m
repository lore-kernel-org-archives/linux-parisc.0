From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [PATCH] timer_interrupt #5
Date: Fri, 8 Sep 2006 12:49:33 -0600
Message-ID: <20060908184933.GA24597@colo.lackof.org>
References: <119aab440608292148s4ee3ffb0xaac62a74c0f1403b@mail.gmail.com>
	<20060831065327.GG3999@colo.lackof.org>
	<20060901224825.GD4041@colo.lackof.org>
	<20060906062900.GC3448@colo.lackof.org>
	<44FF2A69.5040102@scarlet.be>
	<20060907001944.GA4407@colo.lackof.org>
	<450188D8.5000501@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Joel Soete <soete.joel@scarlet.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <450188D8.5000501@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Sep 08, 2006 at 03:14:32PM +0000, Joel Soete wrote:
> Cool
> (I tested with success the GM loop on my c110 (kernel up 32bit) and it 
> seems to works fine)

Excellent - thanks.

For the record, I 've been testing those patches on C3000 (no problems)
B2600 (HPMC in tulip_get_stats() from LED/LCD task), and A500 (no problems).
The C3000 (32-bit UP) and A500 (64-bit SMP) ran "make -j4" several days
in a loop with no problems or console output.

> right nothing related:
> I just did a tar/untar and already get:
> EXT3-fs error (device md2): ext3_readdir: bad entry in directory4Remounting 
> filesystem read-only

It would be best if you (re)started a new thread about this problem.
When I hit "^D" in the near future to clean up my inbox, this thread
will only exist (from my point of view) in the archives.

hth,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: Kyle McMartin <kyle@engsoc.org>
Subject: Re: [parisc-linux]      Heads up, 2.6.7-pa0 FTBS with 64-bit toolchain
Date: Mon, 21 Jun 2004 13:27:37 -0400
Message-ID: <20040621172737.GC28438@engsoc.org>
References: <200406200029.i5K0T1re007012@hiauly1.hia.nrc.ca>
	<200406200114.i5K1ESYp007238@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200406200114.i5K1ESYp007238@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Jun 19, 2004 at 09:14:28PM -0400, John David Anglin wrote:
> I would be interested in hearing if this solves the kernel build problem.
> The patch is for 3.5.  It might need a bit of hacking to apply it to
> earlier branches.
> 
Aye, it fixes the kernel compile! Hooray!

(I built 2.6.7-pa1 successfully on my c3000 with it, at least, building
SMP now to double check, and haven't booted)

Cheers,
-- 
Kyle McMartin
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

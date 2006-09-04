From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [PATCH] timer_interrupt and gettimeoffset.
Date: Mon, 4 Sep 2006 15:21:39 -0600
Message-ID: <20060904212139.GA12278@colo.lackof.org>
References: <1157385104.3513.11.camel@mulgrave.il.steeleye.com>
	<200609041657.k84GvPht025978@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: James Bottomley <James.Bottomley@SteelEye.com>,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200609041657.k84GvPht025978@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Sep 04, 2006 at 12:57:25PM -0400, John David Anglin wrote:
> There needs to be a check to ensure that the code has enough time
> to set cr16 with the new compare time before the counter passes this
> value.  If it misses, the counter will wrap.  This probably doesn't
> need to be a full half tick if it's desireable to avoid negative
> offsets.

Yes - I agree. I think this is the last bug in my code.
I'll just "skip" one tick in that case.
My guess is we'll never need more than a 0x1000 cycles
to read CR16, calculate the new "next_tick" and write CR16.

I picked 0x1000 because it very easy to test for: "if (x >> 12)...".

I'll review the your patch and see if I missed anything else
and then post version #4 (or #5?). Lost count.

grant

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] D370 questions
Date: Tue, 18 May 2004 15:23:50 -0600
Message-ID: <20040518212350.GC17051@colo.lackof.org>
References: <Pine.LNX.4.58.0405181414490.30894@brain.fop.ns.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Steve Bromwich <hppa@fop.ns.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <Pine.LNX.4.58.0405181414490.30894@brain.fop.ns.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, May 18, 2004 at 02:49:30PM -0300, Steve Bromwich wrote:
> Does anyone have any figures on how much power it really draws?

sorry no

> According to the sticker on the back it draws 9.2A@100V which sounds...
>  excessive, even with the 5
> drives in there. If I yank out some of the unnecessary cards (SCSI2 card,
> display card, what looks like a token ring card) will that make a
> noticeable difference to the draw?

I doubt scsi/token ring will draw that much power.
CPU, memory, disk drives, and high perf gfx cards are typically
consuming the most power.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

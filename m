From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Can't write to hard drives on a K200
Date: Wed, 11 Oct 2006 19:19:28 -0600
Message-ID: <20061012011928.GB18624@colo.lackof.org>
References: <J6B9MR$91CD8B56571F1770C341CEA677BE5E0B@scarlet.be>
	<200609290939.19381.mszick@morethan.org>
	<20060929145622.GM5017@parisc-linux.org>
	<200610111114.14135.mszick@morethan.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>,
 Matthew Wilcox <matthew@wil.cx>
To: "Michael S. Zick" <mszick@morethan.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200610111114.14135.mszick@morethan.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Oct 11, 2006 at 11:14:13AM -0500, Michael S. Zick wrote:
> Could you (or anyone on the list) eyeball the GSC scsi card(s) and
> see if they have their own crystal(s)? 
> Or are these controllers clocked by the GSC bus clock?
> 
> Expected would be a 40 or 80 Mhz crystal depending on the controller
> if not clocked by the card's bus.

The GSC bus and the SCSI bus are in independent frequency domains.
All logic on the board will be divided between those two zones.
My guess is the SCSI chip is bridging the two but I don't know that
for sure.

My point is the presence of the crystal is just to drive the clocking
on the SCSI Bus and probably doesn't tell us much about
which frequency domain any particular part is unless you
put an oscilloscope on the board

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

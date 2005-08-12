From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] [Alsa-devel] [PATCH] Support for AD1889 PCI
	Soundchip
Date: Thu, 11 Aug 2005 22:14:23 -0400
Message-ID: <20050812021423.GB14400__25104.6802419753$1416623887$gmane$org@roadwarrior.mcmartin.ca>
References: <Pine.HPX.4.33n.0508041503020.11474-100000@studcom.urz.uni-halle.de>
	<Pine.HPX.4.33n.0508111716090.21860-100000@studcom.urz.uni-halle.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: kyle@parisc-linux.org,
 alsa-devel@lists.sourceforge.net,
 parisc-linux@lists.parisc-linux.org,
 Thibaut VARENE <T-Bone@parisc-linux.org>
To: Clemens Ladisch <clemens@ladisch.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <Pine.HPX.4.33n.0508111716090.21860-100000@studcom.urz.uni-halle.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Aug 11, 2005 at 05:18:31PM +0200, Clemens Ladisch wrote:
> > This would make the interrupt handler much simpler, as it wouldn't
> > have to reprogram any registers.  And it would solve the problem that
> > the DMA accesses for one period go beyond the buffer when the number
> > of periods per buffer is not an integer.
> 
> ... something like this (please test):
> 

This doesn't apply against PA-RISC Linux CVS head (should have
no changes since submission) nor against ALSA CVS head... care to try
again? I don't have time to clean up the patch right now, it would
have to wait a week or so.

Cheers,
-- 
Kyle McMartin
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

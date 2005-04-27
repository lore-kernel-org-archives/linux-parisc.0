From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] ssm/rsm sequences
Date: Wed, 27 Apr 2005 14:17:44 -0600
Message-ID: <20050427201744.GE21784@colo.lackof.org>
References: <20050425165540.GD12325@colo.lackof.org>
	<200504251744.j3PHixu9015886@hiauly1.hia.nrc.ca>
	<20050427022925.GH2612@colo.lackof.org>
	<20050427052055.GJ2612@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: rhirst@levanta.com,
 parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050427052055.GJ2612@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Apr 26, 2005 at 11:20:55PM -0600, Grant Grundler wrote:
> On Tue, Apr 26, 2005 at 08:29:25PM -0600, Grant Grundler wrote:
> > The example code is just that, an example:
> > 	SSM	0,gr0	; initial RSM, SSM, or MTSM
> > ...
> > 
> > AFAICT, that sequence does nothing but burn some cycles.
> 
> *sigh*. The ssm 0,0/nop * 8/rsm sequence isn't so obvious.
> Richard Hirst added this comment to entry.S in 2001:
>         * The ssm is necessary due to a PCXT bug

Dave Anglin (offlist) pointed out it's part of the PA 2.0 Architecture:
| The first bullet in point 2., page F-4:
| 
|   The RSM or MTSM instruction which sets the PSW Q-bit (the clearing
|   RSM or MTSM) is preceded by another RSM, SSM, or MTSM instruction
|   which does not affect the Q-bit and which appears at least 8
|   instructions prior.

Kudos to Dave for being persistent. I had read this before but didn't
really understand what it said.

My copy of "PA-RISC 1.1 Architecture and Instruction Set" (3rd Edition,
Feb 1994) has change bars in front of the first two bullets on page 3-20.
This suggests it was added later - maybe after finding the "feature"
in PCX-T.

I've got research to do before moving forward with the
pcxt_ssm_bug patch.

thanks,
grant

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] ssm/rsm sequences
Date: Tue, 26 Apr 2005 23:20:55 -0600
Message-ID: <20050427052055.GJ2612@colo.lackof.org>
References: <20050425165540.GD12325@colo.lackof.org>
	<200504251744.j3PHixu9015886@hiauly1.hia.nrc.ca>
	<20050427022925.GH2612@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: rhirst@levanta.com
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050427022925.GH2612@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Apr 26, 2005 at 08:29:25PM -0600, Grant Grundler wrote:
> The example code is just that, an example:
> 	SSM	0,gr0	; initial RSM, SSM, or MTSM
> ...
> 
> AFAICT, that sequence does nothing but burn some cycles.

*sigh*. The ssm 0,0/nop * 8/rsm sequence isn't so obvious.
Richard Hirst added this comment to entry.S in 2001:
        * The ssm is necessary due to a PCXT bug

http://lists.parisc-linux.org/hypermail/parisc-linux-cvs/3628.html

Richard, any clue what the bug is?
I don't have a PCX-T ERS or errata sheet to look this up.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

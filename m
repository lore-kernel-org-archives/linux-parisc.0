From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] Measuring kernel compile times on smp system.
Date: Thu, 27 Oct 2005 21:55:23 -0500
Message-ID: <1130468124.9453.17.camel@mulgrave>
References: <1130389617.31977.16.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux@lists.parisc-linux.org
To: Ryan Bradetich <rbradetich@uswest.net>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1130389617.31977.16.camel@localhost.localdomain>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, 2005-10-26 at 23:06 -0600, Ryan Bradetich wrote:
> K460-smp(3):
> 	cold		44m36.961s	93m25.844s	35m37.427s
> 	warm		44m19.736s	93m9.127s	35m49.683s
> 
> K460-smp(4):
> 	cold		41m59.795s	114m6.654s	46m20.045s
> 	warm		41m39.792s	114m29.156s	46m6.385s

that's pretty bad 3->4 scaling.

Could you just check that you don't have irqbalanced running.  On a K or
D system, it would cause great inefficiencies in interrupt rethrowing.

Thanks,

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

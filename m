From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: godd news [[WasRe: [parisc-linux] but still panic: [WAS:
	2.6.10-rc1-pa15 boot fine	on n4k but still	annoying bactrace]]
Date: Thu, 09 Dec 2004 20:21:19 -0600
Message-ID: <1102645279.3814.1.camel@mulgrave>
References: <418A81310000E136@mail-7-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <418A81310000E136@mail-7-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, 2004-12-09 at 18:47 +0000, Joel Soete wrote:
> Now that's a bit more then 48h that loop is running on n4k with k-2.6.10-rc3-pa3
> (already rebuild 214 time ;-)

Well, this isn't necessarily good news.  I still think the problem is
triggered by a race in the signal code.  However, if its no longer
tripping, it means that the code has changed to obscure it ... which
means it's not going to get fixed until it shows up again.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

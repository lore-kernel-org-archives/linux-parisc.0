From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] is this a known hppa64-linux-ld bug?
Date: 11 Sep 2004 09:48:56 -0400
Message-ID: <1094910543.1714.5.camel@mulgrave>
References: <20040911091725.GM28659@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040911091725.GM28659@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, 2004-09-11 at 05:17, Randolph Chung wrote:
> does anybody have a suggestion for a workaround? 

I'm glad you didn't say "good" work around.  How about just building the
stub ourselves:

3:	ldil	L%2b,%r19
	ldo	R%2b(%r19),%r19
	bv,n	0(%r19)

This is certainly more efficient than the linker could ever do since we
know that even on LP64 the kernel lies under 4GB.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

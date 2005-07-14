From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] PA 2.0 float conversion to unsigned long long
Date: Wed, 13 Jul 2005 23:32:06 -0400
Message-ID: <20050714033206.GD4949@roadwarrior.mcmartin.ca>
References: <200507140253.j6E2ro4A022061@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200507140253.j6E2ro4A022061@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Jul 13, 2005 at 10:53:50PM -0400, John David Anglin wrote:
> The enclosed testcase derived from GCC PR 22474 aborts under linux but
> not under hpux.  The problem is the following insn:
> 
> 0x00002930 <f2ull+24>:  fcnv,t,sgl,udw fr22,fr22
> 

Might this be an insn that is not implemented in hardware, and
correctly being trapped on hpux, but not on Linux? I took a look
in arch/parisc/math-emu, but it's quite a bit more than I can handle. :)

Cheers,
-- 
Kyle McMartin
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: copy_user_page_asm suggested 64bit improvment [Was:
	[parisc-linux]	clear user page test]
Date: Thu, 30 Dec 2004 01:10:34 -0700
Message-ID: <20041230081034.GD31297@colo.lackof.org>
References: <418A80E8000124B5@mail-6-bnl.tiscali.it>
	<20041227073654.GI29492@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041227073654.GI29492@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Dec 27, 2004 at 12:36:54AM -0700, Grant Grundler wrote:
> Anyone know how many cycles ldd from L1 takes?

I found the answer for PCX-W CPU:
	The PCXW Data cache is a 4-way set associative 1 MB cache, split
	into two banks and interleaved on double word boundaries to allow
	two simultaneous uses of the cache. Each bank is further divided
	into independent tag and data ports, primarily to allow effective
	single cycle stores. The two tags hold identical information.
	Each port returns data in two cycles, but can start a new access
	every cycle.

I'll assume PA8[567]00 CPUs have similar if not identical behavior.
PA8800 may not and I'd be curious if anyone knows.

I've just committed a "simple" version that uses r19/20/21/22.
I've got another version that also uses r23/r24 but it didn't boot
and I didn't chase down why. It's possibly a HW bug with this particular
A500. I'll try it again.

Lamont tells me r23/24/28/29 are *caller* saves registers. 
Ie I could r28/29 as well (or instead of r23/24).

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

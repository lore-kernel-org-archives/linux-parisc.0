From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] 	Heads up,	2.6.7-pa0 FTBS with 64-bit toolchain
	+ loop
Date: Sat, 19 Jun 2004 22:59:10 +0000
Message-ID: <40D4C53E.5000309@tiscali.be>
References: <20040616194411.GB3412@baldric.uwo.ca>	<40D35B15.3040505@tiscali.be>
	<20040618212505.GA12572@engsoc.org>	<20040619011714.GC23535@colo.lackof.org>
	<20040619015455.GE12572@engsoc.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: Kyle McMartin <kyle@engsoc.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040619015455.GE12572@engsoc.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello all,

And there is also this pb mentionned by James:
<http://lists.parisc-linux.org/pipermail/parisc-linux/2004-February/022335.html>

regarding the pb of pointer comparison with gcc-3.3 and 3.4 64bits (sorry I didn't find back the gcc bug report reference) which 
iirc jda re-qualified it in a binutils pb. (That why of my interest in binutils 2.15 :) to see if I can help.)

That said, my very interest in 3.4 (and 3.5 now because is became the debian gcc-snapshot ;) ) is to continue the glibc-2.3.3 test 
and see if additional integer lib (hp one iirc) can help for the few test which still failled?

I was focused last month on my c110 ncr53c8xx bug; now I trust it is fixed, so jda if you think that I can be of better help else 
where I can always try to have a look ;). Please advise.

Joel




Kyle McMartin wrote:
> On Fri, Jun 18, 2004 at 07:17:14PM -0600, Grant Grundler wrote:
> 
>>Should I be testing 64-bit kernels built with this toolchain
>>or stick with my trusty gcc 3.0.4-hppa64 handmade debs?
>>
> 
> There's a bug in hppa64 gcc sometime after 3.0.4 (it shows up in the
> gcc-3.3-hppa64 and gcc-3.4-hppa64 debs) that causes builds to fail in
> (at least) loop.c.
> 
> http://gcc.gnu.org/bugzilla/show_bug.cgi?id=14782 is the bug Randolph
> filed.
> 
> I've been building hppa64 kernels with the gcc 3.0.4 debs on the FTP
> server, until this issue is resolved. :/
> 
> Regards,

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

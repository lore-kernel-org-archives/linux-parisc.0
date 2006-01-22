From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] [RFC] Updated glibc 2.3.5-8.1
Date: Sun, 22 Jan 2006 16:12:45 +0000
Message-ID: <43D3AEFD.6070406@tiscali.be>
References: <20060108030342.GA17559@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: Randolph Chung <tausq@debian.org>,
 parisc-linux@lists.parisc-linux.org
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060108030342.GA17559@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Carlos O'Donell wrote:
> Updated glibc 2.3.5-8.1
> 
> Contains the following extra fixes:
> 
> - Added relocation support for:
> 	= DIR21L, DIR14R, PLABEL21L, PLABEL21R.
> 
> - Fixed return value restore in syscall cancellation
> 
> - Probably messed up fpu code but made it more compliant
>   with the fr0 save/restore of T-bit.
> 
> - Removed implied routines for 128-bit long double, default
>   should be whatever gcc uses for long double (DFmode).
> 
> Update located:
> http://www.parisc-linux.org/~carlos/glibc-work/glibc-2.3.5-debs-2006-01-07/
> 
mmm, isn't it possible to add your .diff.gz (may be also .dsc),
that would help me a lot to countinue my test with gcc-4.0 ;-)

[...]
> 
> This is probably the patch set I will send upstream.
> 
TIA,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

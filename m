From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [parisc-linux] gcc-3.3 vs. 3.4
Date: Wed, 27 Apr 2005 19:35:53 -0400
Message-ID: <200504271935.53614.vapier@gentoo.org>
References: <20050427170020.GA496@baldric.uwo.ca>
	<20050427171532.GC496@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050427171532.GC496@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wednesday 27 April 2005 01:15 pm, Carlos O'Donell wrote:
> On Wed, Apr 27, 2005 at 01:00:20PM -0400, Carlos O'Donell wrote:
> > NOTE: dl_make_ftpr is actually compiled *into* the executable at this
> > point, since it's static and all the loader code is included.
>
> On second thought, I'm sure _dl_make_fptr from the dynamically loaded
> ld.so.1 is being used. So I'm not quite sure what distinguishes this
> case from any other, except that it crashes on the first call to
> _dl_make_fptr.

which basically looks like when you try to run the new ld.so it segfaults ?  
we've been testing just about every version of gcc-3.4 thus far on parisc and 
it has yet to build us a glibc w/out segfaults ;)
-mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

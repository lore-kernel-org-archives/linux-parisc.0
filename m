From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] Re: back to glibc-2.3.3 & gcc-3.4.1 pb
Date: Mon, 6 Sep 2004 15:57:05 -0400
Message-ID: <20040906195705.GM15721@baldric.uwo.ca>
References: <413B222D.8040601@tiscali.be>
	<200409060247.i862lvIU001539@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200409060247.i862lvIU001539@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Sep 05, 2004 at 10:47:57PM -0400, John David Anglin wrote:
> > > ../sysdeps/generic/unwind-dw2.c:1021: warning: 
> > > 'fallback_frame_state_for' defined but not used
> > > rtld.c:730: warning: implicit declaration of function 
> 
> This problem in serious and needs to be fixed.  The function
> fallback_frame_state_for is needed.  It is only called from an asm and
> gcc doesn't know about calls from asm's.

It will only become important the day we need dwarf2 compat.
That function is used as a fallback if 'frame_state_for' doesn't exist,
and if libgcc_s.so.1 doesn't include '__frame_state_for', in which case
we use a fallback onto the dwarf2 compat code in glibc.

In an sjlj environment fallback_frame_state_for just becomes abort if
the above tests fail, and hence there is an extra
fallback_frame_state_for that doesn't get used in the glibc build with
an sjlj compiler.

See libc/sysdeps/generic/framestate.c for the fixes I made to this file.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

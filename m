From: Carlos O'Donell <carlos@systemhalted.org>
Subject: [parisc-linux] Re: strtold
Date: Sat, 7 Jan 2006 19:18:36 -0500
Message-ID: <20060108001836.GV17559@baldric.uwo.ca>
References: <20060107235546.GU17559@baldric.uwo.ca>
	<200601080008.k0808n4E021273@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: tausq@debian.org,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200601080008.k0808n4E021273@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Jan 07, 2006 at 07:08:49PM -0500, John David Anglin wrote:
> > > Do you also have a fix for FP exception support?
> > 
> > Do you refer to the fenv_t align problems?
> 
> http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=327351.  Vaguely
> I thought that there might have been a similar issue in fesetexceptflag
> or feraiseexcept.

Two problems:

a) GCC optimizing away code.
	- Fixed by using struct and memory clobber.
b) Unaligned fenv_t
	- Fixed by copying to temporarily aligned structure.

Both patches are included in my new debian glibc package.
That is not to say that fpu/* code is correct, there were always
failures in the testsuite that come and go changing with time.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

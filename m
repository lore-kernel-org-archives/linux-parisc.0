From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] Re: hppa glibc 2.3.3
Date: Thu, 7 Oct 2004 11:29:00 -0400
Message-ID: <20041007152900.GU23260@baldric.uwo.ca>
References: <20041006045646.GJ23260@baldric.uwo.ca>
	<4161729B00001345@mail-1-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4161729B00001345@mail-1-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Oct 07, 2004 at 01:56:09PM +0200, Joel Soete wrote:
> Since the Oct 1, I try desperately to complete the glibc cvs build but without
> success:

a. Build an 'unstable' chroot. Enter the chroot.
b. apt-get build-dep glibc
c. Pull down glibc cvs head.
d. Apply the latest hppa patch set.
e. Build glibc.

I suggest the chroot method because it seems that you might have
problems with your environment. In particular I always try a chroot
build if something seems funny.

Cheers,
Carlos.


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

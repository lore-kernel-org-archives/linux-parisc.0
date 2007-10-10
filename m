From: Sam Ravnborg <sam@ravnborg.org>
Subject: [parisc-linux] parisc arch makefile clean-up needed [Was: cleaning
	up "make headers_install" for various architectures]
Date: Wed, 10 Oct 2007 20:42:25 +0200
Message-ID: <20071010184225.GA2470__43975.6532818594$1416624446$gmane$org@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

It helps when I use the right mailing list address..

	Sam

----- Forwarded message from Sam Ravnborg <sam@ravnborg.org> -----

Subject: parisc arch makefile clean-up needed [Was: cleaning up "make headers_install" for various architectures]
Sender: linux-kernel-owner@vger.kernel.org
From: Sam Ravnborg <sam@ravnborg.org>
Date:	Wed, 10 Oct 2007 20:38:58 +0200
User-Agent: Mutt/1.4.2.1i
To: "Robert P. J. Day" <rpjday@mindspring.com>,
	parisc-linux-request@lists.parisc-linux.org
Cc: Randy Dunlap <randy.dunlap@oracle.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <matthew@wil.cx>,
	Grant Grundler <grundler@parisc-linux.org>,
	Kyle McMartin <kyle@parisc-linux.org>
X-Mailing-List:	linux-kernel@vger.kernel.org

Added parisc mailing-listi and cc'ed parisc maintainers.

On Wed, Oct 10, 2007 at 01:26:16PM -0400, Robert P. J. Day wrote:
> On Wed, 10 Oct 2007, Randy Dunlap wrote:
> 
> > On Wed, 10 Oct 2007 12:44:58 -0400 (EDT) Robert P. J. Day wrote:
> >
> > >   the final example, parisc, just plain fails:
> > >
> > > $ make ARCH=parisc headers_install
> > > /home/rpjday/k/git/scripts/gcc-version.sh: line 16: hppa-linux-gcc: command not found
> > > /home/rpjday/k/git/scripts/gcc-version.sh: line 17: hppa-linux-gcc: command not found
> > > /home/rpjday/k/git/arch/parisc/Makefile:39: *** Sorry, GCC v3.3 or above is required..  Stop.
> >
> >
> > Try
> > $ make CROSS_COMPILE="" CC=gcc ARCH=parisc headers_install
> >
> > :(
> > ---
> > ~Randy
> 
> oh, i know how to get around it -- i was just thinking that it
> shouldn't *require* a workaround, that's all.  all of those previous
> warnings and errors are clearly due to the early part of the make
> testing for the appropriate arch-specific build tools without
> realizing that the make target doesn't *need* any of those things just
> to install headers.

parisc arch Makefile needs some love and care...

The logic selecting CROSS_COMPILE seems fishy and wrong -
the error reported by rday is obvious in this respect.

FINAL_LD is unused - kill it.

Building with oldpalo has been broken for a loong time - time to kill it?
Hint - the "cd ../palo" is not working as expected.
And use of TOPDIR is deprecated.

The libs-y assignment should learn from the other architectures how to
get the gcc lib filename:
$(shell $(CC) $(CFLAGS) -print-libgcc-file-name)


And this snippet is also wrong:
PALO := $(shell if which palo; then : ; \
	elif [ -x /sbin/palo ]; then echo /sbin/palo; \
	fi)

palo: vmlinux
	@if [ -x $PALO ]; then \


Make does not export variables so $PALO is not the same as $(PALO).
The latter should be used.

I did not supply a patch because I do not fully understand the
logic behind setting CROSS_COMPILE and 64BIT or not.
But I will be happy to review a patch to fix the issues in the
parisc Makefile.

	Sam

From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] Re: hppa glibc 2.3.3
Date: Fri, 8 Oct 2004 13:01:06 -0400
Message-ID: <20041008170106.GW24430@baldric.uwo.ca>
References: <41617557000010DC@mail-6-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <41617557000010DC@mail-6-bnl.tiscali.it>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Fri, Oct 08, 2004 at 08:00:53AM +0200, Joel Soete wrote:
> Sorry to be so lazy (just a bit tired, appologies), here are the ref to
> pfff, 'thuth is out there' :)

The only problem might exist if __errno_location does not return the
proper address of rltd_errno when RTLD_PRIVATE_ERRNO is defined. It
should. If it doesn't then our definition of
SYSCALL_ERRNO_HANDLER should change in that situation (away from
DEFAULT_SYSCALL_ERROR_HANDLER which is set to __errno_location).

All we want is that SYSCALL_ERRNO_HANDLER act as a function that returns
the address of an int, into which we write the syscall error value.

Read the code in:

libc/sysdeps/generic/errno-loc.c
libc/sysdeps/generic/errno.c
libc/sysdeps/unix/sysv/linux/hppa/sysdep.h

The last file defines the syscall wrappers and their usage of
SYSCALL_ERRNO_HANDLER.

c.


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

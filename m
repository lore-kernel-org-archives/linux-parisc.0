From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: [parisc-linux] Re: update mman.h in latest glibc cvs
Date: Fri, 25 Aug 2006 16:01:36 -0400
Message-ID: <119aab440608251301i8096348u60a567f795dc2ded@mail.gmail.com>
References: <200608250050.34940.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Mike Frysinger" <vapier@gentoo.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200608250050.34940.vapier@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 8/25/06, Mike Frysinger <vapier@gentoo.org> wrote:
> Carlos: for future hppa patches, would you prefer i send to libc-ports or to
> the parisc list ?
>
> this patch is against latest mman.h in the ports cvs ... the one in the parisc
> cvs is a little bit more outdated

I'm the libc-ports hppa maintainer, and posting to libc-ports is the
correct procedure. If you would like you can also CC parisc-linux to
keep people up to date on changes.

There are a couple of problems with your patch:
1. You need a ChangeLog.
2. You will need FSF assignments if you don't already have them for GLIBC.
3. Feel free to respond to the following..

The following is a bug.
+# define MAP_ANON	MAP_ANONYMOUS
+# define MAP_ANONYMOUS	0x10		/* don't use a file */

Please avoid superflous style changes.
-/* Advice to "madvise" */
+/* Advice to `madvise'.  */

Are you sure nothing uses these?
-#define MAP_VARIABLE	0
-# define MADV_VPS_PURGE	  6	/* Purge pages from VM page cache */
-# define MADV_VPS_INHERIT 7	/* Inherit parents page size */

Thanks for working on updating mman.h!
What we really need is people building glibc and debugging 'make -k
check' failures! :)

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] More from the TLS glibc front.
Date: Fri, 15 Apr 2005 10:33:11 -0400
Message-ID: <20050415143311.GN26980@baldric.uwo.ca>
References: <20050409050558.GL1833@baldric.uwo.ca>
	<20050410104403.GK6987@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050410104403.GK6987@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Apr 10, 2005 at 03:44:03AM -0700, Randolph Chung wrote:
> btw, Carlos, are you building glibc with linuxthreads or nptl when you
> enable TLS? If I use nptl I get a lot of build errors very early in the
> build process.

Disable nptl, we don't have the patches for that to work yet, since we
don't have a working futex prototype.

I am building with:

$SRC/$LIBC/configure --host=$ARCH-linux --build=$ARCH-linux
--target=$ARCH-linux --prefix=$GINSTALL --enable-add-ons=linuxthreads
--enable-tls --enable-__thread  --enable-all-warnings >&
../configure-$BUILDNAME-$ARCH.log

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

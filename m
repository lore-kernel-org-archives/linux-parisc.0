From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] gcc (3.3.5) causing problems in our latest kernel.
Date: Sun, 03 Apr 2005 18:56:28 -0500
Message-ID: <1112572589.5860.3.camel@mulgrave>
References: <1112564457.5858.7.camel@mulgrave>
	<20050403221332.GC18349@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050403221332.GC18349@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 2005-04-03 at 23:13 +0100, Matthew Wilcox wrote:
> Perhaps there's a difference between an inline function and a macro
> in terms of constant propagation?  If you turn __test_width() into
> a macro, it should work (see the implementation of __get_user() in
> asm-parisc/uaccess.h)

Yes, if I change it to a pure #define, everything works OK.

However, unless we can get the inline function to work, I still have to
go back to davem ... Do I just tell him we can't fix our toolchain, so
how about this?

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: seb@frankengul.org
Subject: Re: [parisc-linux] glibc is broken because of gcc
Date: Thu, 5 Jul 2007 16:22:23 +0200
Message-ID: <20070705142222.GA26105__4955.21510388262$1416624402$gmane$org@frankengul.org>
References: <4689855B.1000404@frankengul.org>
	<200707030158.l631wkrg003150@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org,
 aurelien@aurel32.net,
 debian-hppa@lists.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200707030158.l631wkrg003150@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon, Jul 02, 2007 at 09:58:45PM -0400, John David Anglin wrote:
[snip]
> 
> Looking at gcc PR 20218, it's clear that there are some very subtle
> issues here.  So, it's not clear to me where the problem lies.  It
> could be in glibc (hppa sysdep-cancel.h), binutils or gcc.  The handling
> of the visibility attribute was broken prior to HJL's change, so it
> could have exposed bugs in other packages.
> 
> Because of this, it was a mistake for Debian to backport this change.
> The change is only in the unreleased gcc trunk.
> 
> Since the problem was introduced by a gcc change, I'd start with
> a gcc PR and mention the patch that introduced the regression.
> 
> Could you do glibc builds with the gcc trunk before and after the change?
> It's best to base the PR on an unmodified version of gcc.

The test with the gcc-trunk (Main 4.3.0 head) shows the same error at the same place.
By the way, did I mention that the problem is not present if nptl is enabled ?

> 
> It would help to know the exact details of the linker command that
> fails, the assembler code generated for mq_timedreceive, and the
> __librt_multiple_threads symbols in __librt_multiple_threads librt.so.

Did you had a look at the info I sent you  (see my previous message) ?

What do you think of this ?

	Seb

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

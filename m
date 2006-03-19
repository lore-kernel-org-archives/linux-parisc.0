From: Hugh Dickins <hugh@veritas.com>
Subject: Re: [parisc-linux] Re: [fuse-devel] Example filesystem fail to init
	on parisc
Date: Sun, 19 Mar 2006 15:38:04 +0000 (GMT)
Message-ID: <Pine.LNX.4.61.0603191526250.4440__44236.7171323442$1416624589$gmane$org@goblin.wat.veritas.com>
References: <20060308071445.GA28275@pooh.bubble.frostnet.net>
	<E1FGwXn-0005Dh-00@dorka.pomaz.szeredi.hu>
	<20060309055002.GJ26474@pooh.bubble.frostnet.net>
	<E1FHKQR-0007JU-00@dorka.pomaz.szeredi.hu>
	<20060309223622.GP26474@pooh.bubble.frostnet.net>
	<E1FHfby-00052b-00@dorka.pomaz.szeredi.hu>
	<20060310230000.GX26474@pooh.bubble.frostnet.net>
	<E1FIlC6-0005ts-00@dorka.pomaz.szeredi.hu>
	<E1FJsHo-0006Yf-00@dorka.pomaz.szeredi.hu>
	<20060319043939.GP26474@pooh.bubble.frostnet.net>
	<1142750588.3773.26.camel@mulgrave.il.steeleye.com>
	<Pine.LNX.4.61.0603191033480.9273@goblin.wat.veritas.com>
	<1142777049.3240.6.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN;
  charset=US-ASCII
Cc: fuse-devel@lists.sourceforge.net,
 jick.nan@gmail.com,
 parisc-linux@parisc-linux.org,
 Chris Frost <chris@frostnet.net>,
 Miklos Szeredi <miklos@szeredi.hu>
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1142777049.3240.6.camel@mulgrave.il.steeleye.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, 19 Mar 2006, James Bottomley wrote:
> 
> Well, yes, I think fuse is guilty to some degree.  However, the same
> situation would prevail if anonymous memory were sent down to our other
> kernel<->user mapping routines, like SG_IO for instance.  Perhaps we
> should be doing early cow breaking for anonymous pages we know we're
> going to write to?

Certainly, that is part of what copy_to_user and get_user_pages(,,,,1,,,)
(and ordinary userspace writing) guarantee.  So if there's some new route
by which userspace pages may be modified on behalf of the user, never mind
the architecture-specific cache coherency issues, COWs must be broken to
preserve the semantics of fork.

drivers/scsi/sg.c looks like it makes all the necessary calls to
__copy_to_user or get_user_pages... but it's not hard to fool me.

Hugh
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

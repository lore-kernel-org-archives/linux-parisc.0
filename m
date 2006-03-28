From: Miklos Szeredi <miklos@szeredi.hu>
Subject: Re: [parisc-linux] Re: [fuse-devel] Example filesystem fail to
	init on parisc
Date: Tue, 28 Mar 2006 13:00:42 +0200
Message-ID: <E1FOBwI-0001TR-00__4339.19738648019$1416624591$gmane$org@dorka.pomaz.szeredi.hu>
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
	<Pine.LNX.4.61.0603191526250.4440@goblin.wat.veritas.com>
	<1142783191.3240.14.camel@mulgrave.il.steeleye.com>
	<Pine.LNX.4.61.0603191614210.4908@goblin.wat.veritas.com>
	<1142787049.3240.20.camel@mulgrave.il.steeleye.com>
Cc: akpm@osdl.org,
 miklos@szeredi.hu,
 fuse-devel@lists.sourceforge.net,
 chris@frostnet.net,
 jick.nan@gmail.com,
 hugh@veritas.com,
 davem@davemloft.net,
 parisc-linux@parisc-linux.org
To: James.Bottomley@SteelEye.com
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <1142787049.3240.20.camel@mulgrave.il.steeleye.com> (message from
	James Bottomley on Sun, 19 Mar 2006 10:50:48 -0600)
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Yes, I suspect our implementation should just sweep up anon pages
> again ... However, I'll also compose a mailing for linux-arch just to be
> sure we're all on the same page (no pun intended).

Hi James,

I've seen you submitted the needed API changes on lkml.  Do you also
have the parisc implementation for Chris to try out?

Thanks,
Miklos
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] Re: [fuse-devel] Example filesystem fail to init
	on parisc
Date: Tue, 28 Mar 2006 09:03:55 -0500
Message-ID: <20060328140355.GE9011__42438.6077830151$1416624591$gmane$org@quicksilver.road.mcmartin.ca>
References: <E1FJsHo-0006Yf-00@dorka.pomaz.szeredi.hu>
	<20060319043939.GP26474@pooh.bubble.frostnet.net>
	<1142750588.3773.26.camel@mulgrave.il.steeleye.com>
	<Pine.LNX.4.61.0603191033480.9273@goblin.wat.veritas.com>
	<1142777049.3240.6.camel@mulgrave.il.steeleye.com>
	<Pine.LNX.4.61.0603191526250.4440@goblin.wat.veritas.com>
	<1142783191.3240.14.camel@mulgrave.il.steeleye.com>
	<Pine.LNX.4.61.0603191614210.4908@goblin.wat.veritas.com>
	<1142787049.3240.20.camel@mulgrave.il.steeleye.com>
	<E1FOBwI-0001TR-00@dorka.pomaz.szeredi.hu>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: James.Bottomley@SteelEye.com,
 akpm@osdl.org,
 fuse-devel@lists.sourceforge.net,
 chris@frostnet.net,
 jick.nan@gmail.com,
 hugh@veritas.com,
 davem@davemloft.net,
 parisc-linux@parisc-linux.org
To: Miklos Szeredi <miklos@szeredi.hu>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <E1FOBwI-0001TR-00@dorka.pomaz.szeredi.hu>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Mar 28, 2006 at 01:00:42PM +0200, Miklos Szeredi wrote:
> Hi James,
> 
> I've seen you submitted the needed API changes on lkml.  Do you also
> have the parisc implementation for Chris to try out?
>

He committed it to cvs... I should have it divvied up and sent
to Linus by the weekend. In the meantime, try this patch against
2.6.16 (which is the parisc patchset) 
http://cvs.parisc-linux.org/download/linux-2.6/patch-2.6.16-pa8.gz 

Cheers,
	Kyle
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

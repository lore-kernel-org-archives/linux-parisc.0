From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] binutils breaks hppa kernel build,
Date: Sat, 24 Sep 2005 23:24:31 -0400 (EDT)
Message-ID: <200509250324.j8P3OVYQ003335__13234.2372010045$1416623925$gmane$org@hiauly1.hia.nrc.ca>
References: <20050925014906.GC29038@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: 329888@bugs.debian.org,
 parisc-linux@lists.parisc-linux.org
To: matthew@wil.cx (Matthew Wilcox)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050925014906.GC29038@parisc-linux.org> from "Matthew Wilcox"
	at Sep 24, 2005 07:49:06 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> On Sat, Sep 24, 2005 at 09:27:22PM -0400, John David Anglin wrote:
> > The last "fic" opcode entry is wrong.  It's using the wrong
> > instruction format, the mask is wrong, pa10 is wrong, etc.
> 
> I don't think we realised this until now.  I suspect we've been
> silently emitting bad code up until this point, and given that it's
> in flush_kernel_icache_page, maybe it explains some of our occasional
> crashes.
> 
> The code was previously:
> 
>         fic,m           %r23(%r26)

I've committed a fix to binutils head.  The above should now be
accepted when generating PA 2.0 code.  However, I'd probably
avoid using this feature for awhile.  It looks like the bug has
been present since ~ 1996.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

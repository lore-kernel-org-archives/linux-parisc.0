From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] Firefox/Mozilla patches
Date: Sun, 19 Dec 2004 17:52:46 -0500
Message-ID: <20041219225246.GG25304@baldric.uwo.ca>
References: <Pine.GSO.4.58.0412172254550.1196@panter.stud.ntnu.no>
	<20041219203417.GE25304@baldric.uwo.ca>
	<Pine.GSO.4.58.0412192218090.4208@panter.stud.ntnu.no>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@parisc-linux.org
To: Ivar <orskaug@stud.ntnu.no>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <Pine.GSO.4.58.0412192218090.4208@panter.stud.ntnu.no>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Dec 19, 2004 at 10:53:09PM +0100, Ivar wrote:
> As of now the patch is still very experimental - I'll devote some more
> spare time for this during christmas.
> 
> Recently, I've also done some naive attemts to port the Xorg/XFree mga
> driver to parisc - with the exception of a few minor bugs (displacement of
> the HW accelerated cursor), it works OK - so, I have my hopes up for this
> too :)
> 
> However, a biggerproblem with Xorg (as I see it) is that it's not
> natively ported to parisc.

I haven't built the Xorg tree yet, still using XFree86 until I have some
free time. What loader is the Xorg tree using? I assume it still has the
builtin ELF loader with symbol hacks? In which case you need to do
relocation handling, and we never ported this :)

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

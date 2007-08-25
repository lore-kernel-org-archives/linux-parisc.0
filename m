From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] parisc v2.6.23-rc3-pa1
Date: Sat, 25 Aug 2007 10:31:13 -0400
Message-ID: <20070825143113.GA22243__35077.246258925$1416624429$gmane$org@fattire.cabal.ca>
References: <46CFBE2D.8070507@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: parisc-linux@lists.parisc-linux.org
To: Joel Soete <soete.joel@scarlet.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <46CFBE2D.8070507@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Aug 25, 2007 at 05:29:17AM +0000, Joel Soete wrote:
> Hello Kyle,
> 
> I didn't test this patch but your linux-2.6-snaps.git (release 2.6.23-rc3-git5) and this boot fine on my b2k as 32bit built 
> kernel.
> 
> Great job ;<)
> 

Thanks, I've got a few patches that need to go in (getdents fix mostly)
but right now I'm tracking a null ptr dereference in the unwinder that
shows up on 64-bit SMP when udev starts.

(Of course, you don't need the getdents patch for 32-bit, so you should
be fine just running the -git snaps.)

Cheers,
	Kyle
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

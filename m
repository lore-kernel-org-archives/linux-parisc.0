From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] J2240 - Almost there....
Date: Wed, 4 Jan 2006 11:18:54 -0700
Message-ID: <20060104181854.GE20079@colo.lackof.org>
References: <7d01f9f00601010615v54117490o9a575fd279244524@mail.gmail.com>
	<000401c61003$cea58c60$3401a8c0@POGO>
	<20060104174332.GB20079@colo.lackof.org>
	<20060104174943.GP19769@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060104174943.GP19769@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Jan 04, 2006 at 10:49:43AM -0700, Matthew Wilcox wrote:
...
> > 0000:00:03.0 is tulip in slot 3.
> > 0000:01:14.0 is tulip built-in. (my guess)
> 
> I disagree.  The 'Cujo' on GSC bus 8 is actually a Dino.  As I said
> in my earlier mail, I've now fixed this.

I couldn't tell if the names were wrong offhand - needed ioscan output
(got it) and compare. Thanks for fixing this.

> So I think eth0 (00:03.0) is actually the built-in one.

I think I got this right despite PCI controller names.
Workstations typically hardwired the PCI slot to use the same device
number (e.g. 3) as what is silk screened on the back of the machine.
Built-in devices were typically given numbers much greater than the
highest slot number.

Servers never did this just because that scheme doesn't work multi-cell
systems with > 32 PCI slots (e.g. superdome) or multiple IO bays with
identical silk screened slot numbers.

thanks,
grant

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

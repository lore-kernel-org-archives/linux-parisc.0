From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [parisc-linux] www.parisc-linux.org crashed
Date: Fri, 16 Jul 2004 23:15:14 -0400
Message-ID: <200407162315.14273.vapier@gentoo.org>
References: <20040716031951.GB27175@colo.lackof.org>
	<1089986393.2098.20.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1089986393.2098.20.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Friday 16 July 2004 09:59 am, James Bottomley wrote:
> On Thu, 2004-07-15 at 22:19, Grant Grundler wrote:
> > Hi,
> > www.parisc-linux.org crashed earlier today running a 2.4.25 kernel.
> > I happened to be around and recovered the console.
> > Appended below in case someone wanted to poke at it a bit or can
> > tell me this is a known problem.
>
> It looks like a usual ext3 panic precipitated by a disc I/O error.  What
> were the SCSI logs before this?

yeah, the only time ive seen those kind of errors are when there was actual 
hardware failure ... a reboot would 'remedy' the situation :)

ive seen this on x86 (when the hd loses power temporarily) and on hppa (when 
using a semi-crappy external scsi disc)
-mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

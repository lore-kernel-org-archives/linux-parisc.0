From: Guy Martin <gmsoft@tuxicoman.be>
Subject: Re: [parisc-linux] K410 SCSI 53c700 issue with PLEXTOR PX-R820T
Date: Thu, 30 Nov 2006 19:48:30 +0100
Message-ID: <20061130194830.90043d05.gmsoft__4027.21598879925$1416624626$gmane$org@tuxicoman.be>
References: <20061112160350.8b7d4afd.gmsoft@tuxicoman.be>
	<20061112191436.GY16952@parisc-linux.org>
	<20061127115832.b413fd7b.gmsoft@tuxicoman.be>
	<20061127153713.GQ14076@parisc-linux.org>
	<20061130101805.2a82273b.gmsoft@tuxicoman.be>
	<1164907064.22826.23.camel@mulgrave.il.steeleye.com>
	<1164910427.22826.37.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: Matthew Wilcox <matthew@wil.cx>,
 parisc-linux@parisc-linux.org
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1164910427.22826.37.camel@mulgrave.il.steeleye.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


Hi James,

This is working fine ! Thanks a lot !

I was able to mount a cd without any pb.

Cheers,
  Guy

On Thu, 30 Nov 2006 13:13:46 -0500
James Bottomley <James.Bottomley@SteelEye.com> wrote:

> On Thu, 2006-11-30 at 12:17 -0500, James Bottomley wrote:
> > And here we get a phase mismatch in the command phase because the drive
> > transitions to data phase after six bytes and the driver still thinks it
> > has another four to send.
> > 
> > I'd have the maintainer shot ... he clearly forgot to set up the command
> > length for auto request sense.
> 
> Try this and see if it fixes the problem
> 
> James

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

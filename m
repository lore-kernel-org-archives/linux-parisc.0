Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep14-int.chello.at (viefep14-int.chello.at [213.46.255.13])
	by dsl2.external.hp.com (Postfix) with ESMTP id C9A354834
	for <parisc-linux@lists.parisc-linux.org>; Thu, 13 Jun 2002 14:26:29 -0600 (MDT)
Message-ID: <3D090009.CB2EF7B7@gmx.at>
Date: Thu, 13 Jun 2002 22:26:49 +0200
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] SCSI driver for E-class servers - SPIFI ?
References: <Pine.LNX.4.44.0206122318230.3448-100000@sal.ucc.ie>
Content-Type: text/plain; charset=us-ascii
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Thanks, for the answers.

I never thought, the SE stands here for the single ended, I know the 
difference between SE and differential.

BTW: It's me, who wrote the MUX console support, and this is already
checked in into the Linux tree (for half an year now). 
But I am interested in having a full device support....

Christoph P.



"M. Grabert" wrote:
> 
> On Wed, 12 Jun 2002, Christoph Plattner wrote:
> 
> > Sorry, that I am not so "deep" in the HP device knowledge, can you give
> > me sime hints !
> >
> > HP-BP is this a HP bus system ?
> 
> Yes, it's the HP Precision Bus (aka NIO). AFAIK it's mainly used in the
> (very) old servers, like F10. I don't know what the current status of
> support
> is, but it used to be unsupported (no docu ?).
> 
> (hint: www.parisc-linux.org ->glossary, mailing list archive)
> 
> > Is this used in the E55 (or similar) ?
> 
> Yes. Although (regarding to www.openpa.net) something like a modified
> version.
> 
> (hint: www.openpa.net, www.google.com, www.parisc-linux.org ->hardware
> database)
> 
> > Is the "SE" SCSI that one in the E55 (what stands "SE" for) ?
> 
> SE stands for SingleEnded and reffers to how the SCSI device is connected
> (signalling etc.). It's the "normal" SCSI (unlike LVD,
> LowVoltageDifferential), used in SCSI-I and SCSI-II (narrow)
> 
> > What is SDTR ?
> 
> It's the signal send on the scsi bus to negotiate syncronous data
> transfer (or asynchronous sent with a REQ/ACK) if they support it.
> 
> > Sorry, but I am interested in that stuff, and I know, I can help after
> > initial steps. Some weeks ago, I rewrote an ethernet driver of an
> > not-well known chip on an VAX termianl for VAX Linux. So after some
> > hacking days (or better nights), there will be real progress.
> >
> > So I am interested in helping here.
> 
> nice :)
> 
> > Sorry for this question again:
> > What is the status of the MUX. As far I can remember, you started to
> > write on this driver. Is this correct ?
> 
> Perhaps s.o. can answer this question. AFAIK somebody is indeed writing
> on it and has succeded to use the console port on the MUX.
> 
> geretings max

-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at

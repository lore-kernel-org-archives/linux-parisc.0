Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web12507.mail.yahoo.com (web12507.mail.yahoo.com [216.136.173.199])
	by dsl2.external.hp.com (Postfix) with SMTP id 291B64834
	for <parisc-linux@lists.parisc-linux.org>; Fri, 25 Oct 2002 18:00:18 -0600 (MDT)
Message-ID: <20021026000014.4733.qmail@web12507.mail.yahoo.com>
Date: Fri, 25 Oct 2002 17:00:14 -0700 (PDT)
From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Subject: Re: [parisc-linux] 735/125 Wide Diff scsi 
To: Grant Grundler <grundler@dsl2.external.hp.com>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Richard Nairn <richard@nairnconsulting.ca>,
	taggart@carmen.fc.hp.com, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20021025005035.AB3E74852@dsl2.external.hp.com>
MIME-Version: 1.0
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

So my C180 has a different HVD controller chip than the 735?

derek

--- Grant Grundler <grundler@dsl2.external.hp.com> wrote:
> "John David Anglin" wrote:
> > > Is there any approx time for the WD driver? I have about 60G I
> can put on
> > > my machine if it works.. Will it work if It gets plugged in the
> SE Chain?
> > 
> > No.  It may cause damage.
> 
> Not true.
> Mixing SE and HVD devices on a SCSI bus will result in the interface
> chips "tri-stating". ie no one can talk on the bus. But nothing
> smokes
> either - at least not for the HP product testing I was involved with
> several years ago.
> 
> > There was a question about the WD driver not too long ago.  You
> could search
> > for the answer but I believe only hpux supports the WD interface at
> this
> > time.
> 
> And that's going to get dropped soon too.
> Last product to support HVD is based on Sym53c876 chip.
> The interface cards are supported on new IA64 machines
> but I'm not sure one can purchase them or purchase HVD disks.
> 
> > You may be able to add a newer LVD to the SE chain and have it
> > work.  I'm not sure if it could be used as a boot device though.
> 
> The LVD should work fine as a boot device in SE mode.
> LVD devices talk SE like any other SE device (AFAIK).
> 
> grant
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


__________________________________________________
Do you Yahoo!?
Y! Web Hosting - Let the expert host your web site
http://webhosting.yahoo.com/

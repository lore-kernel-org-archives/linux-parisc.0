Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel11.hp.com (palrel11.hp.com [156.153.255.246])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6BDC6482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 31 Jan 2003 13:47:56 -0700 (MST)
Reply-To: <jim.hull@hp.com>
From: "Jim Hull" <jim.hull@hp.com>
To: "'Grant Grundler'" <grundler@dsl2.external.hp.com>,
	"'John David Anglin'" <dave@hiauly1.hia.nrc.ca>
Cc: <bug-binutils@gnu.org>, <parisc-linux@lists.parisc-linux.org>
Subject: RE: [parisc-linux] PATCH hppa ordered load absolute ops
Date: Fri, 31 Jan 2003 12:47:55 -0800
Message-ID: <005401c2c96a$07f55470$6763f40f@cup.hp.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
In-Reply-To: <20030131191845.GA30799@dsl2.external.hp.com>
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

I checked, and John's encodings are correct.

 -- Jim

> -----Original Message-----
> From: parisc-linux-admin@lists.parisc-linux.org 
> [mailto:parisc-linux-admin@lists.parisc-linux.org] On Behalf 
> Of Grant Grundler
> Sent: Friday, January 31, 2003 11:19 AM
> To: John David Anglin
> Cc: bug-binutils@gnu.org; parisc-linux@lists.parisc-linux.org
> Subject: Re: [parisc-linux] PATCH hppa ordered load absolute ops
> 
> 
> On Fri, Jan 31, 2003 at 11:11:26AM -0500, John David Anglin wrote:
> > > +{ "ldda",	0x0c003100, 0xfc1ff3d0, "cocc@(b),t", 
> pa20, FLAG_STRICT},
> > ?		0x0c001120, 0xfc1ff3e0
> > 
> > Shouldn't a=0, m=1 and im5=0?
> 
> yes - I thought I did that.
> I laid out the bits on paper and then converted to hex.
> I'll review tonight but trust you can get them right :^)
> 
> thanks,
> grant
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 

Return-Path: <deller@gmx.de>
Received: from mail.gmx.net (imap.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 2B4414855
	for <parisc-linux@lists.parisc-linux.org>;
	Fri,  9 Jan 2004 12:14:03 -0700 (MST)
From: Helge Deller <deller@gmx.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: [PATCH] 2.4.24-pre3 obmouse driver for HP
	OB600 C/CT laptop
Date: Fri, 9 Jan 2004 20:14:01 +0100
References: <20040105052059.GA612@colo.lackof.org>
	<20040109055534.GA5393@colo.lackof.org>
	<200401092004.47265.deller@gmx.de>
In-Reply-To: <200401092004.47265.deller@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200401092014.01848.deller@gmx.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Sorry, this mail was meant to go to Grant directly....

Helge

On Friday 09 January 2004 20:04, Helge Deller wrote:
> On Friday 09 January 2004 06:55, Grant Grundler wrote:
> > On Mon, Jan 05, 2004 at 03:26:26PM +0100, Helge Deller wrote:
> > > With the input-driver you can directly give the absolute coordinates
> > > (no need to do conversion yourself),
> > 
> > I looked at Documentation/input/* and REL_ABS can not deal
> > with "roll-over". It's expects fixed values to define the range
> > of motion. That's not true for obmouse.
> > AFAICT, only real tablets and joysticks fit that model well.
> 
> yes, maybe. I don't know obmice's details.
> 
> > I have the feeling /dev/input is a bit more "heavy weight" based
> > on the number of function calls in ob_interrupt. But I'm not sure
> > it matters. This is just for fun and it works too.
> 
> Hmm, the calls are pretty fast iirc..
> See also my other mail.
> 
> Helge

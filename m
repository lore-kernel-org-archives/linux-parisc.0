Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc3-hem11-4-cust111.bre.cable.ntl.com [213.107.179.111])
	by dsl2.external.hp.com (Postfix) with ESMTP id 322744829
	for <parisc-linux@parisc-linux.org>; Fri,  1 Nov 2002 10:00:49 -0700 (MST)
Date: Fri, 1 Nov 2002 16:58:35 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] SCSI patches
Message-ID: <20021101165834.GG10649@sleepie.demon.co.uk>
References: <20021101131818.S27461@parcelfarce.linux.theplanet.co.uk> <20021101160722.8AC994829@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <20021101160722.8AC994829@dsl2.external.hp.com>
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

On Fri, Nov 01, 2002 at 09:07:22AM -0700, Grant Grundler wrote:
> Matthew Wilcox wrote:
> > MIPS really add support for PA-RISC?  ;-)

Guess that's my screwup.

> > Anyway, I don't feel confident sending this upstream myself -- I don't
> > understand most of the changes, and wouldn't feel happy defending them.
> > Can I have a volunteer who does grok these scsi changes to send them
> > upstream?
> 
> I can. Half of the changes are mine. I don't entirely grok ZALON related
> changes but I trust whoever made them (Richard?) can clarify if needed.
> 
> Please let me know who I should send them to and when.

I presume that with the exception of the #include removal from lasi700.c
this lot should go to Gérard Roudier <groudier@club-internet.fr>.  So
far as the zalon bits are concerned, I first sent them to him in August
2000, and exchanged a few mails, and then chased on and off until Feb
2001.  Looks like I ran out of patience after that.  Anyway, from Feb
2001:

Richard wrote:
> No news on my 53c720 patch, I suppose?  

Gérard wrote:
> Your NCR720 patch is not dead, but I apologize to you for the huge retard.
> Anyway, if|when sym-2 driver will be accepted, I will not kill ncr53c8xx
> immediately.
> ...
> The NCR720 patch is too large for ncr-3.4.3, but will fit some further
> ncr-3.4.x (x >3). ncr53c8xx can coexist with either sym-1 and sym-2.
> Btw, one can build a kernel that link sym-2 + ncr.

So I take that to mean he was happy with the code.

NOTE though, that not all the zalon changes are in the diff willy
posted; it doesn't include ncr53c8xx.c changes, at least.

Richard

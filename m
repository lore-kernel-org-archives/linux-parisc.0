Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id D0CAF482C
	for <parisc-linux@lists.parisc-linux.org>; Fri,  9 Nov 2001 16:07:24 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Jochen Friedrich <jochen@scram.de>
Subject: Re: [parisc-linux] EISA stuff now in CVS
Date: Sat, 10 Nov 2001 00:06:55 +0100
Cc: parisc-linux@lists.parisc-linux.org
References: <Pine.LNX.4.40.0111092343380.12365-100000@alpha.bocc.de>
In-Reply-To: <Pine.LNX.4.40.0111092343380.12365-100000@alpha.bocc.de>
MIME-Version: 1.0
Message-Id: <20011109230724.D0CAF482C@dsl2.external.hp.com>
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

On Friday 09 November 2001 23:47, Jochen Friedrich wrote:
> Hi Helge,
>
> > Hi Jochen,
> > Daniel's newest patch is in CVS only. Update your tree or download the
> > whole kernel source from ftp://parisc-linux.org/cvs
>
> That's what i did and checked.
>
> However in the CVS version, init_eisa_pic() is called before EISA_bus is
> set to 1, so all the initialisation isn't really written to the chip...
>
> That's what my patch fixes.

Ooops....
Yes, I mixed that up. I'll check and fix that.
Now I'm wondering myself how it could have worked here. Maybe I just was lucky 
and the PDC in the 715/64 already did the proper initialization itself ?

Helge

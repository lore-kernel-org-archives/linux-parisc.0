Return-Path: <deller@gmx.de>
Received: from mail.gmx.net (pop.gmx.de [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 92BCB4842
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 20 Mar 2004 14:10:41 -0700 (MST)
From: Helge Deller <deller@gmx.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 jejb
Date: Sat, 20 Mar 2004 22:10:39 +0100
References: <20040320210116.7A727494553@palinux.hppa>
	<1079816673.1778.184.camel@mulgrave>
In-Reply-To: <1079816673.1778.184.camel@mulgrave>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Message-Id: <200403202210.39506.deller@gmx.de>
Cc: James Bottomley <James.Bottomley@steeleye.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Saturday 20 March 2004 22:04, James Bottomley wrote:
> On Sat, 2004-03-20 at 16:01, James Bottomley wrote:
> > CVSROOT:	/var/cvs
> > Module name:	linux-2.6
> > Changes by:	jejb	04/03/20 14:01:16
> > 
> > Modified files:
> > 	drivers/input/keyboard: hpps2atkbd.h 
> > 
> > Log message:
> > Fix compile failure.
> > 
> > This KEY_103RD is coming to us from the vanilla kernel, but it isn't
> > defined anywhere there
> 
> Helge, is this fix OK?

Hi James,

keep the one from our CVS.
I didn't sent the latest patches to Vojtech yet.

Thanks,
Helge

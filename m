Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id E77B9482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 15 Apr 2002 13:26:35 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Richard Hirst <rhirst@linuxcare.com>
Subject: Re: [parisc-linux] not freeing initmem and power button
Date: Mon, 15 Apr 2002 21:23:19 +0200
Cc: parisc-linux@lists.parisc-linux.org
References: <F39D7BsZXbLvwa2SydH0001aa92@hotmail.com> <200204151232.46311.helge.deller@sap.com> <20020415173544.GO4971@sleepie.demon.co.uk>
In-Reply-To: <20020415173544.GO4971@sleepie.demon.co.uk>
MIME-Version: 1.0
Message-Id: <200204152123.19619.deller@gmx.de>
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

On Monday 15 April 2002 19:35, Richard Hirst wrote:
> On Mon, Apr 15, 2002 at 12:32:46PM +0200, Helge Deller wrote:
> > Older kernels just didn't reported it, but all had this problem.
> > We're not freeing the memory yet, since we still have one or more
> > __init or __initdata too much in our kernel. Just ignore it for now.
>
> Do you recall what config failed when we did try to free the memory?  I
> tested recently with B180 and A500, both worked fine with freeing of
> memory enabled.  IIRC the origianl problem was that init crashed on
> boot...
>
> Cheers,
>   Richard

Hi Richard,

unfortunately I don't know which config it was. AFAIR it also never 
happened to me, but it did for grant or bame. Maybe they know more ?

Greetings,
Helge
 

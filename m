Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (unknown [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1E9196019
	for <parisc-linux@lists.parisc-linux.org>; Mon, 26 Nov 2001 00:38:28 -0700 (MST)
Subject: Re: [parisc-linux] Re: E55 status - THE DRIVER !
From: Ryan Bradetich <rbradetich@uswest.net>
To: Christoph Plattner <christoph.plattner@gmx.at>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <3BFBFCA1.6B5CB2B3@gmx.at>
References: <3BF99676.2A291CDD@gmx.at>  <1006299638.4898.16.camel@beavis>
	<1006314043.4898.20.camel@beavis>  <3BFBFCA1.6B5CB2B3@gmx.at>
Content-Type: text/plain
Date: 26 Nov 2001 00:38:26 -0700
Message-Id: <1006760306.14588.5.camel@beavis>
Mime-Version: 1.0
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

On Wed, 2001-11-21 at 12:12, Christoph Plattner wrote:
> Very good, that you have done the config stuff, I was not able to, as 
> I had never things to do with the configuring (expcet for using it ...).

No problem, I've done it once in the past for a different driver :)

> Will you chick in the stuff for all ?
Yes.  I wanted to first understand how to handle the major number, I
think I've got my answer for that now.
 
> I have no problem with it, if another major was taken. I only used this,
> because there was a hole in the `major.h' at 30.

Willy Suggested 60 since it was for local/experimental use.  If the
driver gets merged into the mainline kernel, we will have to address
this at that time.

> Will the changes done for the PA Linux tree also migrated to the main
> stream kernel tree ?
> When ? All minor versions (2.4.13, 2.4.14, ....) or at 2.6.x !!
I believe that is the plan, Willy has been handling most of that so that
is a better question for him to answer.


> I am happy, that your machine is also working with that stuff !

Thanks, and thank you for the driver!

- Ryan

> Bye
> Christoph P.
> 
> 
> 
> Ryan Bradetich wrote:
> > 
> > > I am still working on testing this driver ... I would be very happy to
> > > see install the K460 using the debian installer using this patch.  I am
> > > currently working on making that happen.
> > 
> > I got through enough of the installer tonight to see what I wanted to
> > see.  This PDC Software console should allow a complete debian install.
> > The dialog menus are not pretty, but they are functional.
> > 
> > Thanks,
> > 
> > - Ryan
> > 
> > _______________________________________________
> > parisc-linux mailing list
> > parisc-linux@lists.parisc-linux.org
> > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> -- 
> -------------------------------------------------------
> private:	christoph.plattner@gmx.at
> company:	christoph.plattner@alcatel.at
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tyke.pjc.net (public1-leed3-6-cust141.leed.broadband.ntl.com [80.0.5.141])
	by dsl2.external.hp.com (Postfix) with ESMTP id 826B44846
	for <parisc-linux@lists.parisc-linux.org>; Thu, 11 Jul 2002 03:35:12 -0600 (MDT)
Date: Thu, 11 Jul 2002 10:35:09 +0100
From: Patrick Caulfield <patrick@tykepenguin.com>
To: Rodolfo Baselli <rodolfo.baselli@deaprofessionale.it>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] O_DIRECT on devices
Message-ID: <20020711093509.GH822@tykepenguin.com>
References: <20020711082259.GF822@tykepenguin.com> <3D2D4B4B.4010705@deaprofessionale.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
In-Reply-To: <3D2D4B4B.4010705@deaprofessionale.it>
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

On Thu, Jul 11, 2002 at 11:09:31AM +0200, Rodolfo Baselli wrote:
> Patrick Caulfield wrote:
> >I'm currently working on LVM2 and we want to use O_DIRECT to write the 
> >metadata
> >from userspace. so I open a partition with O_DIRECT and try to read/write 
> >the
> >data from an aligned buffer.
> 
> Hmmm, so is LVM ready for HP PA-RISC Linux? WOW!

LVM2 works fine - I use it all the time on my HP and Alpha boxes. O_DIRECT is an
optimisation I would like to have in there though cos it avoids a lot of
buffer-cache nastiness when clustering (yes, I'm working on that too but that
bit won't be GPLed)

 
> By the way, I'm reading right now "The catcher in the rye" by J.D. 
> Salinger, and as I glanced at your 2nd name I felt like I was still 
> reading the book! :-)))

:-)


If you were a pop-art expert you might have got even more deja-vu !
http://www.postershop.com/Caulfield-Patrick/Caulfield-Patrick-After-Lunch-2405657.html

I blame my parents...

patrick

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hotmail.com (dav47.law15.hotmail.com [64.4.22.19])
	by dsl2.external.hp.com (Postfix) with ESMTP id 483034853
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Mar 2002 04:04:53 -0700 (MST)
From: "Jean-Louis Abat" <jl_abat@hotmail.com>
To: "Richard Hirst" <rhirst@linuxcare.com>
Cc: <parisc-linux@lists.parisc-linux.org>
References: <DAV39FlmmlQ080Gxw8Z0001bdbc@hotmail.com> <20020318101223.GI31276@charite.de> <DAV51vjqueolj8Jecd900003763@hotmail.com> <20020318104150.GV21376@sleepie.demon.co.uk>
Subject: Re: [parisc-linux] pb with iso 0.9.3 ?
Date: Mon, 18 Mar 2002 12:05:33 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Message-ID: <DAV47nrvDOv5y4FypKs0000083e@hotmail.com>
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

Thanks a lot!!
I didn't see the logo at boot time .
I was just a little surprised because with my 712, I always see it, but that
was the first time I install a 715 and 720, so it could have been different
with these systems...
I immediatly try another kernel !!

best regards,

jl.

----- Original Message -----
From: "Richard Hirst" <rhirst@linuxcare.com>
To: "Jean-Louis Abat" <jl_abat@hotmail.com>
Cc: <parisc-linux@lists.parisc-linux.org>
Sent: Monday, March 18, 2002 11:41 AM
Subject: Re: [parisc-linux] pb with iso 0.9.3 ?


> On Mon, Mar 18, 2002 at 11:25:45AM +0100, Jean-Louis Abat wrote:
> > Thank you for your answer, but I know X is fine with 712 ;)
> > (it works very well, including gnome, kde, enlightenment....)
> > I only have a problem with 715 and 720...
> > I use the proper XF86Config posted here, and available on the ftp (with
the
> > proper keymap for hil keyboards...)
> > The problem is no device is detected with 715 and 720, when a specify
fbdev
> > as driver...
>
> Do you get the penguin logo top left of the screen during boot?
> If not, then it is a kernel problem, which might possibly be solved in
> more recent kernels.  You could try one from
> ftp://ftp.parisc-linux.org/kernels/32/
> for example.
>
> Otherwise, check your  dmesg output to see what screen resolution and
> depth fb is reporting, and make sure you have that (and only that)
> specified in XF86-Config.
>
> Failing that, post your dmsg output here.
>
> Richard
>
>

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hotmail.com (dav51.law15.hotmail.com [64.4.22.40])
	by dsl2.external.hp.com (Postfix) with ESMTP id D0726484B
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Mar 2002 03:25:05 -0700 (MST)
From: "Jean-Louis Abat" <jl_abat@hotmail.com>
To: "Ralf Hildebrandt" <Ralf.Hildebrandt@charite.de>
Cc: <parisc-linux@lists.parisc-linux.org>
References: <DAV39FlmmlQ080Gxw8Z0001bdbc@hotmail.com> <20020318101223.GI31276@charite.de>
Subject: Re: [parisc-linux] pb with iso 0.9.3 ?
Date: Mon, 18 Mar 2002 11:25:45 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Message-ID: <DAV51vjqueolj8Jecd900003763@hotmail.com>
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

Thank you for your answer, but I know X is fine with 712 ;)
(it works very well, including gnome, kde, enlightenment....)
I only have a problem with 715 and 720...
I use the proper XF86Config posted here, and available on the ftp (with the
proper keymap for hil keyboards...)
The problem is no device is detected with 715 and 720, when a specify fbdev
as driver...


----- Original Message -----
From: "Ralf Hildebrandt" <Ralf.Hildebrandt@charite.de>
To: "Jean-Louis Abat" <jl_abat@hotmail.com>
Cc: <parisc-linux@lists.parisc-linux.org>
Sent: Monday, March 18, 2002 11:12 AM
Subject: Re: [parisc-linux] pb with iso 0.9.3 ?


> On Mon, Mar 18, 2002 at 11:05:24AM +0100, Jean-Louis Abat wrote:
> > Hi,
> >
> > I made an installation with the 0.9.3 iso on 3 different types of
> > parisc systems : 715/33,720/50 and 712/80. As I haven't much time to
> > do so, I decide to use only tasksel, and not dselect. The pb was the
> > same under 715 and 720 : no X, but it is ok with the 712... (of
> > course, I've modified the XF86Config for all, using fbdev as driver,
> > and using a serial mouse and a hil keyboard for the 715 and 720 with
> > the good keymap...) What could be the problem? Are 715 and 720
> > working under X ??
>
> Yes, definitely. X is fine on my 712/80. The config was posted here,
> check the Archives.
>
>
> --
> Ralf Hildebrandt (Im Auftrag des Referat V A)
Ralf.Hildebrandt@charite.de
> Charite Campus Virchow-Klinikum                 Tel.  +49 (0)30-450
570-155
> Referat V A - Kommunikationsnetze -             Fax.  +49 (0)30-450
570-916
> Why is Linux so stable?
> Because Penguins can't fly.
>
>

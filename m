Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from interzone.ucc.ie (interzone.ucc.ie [143.239.1.134])
	by dsl2.external.hp.com (Postfix) with ESMTP id CB894482B
	for <parisc-linux@lists.parisc-linux.org>; Fri,  5 Apr 2002 06:59:40 -0700 (MST)
Date: Fri, 5 Apr 2002 14:59:34 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: Jesus Climent <climent@stybba.ntc.nokia.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 64bit newbie question
In-Reply-To: <20020405135556.GO10207@shire.ntc.nokia.com>
Message-ID: <Pine.LNX.4.44.0204051456300.28325-100000@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Fri, 5 Apr 2002, Jesus Climent wrote:

> > What do I have to do to
> >
> > - build a 64bit capable gcc for hppa ?
> > - produce a 64bit executable ?
> > - create a 64bit kernel ? (I know it doesn't make sense on Cxxx
> >   machines, and 64bit has much more bugs than 32bit support ;)
> >
> > And are there precompiled binaries available (debian/hppa executables) ?
> > I haven't seen an egcs64, gcc64 or hppa64-gcc in the debian pool ...
>
> Have you tried gcc-3.0 ??
>
> IIRC is the one that introduced 64 bit compilation under hppa.

Lol :)

I think there is no other gcc for hppa than gcc-3.x yet ;)

I wondered what options I have to pass to gcc to created 64bit
executables (e.g. a 64bit kernel), and/or whether the 'normal' gcc-3.0
you get with apt-get is just capable of dealing with 32bit executables.

greetings & have a nice weekend, max

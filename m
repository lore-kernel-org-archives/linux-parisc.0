Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id BAB3A482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Jun 2002 01:20:11 -0600 (MDT)
From: Helge Deller <deller@gmx.de>
To: <marc@centraltx.com>,
	"Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] Building my first kernel
Date: Thu, 6 Jun 2002 09:19:20 +0200
Cc: <parisc-linux@lists.parisc-linux.org>
References: <200206052339.AA4027384388@mail.centraltx.com>
In-Reply-To: <200206052339.AA4027384388@mail.centraltx.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200206060919.20831.deller@gmx.de>
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

Hi Marc,

Go to
http://cvs.parisc-linux.org/
and check out the linux and palo directories with an anonymous account.
Then build your linux kernel from the linux directory.

Greetings,
Helge

On Thursday 06 June 2002 06:39, marc  wrote:
> i did:
>
>    apt-get install kernel-source-2.4.18-hppa
>
> ---------- Original Message ----------------------------------
> From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
> Date:  Wed, 5 Jun 2002 23:46:37 -0400
>
> >> Call me crazy, but I cannot get this to work. There doesn't seem
> >> to be a 'palo' target for make. When I run make palo it just
> >> runs the make all (below are the first few lines).
> >>
> >> Any Ideas?
> >
> >How did you get the source tree for linux and palo?
> >
> >c.

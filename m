Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.goquest.com (ns1.goquest.com [12.18.108.6])
	by dsl2.external.hp.com (Postfix) with SMTP id C92454829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Apr 2003 15:39:42 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Michael S.Zick <mszick@goquest.com>
To: "M. Grabert" <xam@cs.ucc.ie>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [parisc-linux] color recovery
Date: Wed, 16 Apr 2003 16:33:26 -0500
Cc: parisc-linux@lists.parisc-linux.org
References: <Pine.LNX.4.44.0304161854341.28370-100000@sal.ucc.ie>
In-Reply-To: <Pine.LNX.4.44.0304161854341.28370-100000@sal.ucc.ie>
MIME-Version: 1.0
Message-Id: <03041616332600.03921@wolf686>
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

On Wednesday 16 April 2003 12:59 pm, M. Grabert wrote:
> On Wed, 16 Apr 2003, Thomas Bogendoerfer wrote:
> > On Wed, Apr 16, 2003 at 01:28:43PM +0100, M. Grabert wrote:
> > > My Precisionbook obviously has a Visualize-EG with just 2MB.
> > > So it should be able to display at least 800x600 in 24/32bit and
> > > 1024x768 in 16bit, but it refuses to do so. 'dmesg' ALWAYS shows
> > > only 8bit colour depth regardless of the display resolution.
> >
> > Visualize-EG is 8 bit only. That's a hardware limitation.
>
> The manual says something different/strange ... the LCD actually supports
> 16M colours, and so does the Visualize-EG (HP Graphitti).
>
> ... together with the fact that it just has 2MB onboard there is only
> one possibility: they are referring to HP's color recovery technique.

Yup.
>
> Is there ANY way that color recovery will be supported anytime in the
> future?

There has been a lot of mails on this list on this subject;
sorry that I don't have the pointers handy, but...

A search of the FAQ and the mailing list archive should lead you to
how others have dealt with this problem - including getting 8-bit X
to work on the machines.

Also, somewhere on the site(s) are some special X config files.
It isn't hopeless, just not pretty.

Mike

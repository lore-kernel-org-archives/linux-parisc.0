Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mx2out.umbc.edu (mx2out.umbc.edu [130.85.253.52])
	by dsl2.external.hp.com (Postfix) with ESMTP id C53B24832
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Jun 2002 18:11:35 -0600 (MDT)
Received: from linux2.gl.umbc.edu (linux2.gl.umbc.edu [130.85.60.16])
	by mx2out.umbc.edu (8.12.0/8.12.0/UMBC-Central 1.11 mxout  1.2.2.3 $) with ESMTP id g5M0BXnv020495;
	Fri, 21 Jun 2002 20:11:33 -0400 (EDT)
Received: from localhost (jmccla3@localhost)
	by linux2.gl.umbc.edu (8.12.1/8.12.0) with ESMTP id g5M0BX6C006043;
	Fri, 21 Jun 2002 20:11:34 -0400
Date: Fri, 21 Jun 2002 20:11:33 -0400 (EDT)
From: James Mcclain <jmccla3@gl.umbc.edu>
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: Patrick Caulfield <patrick@tykepenguin.com>,
	<parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] 0.9.3 Audio on C110
In-Reply-To: <Pine.LNX.4.44.0206212123170.4556-100000@sal.ucc.ie>
Message-ID: <Pine.LNX.4.31L.02.0206212008460.5960-100000@linux2.gl.umbc.edu>
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

Dear Max,

i cannot speak to the mixer and gain issues, but i can offer something
with regard to recording:  adding lines:

	case SNDCTL_DSP_SYNC:
	return 0;

to the ioctl swith statment in drivers/sound/harmony.c (line 727 or there
abouts) will allow you to use sox to record (i have been able to
succesfully record using sox after adding this change).

best regards,
james w. mcclain

 On Fri, 21 Jun
2002, M. Grabert wrote:

> Hi palinuxer,
>
> On Fri, 21 Jun 2002, Patrick Caulfield wrote:
>
> > The driver is called "harmony" - I have mine hard compiled into the kernel.
> >
> > patrick
>
> This reminds me of something I wanted to ask for a long time:
>
> It seems that the harmony mixer is not perfectly supported;
> Volume doesn't work, and there are just two things I can change,
> IGain and OGain (latter effects the Output volume).
> There is not even a way to change the balance etc.
> Moreover most applications expect at least "volume" to be working,
> so this is kind of annoying. Despite this it's working flawlessly!
>
> So to the question: is there any work planned in improving harmony
> support (in the near future) ? E.g. an enhanced mixer support and
> support for recording?
>
> greetings max
>
>
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>

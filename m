Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.monmouth.com (smtp.monmouth.com [209.191.58.6])
	by dsl2.external.hp.com (Postfix) with ESMTP id E9647484E
	for <parisc-linux@parisc-linux.org>; Sun, 24 Mar 2002 18:56:56 -0700 (MST)
Message-Id: <200203250156.g2P1ufT92697@smtp.monmouth.com>
Content-Type: text/plain;
  charset="iso-8859-1"
From: "Vlad D. Markov" <markov@monmouth.com>
To: parisc-linux@parisc-linux.org, Matthew Wilcox <willy@debian.org>
Date: Sun, 24 Mar 2002 20:46:27 -0500
References: <200203242042.g2OKgET57280@smtp.monmouth.com> <20020324210214.E28384@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20020324210214.E28384@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
Subject: [parisc-linux] Re: Using Audio card on 735/99
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

Moderate success.

1. aumix worked.
2. xmms hung forever.
3. I wrote an au file to /dev/dsp. I thought nothing happened. Minutes later 
I was surprised to hear the file over my headphones. I have been unable to 
repeat this.

On Sunday 24 March 2002 04:02 pm, Matthew Wilcox wrote:
> [this is a kernel-related question, moving discussion to parisc-linux]
>
> On Sun, Mar 24, 2002 at 03:32:53PM -0500, Vlad D. Markov wrote:
> > I would like to use my audio card on my 735/99 but have failed so far.
> >
> > I have used various kernel versions, the last attempt was with a kernel
> > drawn from cvs on 3/21/02, Linux version 2.4.18-pa7. dmesg doesn't list
> > the harmony card as found. The harmony driver was compiled with the
> > kernel.
>
> Harmony doesn't claim to support that device.  I don't know that it will
> work ... but you might be lucky :-)
>
> Try adding this patch and let's see what happens:
>
> --- drivers/sound/harmony.c     2002/02/14 19:02:21     1.25
> +++ drivers/sound/harmony.c     2002/03/24 20:52:31
> @@ -1244,7 +1244,10 @@ out_err:
>
>
>  static struct parisc_device_id harmony_tbl[] = {
> +       { HPHW_FIO, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x0007A },
>         { HPHW_FIO, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x0007B },
> +       { HPHW_FIO, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x0007E },
> +       { HPHW_FIO, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x0007F },
>         { 0, }
>  };
>
>
> This makes harmony pick up all the Audio devices, including some it
> almost certainly won't support (eg 705 / 710 audio, which i understand
> to be completely different).  But maybe 735's sound will Just Work.
> Let's hope.

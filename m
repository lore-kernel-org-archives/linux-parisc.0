Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA00490
	for <parisc-linux@puffin.external.hp.com>; Wed, 29 Nov 2000 16:25:16 -0700
From: "Steve Moret" <smoret@uci.edu>
To: "Jorge L. deLyra" <delyra@latt.if.usp.br>
Cc: <parisc-linux@thepuffingroup.com>
Subject: RE: [parisc-linux] HP 9000/735-125 
Date: Wed, 29 Nov 2000 15:28:20 -0800
Message-ID: <KNEHLBLKMAMGJHIKCGCIMEMKCAAA.smoret@uci.edu>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
In-Reply-To: <200011292319.PAA28547@milano.cup.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

Jorge,

I have a 735-125 and am able to net-boot it on a custom configured kernel as
long as I disable the ASP parallel ports. It works quite well using an NFS
root as I cannot get the SCSI hard drives to mkfs. I was going to try and
debug it but have yet to find the free time. I can e-mail you my working
.config for the kernel, or build kernels (tested on my own 735) for people
if they need them.

--
Steve Moret
smoret@uci.edu

> -----Original Message-----
> From: Grant Grundler [mailto:grundler@cup.hp.com]
> Sent: Wednesday, November 29, 2000 3:19 PM
> To: Jorge L. deLyra
> Cc: parisc-linux@thepuffingroup.com
> Subject: Re: [parisc-linux] HP 9000/735-125
>
>
> "Jorge L. deLyra" wrote:
> > I just booted the palinux-0.5.iso CD on a HP 9000 model 735 workstation.
> > It went on quite a bit before hanging immediatelly after reporting the
> > serial ports. Gave large amount of what looks like traceback or state
> > information. Question: would it do anyone any good if I tried to get
> > everything the kernel said before the hang into a message in this list?
>
> Certainly. I won't be able to debug the problems since I (a) don't have
> the time too (unless it's obvious) and (b) don't have a 735 setup
> for testing.
>
> This is becoming a FAQ:
> "My system crashed after ...  What should I do next?"
>
> I'm thinking people in the support space would know how to write
> this one really well :^)
> Is I get one in the mail, I'll add it to our FAQ.
>
> thanks,
> grant
>
>
> Grant Grundler
> Unix Systems Enablement Lab
> +1.408.447.7253
>
> ------------------------------------------------------------------
> ---------
> To unsubscribe: send e-mail to
> parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
>
>

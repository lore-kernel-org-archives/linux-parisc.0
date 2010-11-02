From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: HPMC in lba_pat_out8 on rp3440
Date: Tue, 02 Nov 2010 10:38:47 -0400
Message-ID: <1288708727.3056.213.camel@mulgrave.site>
References: <20101102142428.049144DB0@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Grant Grundler <grundler@parisc-linux.org>,
	dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101102142428.049144DB0@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 2010-11-02 at 10:24 -0400, John David Anglin wrote:
> > Maybe try the your kernels on ioz?
> > Try the kernels from ion or ioz on your machine?
> > 
> > on:~# uname -a
> > Linux ion 2.6.37-rc1+ #20 SMP Mon Nov 1 13:50:38 PDT 2010 parisc64 GNU/Linux
> > 
> > ioz:~# uname -a
> > Linux ioz 2.6.34-rc6 #25 Tue May 11 02:29:56 GMT 2010 parisc64 GNU/Linux
> > 
> > Source on ioz:/usr/src/linux-2.6 should match the kernel.
> > jejb is generally using ion.
> 
> I tried the config from ion.  It also crashed on boot but in a different
> way.  It did get further though.

Ion's config is in my home directory; current config is
~jejb/config-2.6.37-rc1

It's a highly modular one based on debian kernels.

James



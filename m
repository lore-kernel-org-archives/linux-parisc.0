From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPMC in lba_pat_out8 on rp3440
Date: Tue, 2 Nov 2010 10:24:26 -0400 (EDT)
Message-ID: <20101102142428.049144DB0@hiauly1.hia.nrc.ca>
References: <20101102062623.GC14166@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101102062623.GC14166@lackof.org> from "Grant Grundler" at Nov 2, 2010 00:26:23 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Maybe try the your kernels on ioz?
> Try the kernels from ion or ioz on your machine?
> 
> on:~# uname -a
> Linux ion 2.6.37-rc1+ #20 SMP Mon Nov 1 13:50:38 PDT 2010 parisc64 GNU/Linux
> 
> ioz:~# uname -a
> Linux ioz 2.6.34-rc6 #25 Tue May 11 02:29:56 GMT 2010 parisc64 GNU/Linux
> 
> Source on ioz:/usr/src/linux-2.6 should match the kernel.
> jejb is generally using ion.

I tried the config from ion.  It also crashed on boot but in a different
way.  It did get further though.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

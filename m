Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id EF7624829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 17 Sep 2002 11:07:15 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17rLof-0001ae-00; Tue, 17 Sep 2002 18:07:13 +0100
Date: Tue, 17 Sep 2002 18:07:13 +0100
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: Thibaut VARENE <varenet@esiee.fr>,
	parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] B132L+ crash with mpg123
Message-ID: <20020917180713.P10583@parcelfarce.linux.theplanet.co.uk>
References: <3D8701AA.4040700@esiee.fr> <varenet@esiee.fr> <20020917170001.DA8DC4829@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020917170001.DA8DC4829@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Tue, Sep 17, 2002 at 11:00:01AM -0600
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

On Tue, Sep 17, 2002 at 11:00:01AM -0600, Grant Grundler wrote:
> > Kernel Fault: Code=15 regs=11ddc640 (Addr=00277e00)
> > 
> >       YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> > PSW: 00000000000011000000000000001111 Not tainted
> > r00-03  00000000 00000023 101feac4 00000200
> ...
> > IASQ: 00000000 0000000 IAOQ: 10263c78 10263c70
> ...
> what symbols do 101feac4 and 10263c78 refer to?

10263c78 is in copy_from_user, 101feac4 is in harmony_audio_write().
the only point at which we call copy_from_user is:

                /* Copy the page to an aligned buffer */
                copy_from_user(played_buf.addr + (HARMONY_BUF_SIZE*buf_to_fill)
					+ harmony.play_offset,
				buffer+count, frame_size);


-- 
Revolutions do not require corporate support.

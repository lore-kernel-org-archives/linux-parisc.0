Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust100.bre.cable.ntl.com [213.107.176.100])
	by dsl2.external.hp.com (Postfix) with ESMTP id 86E8D482B
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 Nov 2001 09:15:08 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 2F783B00C; Tue,  6 Nov 2001 16:16:13 +0000 (GMT)
Date: Tue, 6 Nov 2001 16:16:13 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Matthew Wilcox <willy@debian.org>
Cc: Albert Strasheim <fullung@ilink.nis.za>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: hppa binutils/glibc updates
Message-ID: <20011106161613.M8938@linuxcare.com>
References: <20011105024952.C4441@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.21.0111050136140.2956-100000@spawn.hockeyfiend.com> <20011105214227.M505@tausq.org> <20011106101650.A29917@dogbert.localdomain> <20011106152317.A4530@dogbert.localdomain> <20011106155428.A4719@dogbert.localdomain> <20011106143616.E4441@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011106143616.E4441@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Tue, Nov 06, 2001 at 02:36:16PM +0000
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

On Tue, Nov 06, 2001 at 02:36:16PM +0000, Matthew Wilcox wrote:
> On Tue, Nov 06, 2001 at 03:54:28PM +0200, Albert Strasheim wrote:
> >      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
> > PSW: 00000000000001101111111100001111
> > r0-3     00000000 401e43fc 401845ff 00045990
> > r4-7     401e5bfc faf00d10 faf00b90 0000000a
> > r8-11    0004d1b0 faf00948 0004d1d8 faf00ba8
> > r12-15   00000000 faf00b98 000c5210 00000000
> > r16-19   00000000 00000000 10348000 00045220
> > r20-23   00000002 401cec20 401845b0 00000000
> > r24-27   00000020 00045998 faf00d90 00040220
> > r28-31   faf00d10 00000005 faf00e00 00026f03
> > sr0-3    00000000 0000004c 00000000 0000004c
> > sr4-7    0000004c 0000004c 0000004c 0000004c
> >
> > IASQ: 0000004c 0000004c IAOQ: 401cec23 401cec27
> >  IIR: 00040948    ISR: 0000004c  IOR: 00000000
> >  CPU:        0   CR30: 15bb0000 CR31: 10350000
> >  ORIG_R28: 00000001
> > 
> > Clearly it does happen. Mehehe. :-)
> > 
> > Should I decode this? I think I'll find instructions in the list
> > archive? Search for "decode"?
> 
> 401cec23 is in a library... it might need to get recompiled too.

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E697A482B
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 Nov 2001 07:36:18 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 1617Kq-0003SU-00; Tue, 06 Nov 2001 14:36:16 +0000
Date: Tue, 6 Nov 2001 14:36:16 +0000
From: Matthew Wilcox <willy@debian.org>
To: Albert Strasheim <fullung@ilink.nis.za>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: hppa binutils/glibc updates
Message-ID: <20011106143616.E4441@parcelfarce.linux.theplanet.co.uk>
References: <20011105024952.C4441@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.21.0111050136140.2956-100000@spawn.hockeyfiend.com> <20011105214227.M505@tausq.org> <20011106101650.A29917@dogbert.localdomain> <20011106152317.A4530@dogbert.localdomain> <20011106155428.A4719@dogbert.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011106155428.A4719@dogbert.localdomain>; from fullung@ilink.nis.za on Tue, Nov 06, 2001 at 03:54:28PM +0200
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

On Tue, Nov 06, 2001 at 03:54:28PM +0200, Albert Strasheim wrote:
> IASQ: 0000004c 0000004c IAOQ: 401cec23 401cec27
>  IIR: 00040948    ISR: 0000004c  IOR: 00000000
>  CPU:        0   CR30: 15bb0000 CR31: 10350000
>  ORIG_R28: 00000001
> 
> Clearly it does happen. Mehehe. :-)
> 
> Should I decode this? I think I'll find instructions in the list
> archive? Search for "decode"?

401cec23 is in a library... it might need to get recompiled too.

-- 
Revolutions do not require corporate support.

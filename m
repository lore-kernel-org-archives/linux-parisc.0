Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 10A6948A4
	for <parisc-linux@parisc-linux.org>; Tue, 16 Jul 2002 08:09:35 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17UT17-00021m-00; Tue, 16 Jul 2002 15:09:29 +0100
Date: Tue, 16 Jul 2002 15:09:29 +0100
From: Matthew Wilcox <willy@debian.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: HPPA List <parisc-linux@parisc-linux.org>, bame@fc.hp.com
Subject: Re: [parisc-linux] Merge error in pa55 tree ??
Message-ID: <20020716150929.V27706@parcelfarce.linux.theplanet.co.uk>
References: <1026832288.1687.57.camel@irongate.swansea.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1026832288.1687.57.camel@irongate.swansea.linux.org.uk>; from alan@lxorguk.ukuu.org.uk on Tue, Jul 16, 2002 at 04:11:28PM +0100
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

On Tue, Jul 16, 2002 at 04:11:28PM +0100, Alan Cox wrote:
> diff -u --new-file --recursive --exclude-from /usr/src/exclude
> linux.vanilla/ar
> --- linux.vanilla/arch/ia64/kernel/perfmon.c    Fri Nov  9 22:26:17 2001
> +++ linux-hppa/arch/ia64/kernel/perfmon.c       Wed Aug 15 18:07:26 2001
> @@ -38,7 +38,7 @@  
>  
>  #ifdef CONFIG_PERFMON
>  
> -#define PFM_VERSION            "0.3"
> +#define PFM_VERSION            "0.2"
>  #define PFM_SMPL_HDR_VERSION   1
>  
>  #define PMU_FIRST_COUNTER      4       /* first generic counter */
> @@ -52,7 +52,6 @@
>  #define PFM_DISABLE            0xa6    /* freeze only */
>  #define PFM_RESTART            0xcf
>  #define PFM_CREATE_CONTEXT     0xa7

looks like a problem in the cvs tree.  paul, could you look at this?
some interesting bits from the log:

----------------------------
revision 1.6
date: 2001/08/15 17:07:26;  author: bame;  state: Exp;  lines: +7 -17
merged 2.4.8 upstream
----------------------------
revision 1.1
date: 2000/03/15 21:02:27;  author: mang;  state: dead;
branches:  1.1.1;  1.1.2;
file perfmon.c was initially added on branch linus.
----------------------------
revision 1.1.2.1
date: 2000/03/15 21:02:27;  author: mang;  state: Exp;  lines: +244 -0
Update the linus branch to Linus' 2.3.99-pre1. 2.4 is right around
the corner.
----------------------------
revision 1.1.1.6
date: 2001/11/28 05:36:30;  author: bame;  state: Exp;  lines: +729 -388
updating branch linus to LINUS_2416


-- 
Revolutions do not require corporate support.

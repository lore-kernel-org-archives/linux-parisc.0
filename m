Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from the-village.bc.nu (lightning.swansea.linux.org.uk [194.168.151.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 08F33482B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 30 Apr 2002 18:25:27 -0600 (MDT)
Subject: Re: [parisc-linux] Patch to enable IrDA :-)
To: jochen@scram.de (Jochen Friedrich)
Date: Wed, 1 May 2002 01:43:25 +0100 (BST)
Cc: parisc-linux@lists.parisc-linux.org (HP900 PARISC mailing list)
In-Reply-To: <Pine.LNX.4.44.0205010207430.4938-100000@alpha.bocc.de> from "Jochen Friedrich" at May 01, 2002 02:08:48 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E172iDN-0000pm-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
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

>  #ifdef TIOCM_OUT2 /* Not defined for ARM */
>         arg = TIOCM_OUT2;
> +#endif
> +#ifdef CONFIG_PARISC  /* PA-RISC uses OUT1 as hardware flow control bit 
> */
> +       arg |= TIOCM_OUT1;
>  #endif

With these ifdefs for ARM and parisc maybe

	arg = IRDA_MODEM_BITS;

and sticking tha tin the header would be good ?

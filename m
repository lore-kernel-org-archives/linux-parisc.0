Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: Jeremy Drake <jeremyd@apptechsys.com>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] SMP support 
In-Reply-To: Message from "M. Grabert" <xam@cs.ucc.ie>
   of "Wed, 20 Mar 2002 22:16:46 GMT." <Pine.LNX.4.44.0203202209250.5453-100000@sal.ucc.ie>
References: <Pine.LNX.4.44.0203202209250.5453-100000@sal.ucc.ie> 
Date: Thu, 21 Mar 2002 00:08:51 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020321070852.027D74843@dsl2.external.hp.com>
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

"M. Grabert" wrote:
> > > depmod: Unhandled relocation of type 74 for printk_Rsmp_dd132261
> > > depmod: Unhandled relocation of type 74 for usb_deregister_Rsmp_c6f994d5
> >
> > I've seen this when CONFIG_PA20 is enabled but CONFIG_PARISC64 is not.
> > Don't know if that's your problem, but it's worth checking.

FWIW, it seems the Richard Hirst has fixed this.
He's posted a modutils_2.4.13-3.1rgh_hppa.deb to test
(I've used it successfully) on ftp.p-l.o/unofficial-debs.

thanks richard!
grant

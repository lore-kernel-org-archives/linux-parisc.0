Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5818D4843
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 18 Feb 2004 23:06:02 -0700 (MST)
Date: Wed, 18 Feb 2004 23:06:00 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: Thibaut VAR?NE <varenet@esiee.fr>
Subject: Re: [parisc-linux] Re: PA linux.
Message-ID: <20040219060600.GA13916@colo.lackof.org>
References: <20040218095513.XVFQ367.mail@VALHALLA>
	<D23E0231-622A-11D8-B017-0030656F07A2@esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <D23E0231-622A-11D8-B017-0030656F07A2@esiee.fr>
Cc: Cenk KARAG?Z <cenk.karagoz@enter.com.tr>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Wed, Feb 18, 2004 at 04:55:06PM +0100, Thibaut VAR?NE wrote:
> >But.. In the boot time,ISL (by the way ISL vers?ISL revision A.00.38 
> >OCT, 1994) say:
> >
> >ISL booting hpux
> 
> well this is pretty self explanatory... you' re booting HPUX here.

exactly. there's a good chance the auto boot primary is still pointing
at the scsi.6 disk. If he has two disks installed then debian will
get installed on scsi.5 (sda).

grant

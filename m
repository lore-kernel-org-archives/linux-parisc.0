Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hermes.cs.brandeis.edu (hermes.cs.brandeis.edu [129.64.2.5])
	by dsl2.external.hp.com (Postfix) with ESMTP id 102D7482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  1 Feb 2002 13:04:29 -0700 (MST)
Mime-Version: 1.0
Message-Id: <a05100308b880a51a1eba@[129.64.46.83]>
In-Reply-To: <Pine.LNX.4.21.0202011318340.23933-100000@maestro.symsys.com>
References: <Pine.LNX.4.21.0202011318340.23933-100000@maestro.symsys.com>
Date: Fri, 1 Feb 2002 15:04:46 -0500
To: Greg Ingram <ingram@symsys.com>
From: Aaron Macks <aaronm@cs.brandeis.edu.ml.to>
Subject: Re: [parisc-linux] Display for C100?
Cc: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset="us-ascii" ; format="flowed"
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

are you sure that your monitor can support 1280x1024?
that sounds like the problem.  As I recall, you can switch boot-up 
modes using the shift key.  Once you can see STI bootup on the 
monitor, linux should read the settings
Aaron
>Gentlemen,
>
>When I bought my C100 about a year ago the sales critter claimed the
>graphics card could drive a run of the mill monitor.  It has a standard
>SVGA connector.  I've hooked up a couple of displays to no avail.  Here's
>what seem to be the relevant kernel boot messages:
>
>[...]
>18. Coral SGC Graphics (10) at 0xf6000000 [10/20], versions 0x4, 0x0, 0x77
>[...]
>36. Coral SGC Graphics (10) at 0xf6000000 [10/20], versions 0x4, 0x0, 0x77
>[...]
>STI byte mode ROM at f6000000, hpa=f6000000
>STI byte mode ROM, id 2bcb015a-9a02587, conforms to spec rev. 8.04
>STI device: HPA4071A
>Console: switching to colour frame buffer device 160x64
>fb0: stifb 1280x1024-32 frame buffer device, id: 2bcb015a, mmio: 0xf6100000
>
>Would anyone know what kind of monitor I need?
>
>Regards,
>
>- Greg
>
>
>
>
>
>_______________________________________________
>parisc-linux mailing list
>parisc-linux@lists.parisc-linux.org
>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


-- 
_______________________________________________________
Aaron Macks(aaronm@cs.brandeis.edu)
My sheep has seven gall bladders, that makes me the King of the Universe!

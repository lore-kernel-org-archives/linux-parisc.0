Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from relay1.alcatel.be (alc119.alcatel.be [195.207.101.119])
	by dsl2.external.hp.com (Postfix) with ESMTP id 25A1F482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  4 Feb 2002 01:02:03 -0700 (MST)
Message-ID: <03273D4BC7F4D511AC440008C7E6F881542145@nlntmail2b.ats.nld.alcatel.nl>
From: "Witvliet, Hans" <Hans.Witvliet@Alcatel.nl>
To: "'Aaron Macks'" <aaronm@cs.brandeis.edu.ml.to>,
	Greg Ingram <ingram@symsys.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: RE: [parisc-linux] Display for C100?
Date: Mon, 4 Feb 2002 09:00:43 +0100 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Hi,

Could be mistaken, but the last time I used this feature, I had to press the
TAB-key ...

Hans

	-----Original Message-----
	From:	Aaron Macks [SMTP:aaronm@cs.brandeis.edu.ml.to]
	Sent:	Friday, February 01, 2002 9:05 PM
	To:	Greg Ingram
	Cc:	parisc-linux@lists.parisc-linux.org
	Subject:	Re: [parisc-linux] Display for C100?

	are you sure that your monitor can support 1280x1024?
	that sounds like the problem.  As I recall, you can switch boot-up 
	modes using the shift key.  Once you can see STI bootup on the 
	monitor, linux should read the settings
	Aaron
	>Gentlemen,
	>
	>When I bought my C100 about a year ago the sales critter claimed
the
	>graphics card could drive a run of the mill monitor.  It has a
standard
	>SVGA connector.  I've hooked up a couple of displays to no avail.
Here's
	>what seem to be the relevant kernel boot messages:
	>
	>[...]
	>18. Coral SGC Graphics (10) at 0xf6000000 [10/20], versions 0x4,
0x0, 0x77
	>[...]
	>36. Coral SGC Graphics (10) at 0xf6000000 [10/20], versions 0x4,
0x0, 0x77
	>[...]
	>STI byte mode ROM at f6000000, hpa=f6000000
	>STI byte mode ROM, id 2bcb015a-9a02587, conforms to spec rev. 8.04
	>STI device: HPA4071A
	>Console: switching to colour frame buffer device 160x64
	>fb0: stifb 1280x1024-32 frame buffer device, id: 2bcb015a, mmio:
0xf6100000
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
	My sheep has seven gall bladders, that makes me the King of the
Universe!

	_______________________________________________
	parisc-linux mailing list
	parisc-linux@lists.parisc-linux.org
	http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

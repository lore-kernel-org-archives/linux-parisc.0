Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpde02.sap-ag.de (smtpde02.sap-ag.de [194.39.131.53])
	by dsl2.external.hp.com (Postfix) with ESMTP id 46A55482B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 13 Dec 2001 07:30:15 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <helge.deller@sap.com>
To: "Edward Alfert" <edward@alfert.com>,
	<parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] What keywords should I use to find the answer?
Date: Thu, 13 Dec 2001 15:30:11 +0100
References: <001101c183db$4be88290$0201a8c0@w2kpro>
In-Reply-To: <001101c183db$4be88290$0201a8c0@w2kpro>
MIME-Version: 1.0
Message-Id: <E16EWsG-0000Ah-00@linuxlab.wdf.sap-ag.de>
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

Hi Edward,

Hmm, I think we forgot to backport the stifb-PCI hack :-(

The reson behind this "I'm not trying to set up the PCI graphic 
card now... It would freeze your machine" message is, that
during the initialisation of the A4977A Visualize EG PCI card 
(which is often found in c3000 workstations) my machine
completely freezes.

Since you have another PCI card you should try a recent kernel 
from CVS which explicitly checks for this combination of c3000 and 
Visualize EG combo and avoids to initialize it. For all other 
combinations of workstations and graphic cards this check isn't 
done and the graphic card will be initialized.
(PS: This should be added to the 0.9.3 FAQ!)

Helge

On Thursday 13 December 2001 14:37, Edward Alfert wrote:
> Thanks for the reply... Following is the entire dmsg...
> I notice it twice says "I'm not trying to set up your PCI graphics card
> now... It would freeze your machine."
>
> Linux version 2.4.9-32 (root@paer) (gcc version 3.0.2 (Debian)) #1 Fri
> Nov 30 19
> .....
> STI PCI ROM enabled at 0xf1e00000
> PCI graphic ROM found at f1e00000 (2048 kB), fb @ f6000000 (32 MB)
> PCI region 0: f6000000 with 32768 kB
> PCI region 1: 00000000 with 0 kB
> PCI region 2: 00000000 with 0 kB
> PCI region 3: 00000000 with 0 kB
> PCI region 4: 00000000 with 0 kB
> PCI region 5: 00000000 with 0 kB
> PCI region 6: f1e00000 with 2048 kB
> PCI region 7: 00000000 with 0 kB
> PCI region 8: 00000000 with 0 kB
> PCI region 9: 00000000 with 0 kB
> PCI region 10: 00000000 with 0 kB
> PCI region 11: 00000000 with 0 kB
> Trying PCI STI ROM at f1e00000, PCI hpa at f6000000
> I'm not trying to set up the PCI graphic card now... It would freeze
> your machine
> Unable to handle STI device 'PCI device 103c:1008 (Hewlett-Packard
> Company)'
>....
> -----Original Message-----
> From: Helge Deller [mailto:helge.deller@sap.com]
> Sent: Thursday, December 13, 2001 4:10 AM
> To: Edward Alfert
> Subject: Re: [parisc-linux] What keywords should I use to find the
> answer?
>
> On Thursday 13 December 2001 05:42, Edward Alfert wrote:
> > ?) Does 0.9.3 support the graphics card on a c240? Or only serial?
>
> Hi Edward,
>
> You maybe should have mentioned the name of the graphic card in
> your machine.
> Boot up in serial-console mode and give us the inventory listing (or the
> whole
> dmesg) which the pa-kernel prints right at the beginning.
>
> Greetings,
> Helge

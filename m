From: Helge Deller <deller@gmx.de>
Subject: stifb broken on PCI - was: Upgrade woes - was Re: install/update/upgrade
 dance
Date: Sat, 25 May 2013 00:23:40 +0200
Message-ID: <519FE86C.8070701@gmx.de>
References: <519DB0F2.8000801@landcomp.net> <trinity-c943681e-ac4b-4abc-aee6-081444e7a9a7-1369296347943@3capp-gmx-bs41> <519E697A.1030805@landcomp.net> <519E8BEA.9030309@gmx.de> <519E9A78.40302@landcomp.net> <519EA19B.5050105@landcomp.net> <BLU0-SMTP870BAEC5E9E44730F1075F97AA0@phx.gbl> <519EB625.5070508@landcomp.net> <BLU0-SMTP46578E0659F1ECF756D7DC97AB0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: debian-hppa@lists.debian.org,
	John David Anglin <dave.anglin@bell.net>,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP46578E0659F1ECF756D7DC97AB0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 05/24/2013 02:51 AM, John David Anglin wrote:
> On 23-May-13, at 8:36 PM, Dave Land wrote:
> 
>> May 23 10:48:21 hpviz kernel: [    1.880000] STI GSC/PCI core graphics driver V$
>> May 23 10:48:21 hpviz kernel: [    1.880000] sti 0000:01:01.0: enabling SERR an$
>> May 23 10:48:21 hpviz kernel: [    1.884000] STI PCI graphic ROM found at fffff$
>> *May 23 10:48:21 hpviz kernel: [    1.952000] Unable to handle STI device '0000:$*
> 
> 
> This is exactly the problem that I see.

Me too :-(

On my 32bit "old" parisc machine 715/64 with GSC bus it still works.

But on all my PCI machines it fails the same way.
Same result as Dave: pdc_add_valid() returns error.

For me it seems something has changed wrt PCI.

I tried to debug it somewhat, but I have no clue.
Maybe this commit is somewhat related: ?

commit 39c2462e163448c7df466c7262109ec6a24d5f88
Author: Bjorn Helgaas <bhelgaas@google.com>
Date:   Thu Feb 23 20:19:03 2012 -0700
    parisc/PCI: get rid of device resource fixups
    Tell the PCI core about host bridge address translation so it can take
    care of bus-to-resource conversion for us.

Helge

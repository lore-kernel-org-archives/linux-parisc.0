Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id A5D8E484B
	for <parisc-linux@lists.parisc-linux.org>; Wed,  1 Oct 2003 07:52:38 -0600 (MDT)
Date: Wed, 1 Oct 2003 14:52:36 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: mmogenius@v8fiesta.co.uk
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] x86 on b2000
In-Reply-To: <1065000176.3f7a9cf0cbad2@webmail.v8fiesta.co.uk>
Message-ID: <Pine.LNX.4.58.0310011446560.27712@sal.ucc.ie>
References: <Pine.LNX.4.44.0308280022230.16696-100000@sal.ucc.ie>
 <1062062541.3f4dc9cd843ed@webmail.v8fiesta.co.uk>
 <1063733943.3f674ab751edb@webmail.v8fiesta.co.uk> <20030916174726.GC30906@dsl2.external.hp.com>
 <1063738987.3f675e6b22961@webmail.v8fiesta.co.uk> <20030917040849.GA11011@dsl2.external.hp.com>
 <3F683606.8000701@tiscali.be> <1065000176.3f7a9cf0cbad2@webmail.v8fiesta.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Wed, 1 Oct 2003 mmogenius@v8fiesta.co.uk wrote:

> Brilliant i now have X working on my B2000 with the Visuialize-EG Card...
>
> The way to use the 2nd card is to specify the BusID in the XF86Config-4 file.
>
> BusID      "PCI:1:1:0"
>
> Although I dont seem to be able to get the depth anywhere above 8... Does
> anyone have any thoughs on this.

Visualize-EG is a 8bit only card.

It can displake 'fake hi/true-colour' using HP's Color Recovery technology,
but hardly any non-HP software supports that (ie. I know only
of ImageMagick).

There is AFAIK no 24/32bit true colour PCI graphic cards that work on
Linux/PA-RISC in the moment. I'd love to hear that I'm wrong ...

Max

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from tyke.pjc.net (public1-leed3-6-cust141.leed.broadband.ntl.com [80.0.5.141])
	by dsl2.external.hp.com (Postfix) with ESMTP id 883F7482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  7 Jun 2002 01:34:01 -0600 (MDT)
Received: from patrick by tyke.pjc.net with local (Exim 3.35 #1 (Debian))
	id 17GEG0-0000X5-00
	for <parisc-linux@lists.parisc-linux.org>; Fri, 07 Jun 2002 08:34:00 +0100
Date: Fri, 7 Jun 2002 08:34:00 +0100
From: Patrick Caulfield <patrick@tykepenguin.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Probleme while compiling last CVS kernel.
Message-ID: <20020607073400.GC1053@tykepenguin.com>
References: <3CFF593A.18910E50@admin.france.hp.com> <20020606130006.GE1080@tykepenguin.com> <1023388448.3cffab201378e@webmail.tiscalinet.be> <20020606184327.GO1080@tykepenguin.com> <1023429951.3d004d3f0b639@webmail.tiscalinet.be> <1023434886.3d00608701c16@webmail.tiscalinet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
In-Reply-To: <1023434886.3d00608701c16@webmail.tiscalinet.be>
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

On Fri, Jun 07, 2002 at 09:28:07AM +0200, joel.soete@freebel.net wrote:
> Quoting joel.soete@freebel.net:
> 
> > Quoting Patrick Caulfield <patrick@tykepenguin.com>:
> > 
> > ...
> 
> > So surprised too ??
> 
> Not anymore, in fact all seems already include in ioctl32.
> 
> So I just have to find how to compile a 64bits kernel. There should it be some
> hack to bring it works.

The stuff that's in there is for LVM0.8, whereas LVM 1.0 is in the rest of the
kernel. The structures have changed slightly which is why it won't compile ATM.

patrick

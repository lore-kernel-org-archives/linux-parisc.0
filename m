Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 624A6482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  8 Apr 2002 09:03:16 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16uafm-0005M4-00; Mon, 08 Apr 2002 16:03:10 +0100
Date: Mon, 8 Apr 2002 16:03:10 +0100
From: Matthew Wilcox <willy@debian.org>
To: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Linux palinux 2.4.19-pre5-pa0 #2 Mon Apr 8 15:16:06 CEST 2002 parisc unknown
Message-ID: <20020408160310.G27547@parcelfarce.linux.theplanet.co.uk>
References: <1018277506.3cb1ae82d2cca@webmail.tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1018277506.3cb1ae82d2cca@webmail.tiscali.be>; from joel.soete@freebel.net on Mon, Apr 08, 2002 at 04:51:46PM +0200
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

On Mon, Apr 08, 2002 at 04:51:46PM +0200, joel.soete@freebel.net wrote:
> Hi all,
> 
> It seems to works just still have a problem with modules:
> 
> mkdir -p pcmcia; \
> find kernel -path '*/pcmcia/*' -name '*.o' | xargs -i -r ln -sf ../{} pcmcia
> if [ -r System.map ]; then /sbin/depmod -ae -F System.map  2.4.19-pre5-pa0; fi
> depmod: *** Unresolved symbols in
> /lib/modules/2.4.19-pre5-pa0/kernel/drivers/scsi/scsi_debug.o
> depmod: 	vmalloc
> make: *** [_modinst_post] Error 1
> Mon Apr  8 16:04:06 CEST 2002

You got a warning before this, something like `implicit declaration of
function vmalloc'.  ie you forgot to #include <linux/vmalloc.h>

-- 
Revolutions do not require corporate support.

Received: from mail.valinux.com (smtp-fwd.valinux.com [198.186.202.196])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id RAA11446
	for <parisc-linux@puffin.external.hp.com>; Tue, 21 Nov 2000 17:51:37 -0700
Received: from osmium.hdqt.valinux.com
	([10.3.1.14] helo=valinux.com ident=mail)
	by mail.valinux.com with esmtp (Exim 3.16 #1 (Debian))
	id 13yOAG-0005O0-00; Tue, 21 Nov 2000 16:53:32 -0800
Received: by valinux.com (Postfix, from userid 561)
	id 5B260AD0E; Tue, 21 Nov 2000 16:53:27 -0800 (PST)
Date: Tue, 21 Nov 2000 16:53:27 -0800
From: "H . J . Lu" <hjl@valinux.com>
To: Alan Modra <alan@linuxcare.com.au>
Cc: Ulrich Drepper <drepper@cygnus.com>, John Marvin <jsm@udlkern.fc.hp.com>,
        parisc-linux@puffin.external.hp.com, parisc-linux@thepuffingroup.com,
        binutils@sourceware.cygnus.com
Subject: Re: [parisc-linux] Use of the EI_OSABI field
Message-ID: <20001121165327.A12804@valinux.com>
References: <m3u290j488.fsf@otr.mynet.cygnus.com> <Pine.LNX.4.21.0011221042300.16860-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0011221042300.16860-100000@front.linuxcare.com.au>; from alan@linuxcare.com.au on Wed, Nov 22, 2000 at 11:13:29AM +1100
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Nov 22, 2000 at 11:13:29AM +1100, Alan Modra wrote:
> 
> > Anyway, the ABI value is zero unless you implement ELF extensions.
> 
> Exactly what is an "ELF extension"?  Anything outside gABI or

ELF extension is something whose interpretation is not documented in
neither gABI nor psABI. HP's old ELF is a good example since it didn't
implement DT_INIT/DT_FINI, but added DT_INIT_ARRARY/DT_FINI_ARRAY. A
normal ELF tool will have a hard time to interpret those fields and
their values.


H.J.

Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA03500
	for <parisc-linux@puffin.external.hp.com>; Fri, 15 Dec 2000 10:31:55 -0700
Sender: Jes.Sorensen@cern.ch
To: Matthew Wilcox <matthew@wil.cx>
Cc: Alan Modra <alan@linuxcare.com.au>, John Marvin <jsm@udlkern.fc.hp.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ldcw in __pthread_acquire
References: <200012151012.DAA05988@udlkern.fc.hp.com> <Pine.LNX.4.21.0012152235260.7608-100000@front.linuxcare.com.au> <20001215163714.A22147@parcelfarce.linux.theplanet.co.uk>
From: Jes Sorensen <jes@linuxcare.com>
Date: 15 Dec 2000 18:32:12 +0100
In-Reply-To: Matthew Wilcox's message of "Fri, 15 Dec 2000 16:37:14 +0000"
Message-ID: <d3ae9xmvz7.fsf@lxplus015.cern.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

>>>>> "Matthew" == Matthew Wilcox <matthew@wil.cx> writes:

Matthew> Can we move the __spinlock to be the first element of the
Matthew> struct, and then mark the struct as requiring 16-byte
Matthew> alignment?  i have the feeling this might `just work', since
Matthew> most structs will be allocated at 16-byte-aligned addresses
Matthew> anyway.

We probably cannot, we can however create our own version of the
header file for the parisc port.

Jes
(yuck yuck, I just hate linuxthreads)

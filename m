Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA12381
	for <parisc-linux@puffin.external.hp.com>; Tue, 28 Nov 2000 12:24:48 -0700
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: alan@linuxcare.com.au (Alan Modra), marteaut@esiee.fr,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Include trouble 
In-Reply-To: Your message of "Tue, 28 Nov 2000 12:37:28 EST."
             <200011281737.MAA24142@hiauly1.hia.nrc.ca>
References: <200011281737.MAA24142@hiauly1.hia.nrc.ca> 
Date: Tue, 28 Nov 2000 12:27:09 -0700
From: Paul Bame <bame@noam.fc.hp.com>
Message-Id: <E140qPF-0005T4-00@noam.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

= Hmm.  Most 32 bit systems use "unsigned int" rather than "unsigned long".

I will be happy to change it back to unsigned int.  The only reason
I used unsigned long is because it seems off_t wants to be, to a
first approximation, the word length of the machine, and 'long' does
that.

= Using "unsigned long" might cause problems with packages like libio.


= I know there is a problem if off_t is not the same as size_t.

What problem is that?  I'm working on a proposal for the palinux
type sizes at the moment.

One dilema is that off_t is supposed to
be good for file offsets, which these days means it should be 64 bits.
size_t refers to the sizes of objects which are expected to fit in
RAM, so should be the word size of the machine.  So there's a conflict
because one logic suggests 64-bit off_t and 32-bit size_t on 32-bit palinux,
but your statement suggests they should be the same size.  Any ideas?

However I'm leaning towards leaning with the older 32-bit off_t because
we might not want to be the first ones to fix all the problems with
making it 64 bits on a 32-bit machine.

	-P

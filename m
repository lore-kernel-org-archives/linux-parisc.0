Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA14906
	for <parisc-linux@puffin.external.hp.com>; Tue, 28 Nov 2000 13:23:32 -0700
Message-Id: <200011282024.PAA28233@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Include trouble
To: bame@noam.fc.hp.com (Paul Bame)
Date: Tue, 28 Nov 2000 15:24:26 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: alan@linuxcare.com.au, marteaut@esiee.fr, parisc-linux@thepuffingroup.com
In-Reply-To: <E140qPF-0005T4-00@noam.fc.hp.com> from "Paul Bame" at Nov 28, 2000 12:27:09 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> = Hmm.  Most 32 bit systems use "unsigned int" rather than "unsigned long".
> 
> I will be happy to change it back to unsigned int.  The only reason
> I used unsigned long is because it seems off_t wants to be, to a
> first approximation, the word length of the machine, and 'long' does
> that.

Agreed.

> = Using "unsigned long" might cause problems with packages like libio.
> 
> 
> = I know there is a problem if off_t is not the same as size_t.
> 
> What problem is that?  I'm working on a proposal for the palinux
> type sizes at the moment.

It is simply dumb coding that hasn't been fixed.  There are inconsistencies
between the interface declarations and implementations.  The old libio
is on the way out.

> One dilema is that off_t is supposed to
> be good for file offsets, which these days means it should be 64 bits.
> size_t refers to the sizes of objects which are expected to fit in
> RAM, so should be the word size of the machine.  So there's a conflict
> because one logic suggests 64-bit off_t and 32-bit size_t on 32-bit palinux,
> but your statement suggests they should be the same size.  Any ideas?

Only, because of poorly written legacy code.  I agree that off_t should
be 64 bits on 32 bit platforms today.

> However I'm leaning towards leaning with the older 32-bit off_t because
> we might not want to be the first ones to fix all the problems with
> making it 64 bits on a 32-bit machine.

Maybe it isn't that bad because I noticed at least one port used unsigned
long long for off_t.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)

Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id HAA12418
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 Nov 1999 07:44:30 -0700
Date: Wed, 24 Nov 1999 11:00:32 +0100
From: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
To: Stan Sieler <sieler@allegro.com>
Cc: Philipp Heinrich Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Progress
Message-Id: <19991124110032.I1009@mathe.stud.uni-erlangen.de>
References: <19991123190339.H1009@mathe.stud.uni-erlangen.de> <199911232111.NAA25923@opus.allegro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199911232111.NAA25923@opus.allegro.com>
List-ID: <linux-parisc.vger.kernel.org>

> If interrupts can happen (and get serviced), a CR16 loop is inherently
> unreliable.  If you're looping until CR16 becomes >= some value, X, then
> you might find that CR16 goes:   n, n+2, n+3, n-10000, n-9998, ...
> 
> I.e., the interrupt servicing could take enough time that the value in
> CR16 becomes misleading.  If the new CR16 is < the last seen one, is it
> simply because it "rolled over", or because an interrupt came in and 
> you've spent an unknown amount of time doing other things?

Look at the loop.  What we do is basically

	cr16 = mfctl(16);
	while(((cr16+loops)-mfctl(16))>0);

Which works well, unless CR16 suddenly changes by 2^31 or more.  This
would correspond to 10-20 seconds spent in an interrupt handler which
is unlikely (and will have negative effects on our timer interrupt as
well).

> OTOH, I like the idea of using a drastic change to CR16 as a signal
> that "something happened", and consider using that as a clue 
> to prematurely exit a counter-based loop.  In that scenario, I'd
> expect a routine like:   delay (int loops,  int premature_exit_ok),
> which would let the caller decide if a premature (CR16 change based)
> exit was allowable.

And what exactly would be the advantage ?

	Philipp Rumpf

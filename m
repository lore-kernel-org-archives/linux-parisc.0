Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web12504.mail.yahoo.com (web12504.mail.yahoo.com [216.136.173.196])
	by dsl2.external.hp.com (Postfix) with SMTP id 667224829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 17 Sep 2002 19:37:06 -0600 (MDT)
Message-ID: <20020918013704.37761.qmail@web12504.mail.yahoo.com>
Date: Tue, 17 Sep 2002 18:37:04 -0700 (PDT)
From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Subject: Re: [parisc-linux] Re: Status SPIFI SCSI
To: parisc-linux@lists.parisc-linux.org
In-Reply-To: <98404C4A-CA77-11D6-8C42-0030656F07A2@esiee.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

Good luck trying to find a pinout for the chips on the cards....I can't
even find a block diagram of the cards on the HP internal websites.  As
a sidenote, I was talking to one of my customers this evening that had
dealings with a contractor to HP that was involved in the original
development of the HP-PB devices.  I found an E-mail address for him in
the HP address book and asked him if he would mind us bouncing ideas
off of him.  Waiting to see what he says or if I get a responce.

derek

--- Thibaut VARENE <varenet@esiee.fr> wrote:
> 
> Le mardi, 17 sep 2002, à 20:33 Europe/Paris, Christoph Plattner a
> écrit 
> :
> 
> Hi Christoph,
> > Hello Ryan,
> >
> > I think usinf the logic analyser will not help you on the
> > SCSI bus. You need the logic analyser on the SPIFI chip!!!
> That's not a problem,
> atm we have a 16channels analyser (we can have up to 128 if needed),
> we tried using the HP 2423A SCSI preprocessor, but ours seems b0rken,
> therefore we decided to plug directly onto the scsi board.
> 
> So plugging onto SPIFI chip shouldn't be a pb, as long as we have its
> 
> pinout,
> so that we can isolate signals we're trying to find.
> 
> So if you can provide us with the pin numbers we should plug on,
> that would help a lot ! :)
> >
> > As I already mentioned in another mail, I think, we
> > DO NOT access the real device. As I have mentioned,
> > we only read out 0x0000ff00 at each address and we
> > "write" the SCSI command in an invalid space ! So this
> > is "OK", that the chip do not produce any interrupts !
> >
> > I think, this is a very basic problem of the bus or
> > i/o bus initilization or the Loquix init, or whatever.
> >
> > I do not expect any frame on the SCSI output !
> >
> > Bye
> > Christoph
> >
> >

__________________________________________________
Do you Yahoo!?
Yahoo! News - Today's headlines
http://news.yahoo.com

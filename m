Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mgw-x4.nokia.com (mgw-x4.nokia.com [131.228.20.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8BAFF482E
	for <parisc-linux@lists.parisc-linux.org>; Tue,  5 Aug 2003 08:15:39 -0600 (MDT)
Received: from esvir04nok.ntc.nokia.com (esvir04nokt.ntc.nokia.com [172.21.143.36])
	by mgw-x4.nokia.com (Switch-2.2.6/Switch-2.2.6) with ESMTP id h75EFcJ06377
	for <parisc-linux@lists.parisc-linux.org>; Tue, 5 Aug 2003 17:15:38 +0300 (EET DST)
Received: from esebh003.NOE.Nokia.com (unverified) by esvir04nok.ntc.nokia.com
 (Content Technologies SMTPRS 4.2.5) with ESMTP id <T63df84191aac158f24077@esvir04nok.ntc.nokia.com> for <parisc-linux@lists.parisc-linux.org>;
 Tue, 5 Aug 2003 17:15:38 +0300
Received: (from mnahkola@localhost)
	by aurinko.ntc.nokia.com (8.11.6/8.11.6) id h75EFbK21044
	for parisc-linux@lists.parisc-linux.org; Tue, 5 Aug 2003 17:15:38 +0300 (EEST)
Date: Tue, 5 Aug 2003 17:15:37 +0300
From: Nahkola Mikko <mnahkola@trinms01.ntc.nokia.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Terminfo/termcap for a 70096 ...
Message-ID: <20030805141536.GW14491@aurinko.ntc.nokia.com>
References: <03Aug5.152448cest.119163@ns.hiscom.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <03Aug5.152448cest.119163@ns.hiscom.nl>
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

On Tue, Aug 05, 2003 at 03:04:24PM +0200, ext "Beerse, Corné" wrote:

> > From: Nahkola Mikko [mailto:mnahkola@trinms01.ntc.nokia.com]

> > I tried to ask this question in the comp.sys.hp.hpux newsgroup once but 
> > didn't get any useful answers... anyone here know better?
 
> The /etc/termcap file on a RedHat 7.3 machine does contain a bunch of HP
> terminals, including 700 series like 700 44 and 700 92. I think the latter
> one will suit your needs. There are even more. As far as I know, it all ends
> in hpterm, the hp-terminal emulator (xterm equivalent) for X11 (vue) with
> similar capabilities as the 700 series terminals.

Um. I don't have a RedHat here ... well, there's a close-enough copy that 
I could check.

Yes, the 70092 is probably close enough. Haven't run into any differences 
around here and we have a couple of those too.
 
> Unfortunatly, while installing DebianWoody on a D370, I found none of them
> in the terminfo database (and no termcap file). And the HP700/96 came with
> the D370. I know one thing to do after finalizing the install....

That'd be good to have, yes, and even better if the installer knew how to 
use it too. And I _did_ install the terminfo entry myself ... 

> > (yes, I know, this is probably specifically _not_ a problem on 
> > parisc-linux as all the parisc stuff is supposed to have a HP-UX license 
> > in the first place, for some version of HP-UX.)
> > 
> > Is it legal to copy terminfo and termcap entries (from HP-UX in this 
> > case)?
> 
> I don't think it is illegal to tune any system to use HP hardware with a
> published interface and I think the manual of the terminal clearly publishes
> the codes as used in the termcap or terminfo files.

The "User's Manual" (part no. 5959-5071) only seems to publish some of 
them, not all. It certainly doesn't say what the thing _transmits_ 
as control characters, and such ...

I haven't seen the "Reference Manual" anywhere. (5959-5072) That'd be the 
one to find, probably.

The c1099a User's Manual isn't any more help either.

> > The problem is that HP-UX is pretty much the only thing that comes with a 
> > terminfo entry for a 70096, and we have a bunch of those that  could be 
> > useful on other systems too ... except that the scrollback doesn't work 
> > in the emulation modes. 

> Some settings of $TERM that come to mind include 'hpterm', 'hp700',
> 'hp70092'. I recal I've used them between HP-UX and Solaris machines, hence
> Solaris also might have suitable termcap or terminfo entries.

I don't think I've managed to find them.

At least it doesn't get right by default on the things that I've tried. 
Not sure which ones I've tried them on, Sun, DEC/Compaq, IBM, whatever 
... at least everything seems to default to VT100 if they can't figure 
out what it is. Even HP-UX, occasionally.

> > Oh, and about the cursor keys on the 70096, if I were to put 
> > them in the 
> > "application" mode, would that help with bash et al.? They seem to be 
> > working in swinstall and such on HP-UX ... but the default 
> > mode seems to 
> > be non-transmitting, right? (yes, I could use that too myself, and 

> don't know, just put the terminal in em220 (vt220 emulation) mode to install
> debian.

I did. 

But it might be better if the Debian installer could be made to handle 
the native mode too.


-- 
Mikko Nahkola   <mikko.nahkola@nokia.com>
Tre-IN sysadmin <mnahkola@trein.ntc.nokia.com>

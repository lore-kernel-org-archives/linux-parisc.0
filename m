Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA16515
	for <parisc-linux@puffin.external.hp.com>; Tue, 25 Jan 2000 12:36:23 -0700
Date: Tue, 25 Jan 2000 20:37:10 +0200 (EET)
From: Hannu Martikka <martikka@stybba.ntc.nokia.com>
To: "willy@thepuffingroup.com" <willy@thepuffingroup.com>
cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] 715 problem
In-Reply-To: <20000125142243.B32390@thepuffingroup.com>
Message-ID: <Pine.HPX.4.21.0001252026280.15648-100000@gamgee.ntc.nokia.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 25 Jan 2000, willy@thepuffingroup.com wrote:

> On Tue, Jan 25, 2000 at 07:38:01PM +0200, Hannu Martikka wrote:
> > I tried the linux-2.3 latest kernel (ramdisk.bin-20000118a) from CVS with
> > 715/80. I didn't get shell prompt. It seems to end up with somekind of
> > endless loop.
> 
> The endless loop isn't a problem; that's `debugging the switch_to' code.
> prumpf, can we get rid of this now or is it still important?  I _think_
> you'll find you are actually at a prompt, it's just not obvious because
> of the messages.
Hmmm... It definetly was not obvious :)
At least I'm not able to write anything (no echo) that would cause
any response from system (except those same debug messages over and over
again).


> [...]
> 
> > DQ0KDQ0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
> > LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0NCkJvb3RS
> > b20gVmVyc2lvbiAgICAxLjQgIA0NCk1lbW9yeSBTaXplOiAgMjU2IE1CDQ0K
> 
> many many lines like this which I can't decode.  It's tagged as text/plain;
> should it be mime or something?
Sigh... Some over-eager sendmail managed to add extra headers to my email
:(
Just edit the email and remove extra 
	Content-Transfer-Encoding: 8bit
from the headers of the attachements.
I could repost it if you cannot open it.

- Goodi
"The linuX Files -- The Source is Out There."
ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø,¸¸,ø¤º°`°º¤ø¤º°`°º¤ø,¸¸,ø¤º°

Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep14-int.chello.at (viefep14-int.chello.at [213.46.255.13])
	by dsl2.external.hp.com (Postfix) with ESMTP id 39D01487E
	for <parisc-linux@lists.parisc-linux.org>; Fri, 15 Feb 2002 15:45:31 -0700 (MST)
Message-ID: <3C6D8F88.D77A6622@gmx.at>
Date: Fri, 15 Feb 2002 23:45:28 +0100
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: Helge Deller <deller@gmx.de>
Cc: Christian Suder <csuder@cisco.com>,
	James S <smith-james@home.com>, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Power LED
References: <002101c1b5ee$b5f8a620$02c1a8c0@james.co.uk> <20020214231312.37ca1c9e.csuder@cisco.com> <200202150826.29543.deller@gmx.de>
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

On the Apollo machine (720/50, 730, etc) the Power-Switch is NOT 
under software control. The switch is simple a "shortcut to ground"
and is a direct input line of the power supply unit (I know this,
because I have troubles with my power supply and studied the electrical
wirering, etc.).

On E55 I also think, that the switch is controlling the power supply
also, as I can switch off at any moment in Linux and HP-UX.

In the 712, the switch is definitly under software control, as the
software can simple ignore it ... and much more...

Bye
Christoph P.


Helge Deller wrote:
> 
> On Friday 15 February 2002 08:13, Christian Suder wrote:
> > On Fri, 15 Feb 2002 02:02:19 -0500
> > "James S" <smith-james@home.com> wrote:
> > > is it possible to hook the power button to the shutdown command like it
> > > is in hp-ux ?
> >
> > The LED and the powerswitch work as expected on my 712/80 at least since
> > the 0.9.3 ISO timeframe.
> 
> It depends.
> I know the power button works correctly on my c3000 and 715/64. Both
> systems shuts down the computer cleanly.
> But on another Apollo/50 machine (712/50 or 715/50 - I don't remember)
> pressing the power-button turns off the machine immediately. This is a bug
> and should be fixed if possible.
> 
> Helge
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at

Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id AAA19633
	for <parisc-linux@puffin.external.hp.com>; Wed, 10 Nov 1999 00:56:08 -0700
Date: Wed, 10 Nov 1999 04:07:54 -0500 (EST)
From: Alex deVries <adevries@thepuffingroup.com>
To: Philipp Rumpf <Philipp.H.Rumpf@mathe.stud.uni-erlangen.de>
cc: Matthew Wilcox <Matthew.Wilcox@genedata.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] HIL status
In-Reply-To: <19991110011409.A17550@mathe.stud.uni-erlangen.de>
Message-ID: <Pine.LNX.4.10.9911100403530.11043-100000@vodka.thepuffingroup.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 10 Nov 1999, Philipp Rumpf wrote:
> We do not know how the PS/2 keyboard (identical to AT keyboard I would hope)
> self-test procedure is.  We do know that we can send a command to the keyboard
> to cause it to start a self-test, and we do know that the Intel keyboard con-
> troller has a separate bit in the status register indicating that the keyboard
> self-test succeeded.
> 
> What we can do (and the Intel keyboard controller cannot) is to manually control
> and read the PS/2 data and clock lines, so I suspect we'll have to make use of
> this to successfully do a keyboard self-test.

For the time being we can just ignore this test.  I'm not entirely sure
that there's an easy way to actually test it.  Right now I coded it to
test the controller, but not the keyboard.

> If you know of any documentation describing what happens during an AT keyboard
> self-test, please tell us.

Note, this is NOT the 8042.  It has it's own test sequence that the PS/2
keyboard itself does not handle. The next person to point me to 8042 docs
will receive one (1) boot to the head.

- Alex

Return-Path: <pjlahaie@sims-ha.videotron.net>
Date: Wed, 17 Feb 1999 21:53:53 -0500
From: "Paul J.Y. Lahaie" <pjlahaie@ottawa.com>
Subject: Re: [hppa-linux] bootstrap test
Sender: pjlahaie@sims-ha.videotron.net
To: hppa-linux@puffingroup.com
Message-id: <36CB80C1.A9FEDC4A@ottawa.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
References: <199902172309.RAA27695@equator.com>
Resent-Message-ID: <"TxqmL.0.fv6.X3uos"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org

Jason Eckhardt wrote:
> 
> Greetings HPPA hacks:
> I have enclosed a simple bootstrap test binary for HPPA/Linux. At this point,
> it is not much more than a "hello world" type program but shows that we
> can get a bootstrap going.
> I would be grateful if one or two of you would test it on your systems. I have
> tested it on my C160 which is a PA2.0-based system and would like to make
> sure it works correctly on PA1.1 systems before doing more work.

> Your feedback would be appreciated, i.e. did it work or not on your system.
> Please send the CPU line as well.

    This is over bootp with a 712/60 (7100LC CPU)


HPPA/Linux Bootstrap Version 0.1
[jason@sathanas Tue Feb 16 16:48:50 CST 1999]
by Jason Eckhardt

CPU: ? (00000000)

Loading kernel...(not yet implemented)

It is now safe to reboot.
Testing mprintf (d) 123 = 123
Testing mprintf (s) jason = jason
Testing mprintf (c) A = A
Testing mprintf (x) 01020304 = 01020304

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.

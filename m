Return-Path: <hppa-linux@puffingroup.com>
Date: Mon, 22 Feb 1999 08:26:41 -0800 (PST)
From: Jason Eckhardt <jason@equator.com>
Message-Id: <199902221626.IAA12581@gatekeeper.equator.com>
To: hppa-linux@puffingroup.com
Subject: Re: [hppa-linux] Bootstrap
Resent-Message-ID: <"vWJZ33.0.yp.8QOqs"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org


>  Hello,
>
>  tested the bootstrap on a 9000/725 , and it runs,
>  gives processor as 000000
>
>  / ls.
>

  Thanks for the data.
  Also, I figured out why on some systems the CPUID is 0. Apparently, the
  PDC call for determining CPUID was only recently added.
  The C-class PDCs all have it, but most of the earlier 700's don't.

  Jason.

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.

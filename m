Return-Path: <hppa-linux@puffingroup.com>
Date: Thu, 18 Feb 1999 10:01:00 -0600
From: Jason Eckhardt <jason@equator.com>
Message-Id: <199902181601.KAA01190@equator.com>
To: hppa-linux@puffingroup.com
Subject: [hppa-linux] Bootstrap test results
Resent-Message-ID: <"_o6Yy3.0.X47.Af3ps"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org


Thanks to everyone who ran the bootstrap test and responded!

The bootstrap worked on 5 of 6 systems tested:
1) 715/75         *
2) 777 (C110)
3) 816/E35        *
4) 712/60         *
5) 780 (C160)

* For some reason, these systems returned CPUID was 00000000 (which I believe
  to be invalid). Maybe on these
  the cpuid must be obtained in a different way than the PDC routine I used.
  
The one failure was on an A180. I don't know anything about this system,
so I'm not sure what's happening. Anyone know what the CPU is on the
A180 or any other info?

These people booted successfully from disk, tape, and even rbootd!

Jason.

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.

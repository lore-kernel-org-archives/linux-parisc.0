Return-Path: <hppa-linux@puffingroup.com>
From: Steven Beattie <beattie@cse.ogi.edu>
Message-Id: <199902182005.MAA28191@church.cse.ogi.edu>
Subject: Re: [hppa-linux] Bootstrap test results
To: hppa-linux@puffingroup.com
Date: Thu, 18 Feb 1999 12:05:07 -0800 (PST)
In-Reply-To: <199902181601.KAA01190@equator.com> from "Jason Eckhardt" at Feb 18, 99 10:01:00 am
Content-Type: text
Resent-Message-ID: <"UMKEr3.0.O57.SY7ps"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org

> 
> Thanks to everyone who ran the bootstrap test and responded!
> 
> The bootstrap worked on 5 of 6 systems tested:
> 1) 715/75         *
> 2) 777 (C110)
> 3) 816/E35        *
> 4) 712/60         *
> 5) 780 (C160)
> 
> * For some reason, these systems returned CPUID was 00000000 (which I believe
>   to be invalid). Maybe on these
>   the cpuid must be obtained in a different way than the PDC routine I used.

I was successful using your bootstrap routine on a 720/50 using rbootd
(I believe a PA 7000 CPU). However it also returned a CPUID of 00000000.

Cool stuff.

Steve

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.

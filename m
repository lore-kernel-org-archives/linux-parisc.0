Return-Path: <hppa-linux@thepuffingroup.com>
From: Steven Beattie <beattie@cse.ogi.edu>
Message-Id: <199903121916.LAA02012@church.cse.ogi.edu>
Subject: Re: [hppa-linux] Boot #4 and source on ftp site
To: hppa-linux@thepuffingroup.com
Date: Fri, 12 Mar 1999 11:16:14 -0800 (PST)
In-Reply-To: <7DB180A629C1D211869F00A0C9F44A8C1805@retro-mail.fish.retrotech.com> from "Muench, David" at Mar 12, 99 09:23:58 am
Content-Type: text
Resent-Message-ID: <"JuQ4o.0.JY6.CWMws"@sod.res.cmu.edu>
Reply-To: hppa-linux@thepuffingroup.com
List-Id: linux-parisc.vger.kernel.org

> Boot test #4: This is essentially the same code as #3 but I have taken
> out some delays, modified the cache flush routines, and turned
> verbose (debug) mode back on. I want to make sure that not having the delays
> makes no difference and that no characters get dropped when there is a lot
> of text (as in debug mode). Please let me know if the test still passes
> as before. Hopefully this will be the last test for a while. Kernel work
> comes next.

Works like a champ on a 720/50 via rbootd. Much snappier than the third
bootstrap test.

Steve

-------------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@thepuffingroup.com with
`unsubscribe' as the subject.

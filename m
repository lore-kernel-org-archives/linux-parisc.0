Return-Path: <hppa-linux@puffingroup.com>
From: Richard "J." Rauenzahn <rrauenza@cup.hp.com>
Message-Id: <199902192128.NAA12844@hairball.cup.hp.com>
Subject: Re: [hppa-linux] Partitioning proposal for boot loader
To: hppa-linux@puffingroup.com
Date: Fri, 19 Feb 1999 13:28:37 -0800 (PST)
Cc: jason@equator.com
In-Reply-To: <199902191929.NAA11346@equator.com> from Jason Eckhardt at Feb "19," 1999 "01:29:01" pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Resent-Message-ID: <"ww2c43.0.zY7.cXTps"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org


> I propose that for the near-term, we use a simple PC-like partition scheme
> for HPPA/Linux. In the future, once Linux is up and running,
> we can work on co-existing with HP-UX on the same physical disk (see below
> for more on this). This will keep the bootloader very small and simple,
> and allow us to quickly move to working on the hard part, the actual kernel.

My personal opinion is that they should go on seperate physical disks.
If I install two versions of HPUX on a box, I use seperate disks.

If you want to put them on the same disk, this means you can't use LVM
under HPUX, or that Linux has to support HP's LVM.

Rich

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.

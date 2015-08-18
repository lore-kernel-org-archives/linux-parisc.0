From: John David Anglin <dave.anglin@bell.net>
Subject: Re: bad address in handle_percpu_irq
Date: Mon, 17 Aug 2015 21:30:14 -0400
Message-ID: <BLU436-SMTP1851BC069EDCD672D8DF7C97780@phx.gbl>
References: <55D0313E.3090602@gmail.com> <55D06863.1090506@gmail.com> <55D0E295.2070000@gmx.de> <CAFk90B-eLz+wVavRA07SA6bVt1EUaFsWd6Xs8DsR_m73OD-kWg@mail.gmail.com> <CAFk90B_v5A-S-5gofZ7tSO=wkb9LF860LLX5OH9vkNzV9igGyA@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset="us-ascii"
Cc: Helge Deller <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Graham Gower <graham.gower@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAFk90B_v5A-S-5gofZ7tSO=wkb9LF860LLX5OH9vkNzV9igGyA@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2015-08-17, at 8:55 AM, Graham Gower wrote:

> Disabling systemd appears to mitigate this issue. I was getting the
> panic most boots, now I haven't seen one in since switching back to
> sysvinit.

See the same on rp3440 with systemd-sysv.

It might be a kernel feature issue as the sibaris buildd machine seems to be
running okay with systemd-sysv.

With systemd-shim and cgmanager, cgmanager somtimes runs away and needs
restarting.  There are also annoying console messges like the following:

mx3210 login: systemd-logind[3571]: New seat seat0.
systemd-logind[3571]: Failed to start user service: Unknown unit: user@1000.service
systemd-logind[3571]: New session c1 of user dave.

Dave
--
John David Anglin	dave.anglin@bell.net




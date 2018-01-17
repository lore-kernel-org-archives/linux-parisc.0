From: Richard Biener <richard.guenther@gmail.com>
Subject: Re: [committed] hppa: Switch hppa-linux to caller copies ABI
Date: Wed, 17 Jan 2018 09:26:02 +0100
Message-ID: <CAFiYyc14x7_5vSndrwau7AyS9hyUj6SOu59HMV1B9XOZwZUFGg@mail.gmail.com>
References: <5A5EAE4F.6090200@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: GCC Patches <gcc-patches@gcc.gnu.org>,
        Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <5A5EAE4F.6090200@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Jan 17, 2018 at 3:00 AM, John David Anglin <dave.anglin@bell.net> wrote:
> The callee copies ABI used for 32-bit hppa causes no end of optimization
> issues and problems with
> OpenMP.  The hppa target is only in Debian unstable and gentoo.  In both
> cases, packages are
> rebuilt often.  So, Helge and I decided that it was better to break the ABI
> and accept whatever
> problems that result from the switch.
>
> Committed to trunk.

That deserves a warning in gcc-8/changes.html

Richard.

> Dave
>
> --
> John David Anglin  dave.anglin@bell.net
>

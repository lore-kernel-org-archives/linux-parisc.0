From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: vmlinux.lds:319: undefined symbol `THREAD_SIZE'
Date: Wed, 30 Sep 2009 22:05:41 -0400
Message-ID: <119aab440909301905v26cbeb76o91be0bd674461fbb@mail.gmail.com>
References: <200910010339.52904.elendil@planet.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: Frans Pop <elendil@planet.nl>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200910010339.52904.elendil@planet.nl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Sep 30, 2009 at 9:39 PM, Frans Pop <elendil@planet.nl> wrote:
> arch/parisc/kernel/vmlinux.lds:319: undefined symbol `THREAD_SIZE'
> referenced in expression
> make[5]: *** [.tmp_vmlinux1] Error 1

Fixed upstream?

http://git.kernel.org/?p=linux/kernel/git/kyle/parisc-2.6.git;a=commitdiff;h=f32ed3954c5e365907738b1206e849b6bbe9bcef

Cheers,
Carlos.

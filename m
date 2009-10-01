From: Frans Pop <elendil@planet.nl>
Subject: Re: vmlinux.lds:319: undefined symbol `THREAD_SIZE'
Date: Thu, 1 Oct 2009 05:35:38 +0200
Message-ID: <200910010535.39189.elendil@planet.nl>
References: <200910010339.52904.elendil@planet.nl> <119aab440909301905v26cbeb76o91be0bd674461fbb@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: linux-parisc@vger.kernel.org
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440909301905v26cbeb76o91be0bd674461fbb@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thursday 01 October 2009, Carlos O'Donell wrote:
> On Wed, Sep 30, 2009 at 9:39 PM, Frans Pop <elendil@planet.nl> wrote:
> > arch/parisc/kernel/vmlinux.lds:319: undefined symbol `THREAD_SIZE'
> > referenced in expression
> > make[5]: *** [.tmp_vmlinux1] Error 1
>
> Fixed upstream?
>
> http://git.kernel.org/?p=linux/kernel/git/kyle/parisc-2.6.git;a=commitdi
>ff;h=f32ed3954c5e365907738b1206e849b6bbe9bcef

Nope. With that patch applied I still get the error, even for an
'allnoconfig" build.

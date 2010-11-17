From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: HPMC in lba_pat_out8 on rp3440
Date: Tue, 16 Nov 2010 22:22:18 -0700
Message-ID: <20101117052218.GB27930@lackof.org>
References: <20101104153507.GA7198@lackof.org> <20101107193156.F14EF4E1C@hiauly1.hia.nrc.ca> <20101110033527.GA24762@hiauly1.hia.nrc.ca> <20101114234212.GA20422@hiauly1.hia.nrc.ca> <20101117022140.GA2110@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101117022140.GA2110@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Nov 16, 2010 at 09:21:41PM -0500, John David Anglin wrote:
> > kernel BUG at arch/parisc/kernel/unaligned.c:215!
...
> This ldd alignment error is not fixed using 4.4.5, so it is likely a
> kernel bug.

I agree. The kernel is expected to emulate/handle unaligned loads/stores.

I thought we had all that misaligned access handlers working years ago and
somewhere probably have a user space program to test it. Oh...ldd won't be
user space since we don't have a PA2.0 64-bit user space. LDD support
can't be as well tested.

On that note, can you try a 32-bit kernel? (SMP maybe)

grant

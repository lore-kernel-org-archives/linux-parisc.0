From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] QEMU Port (Help needed)
Date: Sun, 4 Jun 2006 17:48:17 -0400
Message-ID: <119aab440606041448t3952e3dfwf85f926ffdc5e441@mail.gmail.com>
References: <20060604160441.GA18082@miranda.arrow>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux@parisc-linux.org
To: "Stuart Brady" <sdbrady@ntlworld.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060604160441.GA18082@miranda.arrow>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 6/4/06, Stuart Brady <sdbrady@ntlworld.com> wrote:
> Hi,
>
> I've had a stab at porting QEMU to PA-RISC... I've uploaded a patch
> against QEMU 0.8.1 to:
>
>   http://homepage.ntlworld.com/wholehog/stuart/qemu/qemu-hppa-guest.diff
>
> It compiles, but I can't figure out why it's crashing.  Any ideas?

That's awesome to hear that you are working on QEMU for PARISC!
It would rock to have a fast simulator. Even a semi-hosted environment
would be a cool toy to play with.

Does QEMU crash?
Does the emulated userspace crash?

A couple of comments about your patch:

1. Remember 32-bit PARISC executables have both function pointers and
function descriptors.

2. The "gp" is r19, the "dp" is r27. I don't know what your reference
to the "__dlt" is?

3. You can copy testandset from glibc linuxthreads pthread.h

4. flush_icache_range can probably be copied from the kernel implementation.

Other than that, there are *all* sorts of things which could be wrong :)

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

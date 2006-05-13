From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: [parisc-linux] Re: [RFC] using 64bit wide registers with 32bit
	kernel
Date: Sat, 13 May 2006 18:33:15 +0200
Message-ID: <7d01f9f00605130933w3f83d4dcrbb2e96fd35031c68@mail.gmail.com>
References: <7d01f9f00605130841v6185b06dybae82c9f9c77e2b4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <7d01f9f00605130841v6185b06dybae82c9f9c77e2b4@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 5/13/06, Thibaut VARENE <T-Bone@parisc-linux.org> wrote:
> Hi pa,
>
> I've been writing a few optimized asm bits for ffmpeg, using MAX2
> insns and taking advantage of the fact that pa2.0 implements 64bit
> wide registers.
>
> NOTE: i'm not using a 64bit address space at all. I'm just taking
> advantage of the fact that GRs can hold 64bit, as per architecture
> design. MAX2 insns need the full 64bit width, for instance.
>
> Yet, Randolph pointed out that it's likely that upon context switch,
> the upper 32bit of the registers i'm using would be thrown away.
>
> Two options from there:
> 1) we claim what I'm trying to do should not be done on parisc-linux
> =3D> using ldd/std, MAX2 and other insns that rely on 64bit regs should
> be prohibited by binutils for non-wide code (currently gcc/binutils
> happily build my code with -mpa-risc-2-0, which generates level 2.0
> non wide code)

I take that back as I can see a reason to use them in userspace when
running a 64bit kernel, even though the generated code wouldn't work
with a 32bit kernel.
Yet, not being to use them (in particular MAX2) with a 32bit kernel on
pa2.0 cpus is quite sad, as we encourage our users to run 32bit
kernels on pa2.0 machines that can...

> 2) we claim what I'm trying to do should be possible on parisc-linux
> =3D> we need to fix context switching in 32bit kernels.
>
> Comments?

T-Bone
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

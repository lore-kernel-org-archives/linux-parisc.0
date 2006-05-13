From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] [RFC] using 64bit wide registers with 32bit kernel
Date: Sat, 13 May 2006 12:03:07 -0500
Message-ID: <1147539787.6632.7.camel@mulgrave.il.steeleye.com>
References: <7d01f9f00605130841v6185b06dybae82c9f9c77e2b4@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: parisc-linux@lists.parisc-linux.org
To: Thibaut VARENE <T-Bone@parisc-linux.org>
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

On Sat, 2006-05-13 at 17:41 +0200, Thibaut VARENE wrote:
> 1) we claim what I'm trying to do should not be done on parisc-linux
> => using ldd/std, MAX2 and other insns that rely on 64bit regs should
> be prohibited by binutils for non-wide code (currently gcc/binutils
> happily build my code with -mpa-risc-2-0, which generates level 2.0
> non wide code)

I really don't think doubling the size of our register file on all tasks
and doubling the size of the saved registers on stack for interruptions
is really a sensible thing to do just so some multi-media extension can
be made to work.

> 2) we claim what I'm trying to do should be possible on parisc-linux
> => we need to fix context switching in 32bit kernels.
> 
> Comments?

There is a third possibility, and that's to execute the instruction in
the kernel where there wouldn't be a danger of context switches, where
the return values could be packaged properly and where it could be
emulated if necessary.  It would be nice to use a vDSO for this, but I
suspect Carlos' lightweight semaphore infrastructure can be pressed into
service for this.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

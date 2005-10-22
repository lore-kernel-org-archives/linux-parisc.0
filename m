From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [parisc-linux] Ctrl-C bug again
Date: Fri, 21 Oct 2005 20:22:44 -0400
Message-ID: <20051022002244.GB18007@tachyon.int.mcmartin.ca>
References: <7d01f9f00510211609g3cf6f223i52c0f10a20f442c3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Thibaut VARENE <T-Bone@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <7d01f9f00510211609g3cf6f223i52c0f10a20f442c3@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Oct 22, 2005 at 01:09:02AM +0200, Thibaut VARENE wrote:
>  IIR: 0ee850b6    ISR: 0000000000000000  IOR: 0000000000024000
>  CPU:        1   CR30: 00000000f9400000 CR31: 0000000080000000
>  ORIG_R28: 0000000000093000
>  IAOQ[0]: pa_memcpy+0x88/0x2b0
>  IAOQ[1]: pa_memcpy+0x8c/0x2b0
>  RP(r2): 0x1e90
> Kernel panic - not syncing: Kernel Fault
>

I wonder... was snd-ad1889/alsa a module? 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
